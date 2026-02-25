-- Forzare l'uso dell'indice materializzato della vista quando la si cita nel FROM
SELECT 
    s.ProductID, s.MonthKey, s.Amt
FROM dbo.SalesAgg AS s WITH (NOEXPAND);

-- Impedire l'impiego di viste indicizzate nel piano (espansione forzata)
SELECT 
    fs.ProductID, fs.MonthKey, SUM(fs.SalesAmount) AS Amt
FROM dbo.FactSales AS fs
GROUP BY fs.ProductID, fs.MonthKey
OPTION (EXPAND VIEWS);