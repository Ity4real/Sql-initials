SELECT TOP (1000) [City]
      ,[Country]
      ,[Population]
      ,[Latitude]
      ,[Longitude]
  FROM [Test1].[dbo].[North]

  Select Top (2) City, Population
  From North
  Where Country = 'Mexico'
  Order by population Desc