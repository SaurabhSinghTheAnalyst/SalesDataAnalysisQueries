--Cleaned Dim_product table--
SELECT 
  p.[productKey], 
  p.[productAlternateKey] AS ProductItemCode, 
  p.[EnglishProductName] AS [Product Name], 
  ps.EnglishProductSubcategoryName AS [Sub Category], 
  -- Joined in from sub category table
  pc.EnglishProductCategoryName AS Category, 
  -- Joined from category table
  p.[Color] AS [Product color], 
  p.[Size] AS [Product Size], 
  p.[ProductLine] AS [Product Line], 
  p.[ModelName] AS [Product Model Name], 
  p.[EnglishDescription] AS [Product Description], 
  ISNULL (p.status, 'Outdated') AS [Product Status] 
FROM 
  AdventureWorksDW2019.[dbo].[DimProduct] as p 
  LEFT JOIN AdventureWorksDW2019..DimProductSubcategory AS ps ON ps.ProductSubcategoryKey = p.ProductSubcategoryKey 
  LEFT JOIN AdventureWorksDW2019..DimProductCategory AS pc ON ps.ProductCategoryKey = pc.ProductCategoryKey 
order by 
  p.productkey asc
