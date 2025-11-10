-- Materialized view: distribuzione HASH per co-locare le join ricorrenti
CREATE MATERIALIZED VIEW dbo.mv_SalesByCatMonth
WITH (DISTRIBUTION = HASH(CategoryID))
AS
SELECT 
    dp.CategoryID,
    fs.MonthKey,
    SUM(fs.SalesAmount) AS Amt
FROM dbo.FactSales AS fs
JOIN dbo.DimProduct AS dp
  ON dp.ProductID = fs.ProductID
GROUP BY dp.CategoryID, fs.MonthKey;
GO

-- Manutenzione quando cresce l'overhead incrementale
ALTER MATERIALIZED VIEW dbo.mv_SalesByCatMonth REBUILD;