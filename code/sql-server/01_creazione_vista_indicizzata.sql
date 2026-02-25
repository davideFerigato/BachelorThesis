-- Requisiti SET (estratto essenziale per viste indicizzate)
SET ANSI_NULLS ON; 
SET QUOTED_IDENTIFIER ON; 
SET ARITHABORT ON;
SET ANSI_WARNINGS ON; 
SET CONCAT_NULL_YIELDS_NULL ON; 
SET NUMERIC_ROUNDABORT OFF;
GO

-- Vista con SCHEMABINDING e COUNT_BIG(*) in presenza di GROUP BY
CREATE VIEW dbo.SalesAgg WITH SCHEMABINDING AS
SELECT 
    fs.ProductID,
    fs.MonthKey,
    COUNT_BIG(*)            AS CntRows,   -- richiesto per viste indicizzate con GROUP BY
    SUM(fs.SalesAmount)     AS Amt
FROM dbo.FactSales AS fs
GROUP BY fs.ProductID, fs.MonthKey;
GO

-- La materializzazione avviene creando come primo indice univoco cluster
CREATE UNIQUE CLUSTERED INDEX IX_SalesAgg_UC
    ON dbo.SalesAgg(ProductID, MonthKey);