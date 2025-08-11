-- Partition function: assegna righe a intervalli per anno
-- (<=184 --> 2016, <=549 --> 2017, <=730 --> 2018, >730 --> successivi)
CREATE PARTITION FUNCTION [PartByYear] (INT)
  AS RANGE LEFT FOR VALUES (184, 549, 730);

-- Partition scheme: usa PartByYear e memorizza tutte le partizioni in PRIMARY
CREATE PARTITION SCHEME [SalesPartScheme]
  AS PARTITION [PartByYear] ALL TO ([PRIMARY]);

-- Crea la tabella Sales partizionata su OrderDateKey
CREATE TABLE Sales (
    CustomerKey   INT,
    EmployeeKey   INT,
    OrderDateKey  INT
    -- ecc.
) ON SalesPartScheme(OrderDateKey);

-- Vista aggregata con schemabinding per permettere indicizzazione
CREATE VIEW SalesByDateProdEmp
WITH SCHEMABINDING
AS
SELECT
    OrderDateKey,
    ProductKey,
    EmployeeKey,
    COUNT(*)        AS Cnt,
    SUM(SalesAmount) AS SalesAmount
FROM Sales
GROUP BY OrderDateKey, ProductKey, EmployeeKey;

-- Indice clustered UNIQUE sulla vista, allineato allo stesso schema di partizione
CREATE UNIQUE CLUSTERED INDEX UCI_SalesByDateProdEmp
  ON SalesByDateProdEmp (OrderDateKey, ProductKey, EmployeeKey)
  ON SalesPartScheme(OrderDateKey);