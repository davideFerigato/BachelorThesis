-- 1) CTAS: materializza una tabella intermedia co-locata sulle join ricorrenti
CREATE TABLE dbo.FactSales_hash
WITH
(
  DISTRIBUTION = HASH(ProductID),
  CLUSTERED COLUMNSTORE INDEX
)
AS
SELECT *
FROM dbo.FactSales_stage;  -- staging/caricamenti bulk
GO

-- 2) Materialized View: aggregazione riusabile (coerente con le join su ProductID, MonthKey)
CREATE MATERIALIZED VIEW dbo.mv_SalesAgg
WITH (DISTRIBUTION = HASH(ProductID))
AS
SELECT
  fs.ProductID,
  fs.MonthKey,
  SUM(fs.SalesAmount) AS Amt
FROM dbo.FactSales_hash AS fs
GROUP BY fs.ProductID, fs.MonthKey;
GO

-- 3) STATISTICS: istogrammi sulle colonne di filtro/join per stime corrette
CREATE STATISTICS S_FactSales_Product_Month
ON dbo.FactSales_hash(ProductID, MonthKey)
WITH FULLSCAN;   -- dopo bulk load/trasformazioni massicce
GO

-- 4) Temporary table di sessione: restringe il dominio (evita shuffle superflui)
CREATE TABLE #TopProducts (ProductID INT PRIMARY KEY);
INSERT INTO #TopProducts VALUES (101),(205),(309);
GO

-- 5) Verifica del query rewrite: la query NON cita la MV
EXPLAIN WITH_RECOMMENDATIONS
SELECT
  fs.ProductID,
  fs.MonthKey,
  SUM(fs.SalesAmount) AS Amt
FROM dbo.FactSales_hash AS fs
JOIN #TopProducts AS t
  ON t.ProductID = fs.ProductID
GROUP BY fs.ProductID, fs.MonthKey;
GO

-- 6) Monitoraggio overhead MV e manutenzione programmata
DBCC PDW_SHOWMATERIALIZEDVIEWOVERHEAD('dbo.mv_SalesAgg');
-- Se l'overhead_ratio cresce oltre la soglia operativa:
ALTER MATERIALIZED VIEW dbo.mv_SalesAgg REBUILD;
GO