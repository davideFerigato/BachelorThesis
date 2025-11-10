-- 1) PROFILARE: piano stimato e raccomandazioni
EXPLAIN WITH_RECOMMENDATIONS
SELECT
  fs.StoreID, fs.MonthKey,
  SUM(fs.SalesAmount) AS Amt
FROM dbo.FactSales AS fs
JOIN dbo.DimStore AS ds ON ds.StoreID = fs.StoreID
GROUP BY fs.StoreID, fs.MonthKey;

-- 2) PROGETTARE: MV che cattura join+aggregazione condivise, co-locata su StoreID
CREATE MATERIALIZED VIEW dbo.mv_SalesByStoreMonth
WITH (DISTRIBUTION = HASH(StoreID))
AS
SELECT
  fs.StoreID, fs.MonthKey,
  SUM(fs.SalesAmount) AS Amt
FROM dbo.FactSales AS fs
GROUP BY fs.StoreID, fs.MonthKey;

-- 3) VALIDARE: la query non cita la MV; ottimizzatore riscrive in automatico
EXPLAIN
SELECT
  fs.StoreID, fs.MonthKey,
  SUM(fs.SalesAmount) AS Amt
FROM dbo.FactSales AS fs
GROUP BY fs.StoreID, fs.MonthKey;
-- Atteso: piano che legge da dbo.mv_SalesByStoreMonth (auto-matching).

-- 4) MONITORARE: overhead incrementale e manutenzione programmata
DBCC PDW_SHOWMATERIALIZEDVIEWOVERHEAD('dbo.mv_SalesByStoreMonth');
-- Se overhead_ratio supera la soglia operativa:
ALTER MATERIALIZED VIEW dbo.mv_SalesByStoreMonth REBUILD;

-- 5) CACHE vs MV: attivare/disattivare la result-set cache per test comparativi
SET RESULT_SET_CACHING ON;   -- riuso solo full-result per query identiche
-- Eseguire N volte la stessa SELECT per osservare hit/miss della cache
SET RESULT_SET_CACHING OFF;  -- disabilita la cache, resta il riuso “parziale” via MV