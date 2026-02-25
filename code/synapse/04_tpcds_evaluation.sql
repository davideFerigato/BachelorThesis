-- 1) BASELINE: profila query TPC-DS (es. Q64) e registra tempi
SET RESULT_SET_CACHING OFF;  -- evita riuso full-result nella baseline
EXPLAIN WITH_RECOMMENDATIONS
SELECT
  fs.ProductID, fs.MonthKey,
  SUM(fs.SalesAmount) AS Amt
FROM dbo.FactSales AS fs
JOIN dbo.DimDate   AS dd ON dd.DateKey = fs.DateKey
GROUP BY fs.ProductID, fs.MonthKey;
GO

-- Esecuzioni etichettate per analisi tempi (storico in sys.dm_pdw_exec_requests)
SELECT
  fs.ProductID, fs.MonthKey,
  SUM(fs.SalesAmount) AS Amt
FROM dbo.FactSales AS fs
JOIN dbo.DimDate   AS dd ON dd.DateKey = fs.DateKey
GROUP BY fs.ProductID, fs.MonthKey
OPTION (LABEL = 'TPCDS_Q64_BASE');
GO

-- 2) INTERVENTO: MV che cattura aggregazione condivisa; distribuzione HASH per co-locare join
CREATE MATERIALIZED VIEW dbo.mv_SalesByProdMonth
WITH (DISTRIBUTION = HASH(ProductID))
AS
SELECT
  fs.ProductID, fs.MonthKey,
  SUM(fs.SalesAmount) AS Amt
FROM dbo.FactSales AS fs
GROUP BY fs.ProductID, fs.MonthKey;
GO

-- 3) VALIDAZIONE: la query non cita la MV; ottimizzatore riscrive in automatico
EXPLAIN
SELECT
  fs.ProductID, fs.MonthKey,
  SUM(fs.SalesAmount) AS Amt
FROM dbo.FactSales AS fs
JOIN dbo.DimDate   AS dd ON dd.DateKey = fs.DateKey
GROUP BY fs.ProductID, fs.MonthKey;
GO

-- 4) MISURA POST-INTERVENTO: run etichettate per confronto tempi (media/mediana/varianza)
SELECT
  fs.ProductID, fs.MonthKey,
  SUM(fs.SalesAmount) AS Amt
FROM dbo.FactSales AS fs
JOIN dbo.DimDate   AS dd ON dd.DateKey = fs.DateKey
GROUP BY fs.ProductID, fs.MonthKey
OPTION (LABEL = 'TPCDS_Q64_AFTER_MV');
GO

-- 5) RACCOLTA KPI: tempi (avg/median/var) dalle esecuzioni etichettate
WITH runs AS (
  SELECT total_elapsed_time/1000.0 AS sec_elapsed
  FROM sys.dm_pdw_exec_requests
  WHERE label IN ('TPCDS_Q64_BASE','TPCDS_Q64_AFTER_MV')
    AND status = 'Completed'
)
SELECT
  AVG(sec_elapsed) AS avg_s,
  PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY sec_elapsed) AS median_s,
  VARP(sec_elapsed) AS var_s
FROM runs;
GO

-- 6) OVERHEAD MV: monitoraggio e manutenzione (DBCC OVERHEAD + REBUILD)
DBCC PDW_SHOWMATERIALIZEDVIEWOVERHEAD ('dbo.mv_SalesByProdMonth');
-- Se l'overhead_ratio supera la soglia operativa:
ALTER MATERIALIZED VIEW dbo.mv_SalesByProdMonth REBUILD;
GO

-- 7) CONFRONTO CON LA RESULT-SET CACHE (opzionale per evidenziare full-result vs rewrite)
SET RESULT_SET_CACHING ON;   -- abilitare per misure con cache attiva
-- Ripetere la SELECT etichettata e confrontare hit/miss e tempi rispetto alla MV.