-- Cleaned FACT_IntenetSales table-- 
SELECT 
[ProductKey],
[OrderDateKey],
[DueDateKey],
[ShipDateKey],
[CustomerKey],
[SalesOrderNumber],
[SalesAmount],
[orderDateKey]
FROM
AdventureWorksDW2019.[dbo].[FactInternetSales] as A
WHERE
LEFT (OrderDateKey, 4) >= YEAR(GETDATE()) - 2 -- Ensures we always only bring two years of date from extraction 
ORDER BY 
A.OrderDateKey ASC