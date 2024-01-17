SELECT TOP (1000) [id]
      ,[Title]
      ,[Director]
      ,[year]
      ,[Length_mintutes]
  FROM [master].[dbo].[Movies]
  Select Title, Director 
  From Movies
  Where Title Like 'Toy%' ;

  /*Praticing Queries*/
  Select Title, Director 
  From Movies
  Where Title Like 'toy_%' ;

Select Director
From Movies
ORDER BY Director ASC;

Select * from film
Select Distinct Director
From Film
ORDER BY Director ASC;

Select TOP (1) [Title],[Year]
from [dbo].[Film]
ORDER BY [Year] DESC;