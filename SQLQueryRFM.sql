SELECT TOP (1000) [ORDERNUMBER]
      ,[QUANTITYORDERED]
      ,[PRICEEACH]
      ,[ORDERLINENUMBER]
      ,[SALES]
      ,[ORDERDATE]
      ,[STATUS]
      ,[QTR_ID]
      ,[MONTH_ID]
      ,[YEAR_ID]
      ,[PRODUCTLINE]
      ,[MSRP]
      ,[PRODUCTCODE]
      ,[CUSTOMERNAME]
      ,[PHONE]
      ,[ADDRESSLINE1]
      ,[ADDRESSLINE2]
      ,[CITY]
      ,[STATE]
      ,[POSTALCODE]
      ,[COUNTRY]
      ,[TERRITORY]
      ,[CONTACTLASTNAME]
      ,[CONTACTFIRSTNAME]
      ,[DEALSIZE]
  FROM [Test1].[dbo].[sales_data_sample]

  Select Distinct [STATUS]
  from [dbo].[sales_data_sample];

  Select Distinct [PRODUCTLINE]
  from [dbo].[sales_data_sample]
  Order by [PRODUCTLINE];

  Select Distinct [COUNTRY]
  from [dbo].[sales_data_sample]

  Select Distinct[TERRITORY]
  from [dbo].[sales_data_sample]
  Order by [DEALSIZE]

  Select Distinct [PRODUCTLINE], Sum ([SALES]) AS Total_per_Product
  from [dbo].[sales_data_sample]
  Group by [PRODUCTLINE]
  Order by 2 desc;
  
  Select Distinct[YEAR_ID] , Sum ([SALES]) AS Total_per_Product
  from [dbo].[sales_data_sample]
  Group by [YEAR_ID]
  Order by 2 desc;

  Select Distinct [MONTH_ID]
  from [dbo].[sales_data_sample]
  Where YEAR_ID = 2003;

  Select [DEALSIZE], SUM (SALES) AS Total_Sales
  from [dbo].[sales_data_sample]
  Group by [DEALSIZE]
  Order by 2 desc;

  Select [MONTH_ID], SUM (SALES) AS Total_Sales
  from [dbo].[sales_data_sample]
  Where [YEAR_ID] = 2004
  Group by [MONTH_ID]
  Order by 2 desc;

  Select [PRODUCTLINE], SUM (SALES) AS Total_Sales
  from [dbo].[sales_data_sample]
  Where [YEAR_ID] = 2004 AND [MONTH_ID]= 11
  Group by [PRODUCTLINE]
  Order by 2 desc;

   Select [CUSTOMERNAME], SUM (SALES) AS Total_Sales, AVG (SALES) AS Average_Sales, 
   Count ([ORDERNUMBER]) AS Number_Of_Orders, 
   MAX([ORDERDATE]) AS Cx_lastdate_order,
   (Select MAX ([ORDERDATE]) From [dbo].[sales_data_sample]
   )As Most_Recent_day
     from [dbo].[sales_data_sample]
  Group by [CUSTOMERNAME]
  Order by 2 desc;

  Select [CUSTOMERNAME], SUM (SALES) AS Total_Sales, AVG (SALES) AS Average_Sales, 
   Count ([ORDERNUMBER]) AS Number_Of_Orders, 
   MAX([ORDERDATE]) AS Cx_lastdate_order,
   (Select MAX ([ORDERDATE]) From [dbo].[sales_data_sample]
   )As Most_Recent_day,
   DATEDIFF(dd,MAX([ORDERDATE]),(Select MAX ([ORDERDATE]) From [dbo].[sales_data_sample]
   ))As Recency
     from [dbo].[sales_data_sample]
  Group by [CUSTOMERNAME]
  Order by 7 desc;

  ;with RFM as (
    Select [CUSTOMERNAME], SUM (SALES) AS Total_Sales, AVG (SALES) AS Average_Sales, 
   Count ([ORDERNUMBER]) AS Number_Of_Orders, 
   MAX([ORDERDATE]) AS Cx_lastdate_order,
   (Select MAX ([ORDERDATE]) From [dbo].[sales_data_sample]
   )As Most_Recent_day,
   DATEDIFF(dd,MAX([ORDERDATE]),(Select MAX ([ORDERDATE]) From [dbo].[sales_data_sample]
   ))As Recency
     from [dbo].[sales_data_sample]
  Group by [CUSTOMERNAME]
   )
  Select r.*,
 NTILE(4) over (order by recency)  as RFM_Recency,
 NTILE(4) over (order by Number_Of_Orders)  as RFM_Frequency,
 NTILE(4) over (order by Total_Sales)  as RFM_Money
 From RFM r

 ;with RFM as (
    Select [CUSTOMERNAME], SUM (SALES) AS Total_Sales, AVG (SALES) AS Average_Sales, 
   Count ([ORDERNUMBER]) AS Number_Of_Orders, 
   MAX([ORDERDATE]) AS Cx_lastdate_order,
   (Select MAX ([ORDERDATE]) From [dbo].[sales_data_sample]
   )As Most_Recent_day,
   DATEDIFF(dd,MAX([ORDERDATE]),(Select MAX ([ORDERDATE]) From [dbo].[sales_data_sample]
   ))As Recency
     from [dbo].[sales_data_sample]
  Group by [CUSTOMERNAME]
   ),
   RFM_Calc AS 
   (
     Select r.*,
 NTILE(4) over (order by recency)  as RFM_Recency,
 NTILE(4) over (order by Number_Of_Orders)  as RFM_Frequency,
 NTILE(4) over (order by Total_Sales)  as RFM_Money
 From RFM r
   )
   Select C.*, (RFM_Frequency+RFM_Money+RFM_Recency) AS RFM_sum,
   (CAST(RFM_Recency AS varchar)+ CAST(RFM_Frequency AS varchar)+ CAST(RFM_Money AS varchar)) AS RFM_CONCAT
   from RFM_Calc C

    ;with RFM as (
    Select [CUSTOMERNAME], SUM (SALES) AS Total_Sales, AVG (SALES) AS Average_Sales, 
   Count ([ORDERNUMBER]) AS Number_Of_Orders, 
   MAX([ORDERDATE]) AS Cx_lastdate_order,
   (Select MAX ([ORDERDATE]) From [dbo].[sales_data_sample]
   )As Most_Recent_day,
   DATEDIFF(dd,MAX([ORDERDATE]),(Select MAX ([ORDERDATE]) From [dbo].[sales_data_sample]
   ))As Recency
     from [dbo].[sales_data_sample]
  Group by [CUSTOMERNAME]
   ),
   RFM_Calc AS 
   (
     Select r.*,
 NTILE(4) over (order by recency desc)  as RFM_Recency,
 NTILE(4) over (order by Number_Of_Orders)  as RFM_Frequency,
 NTILE(4) over (order by Total_Sales)  as RFM_Money
 From RFM r
   )
   Select C.*, (RFM_Frequency+RFM_Money+RFM_Recency) AS RFM_sum,
   (CAST(RFM_Recency AS varchar)+ CAST(RFM_Frequency AS varchar)+ CAST(RFM_Money AS varchar)) AS RFM_CONCAT
   INTO RFM_temp1
   from RFM_Calc C

   Select [CUSTOMERNAME], Recency, RFM_Recency, RFM_Frequency, RFM_Money, RFM_CONCAT
   from RFM_temp1

   Select [CUSTOMERNAME], Recency, RFM_Recency, RFM_Frequency, RFM_Money, RFM_CONCAT,
   Case
		When RFM_Concat IN (111, 112, 121, 122, 123, 132, 211, 212, 114)
		Then 'Lost costomers'
		When RFM_Concat IN (133,134,143,244,334,343,144) Then 'Slipping away Client'
		When RFM_Concat IN (311,411,331) then 'New Customer'
		When RFM_Concat IN (433,434,443,444,344) then 'Loyal customers'
	End RFM_segement from RFM_temp1
   

   Select [ORDERNUMBER], Count([ORDERNUMBER]) Rownumber
   From [dbo].[sales_data_sample]
   where [STATUS] = 'Shipped'
   Group by [ORDERNUMBER]

   Select * from [dbo].[sales_data_sample]
   Where [ORDERNUMBER]= 10125

   Select [ORDERNUMBER] from
   (
      Select [ORDERNUMBER], Count([ORDERNUMBER]) Rownumber
   From [dbo].[sales_data_sample]
   where [STATUS] = 'Shipped'
   Group by [ORDERNUMBER]
   ) AS SB
   Where Rownumber = 2

   Select [PRODUCTCODE] from [dbo].[sales_data_sample]
   Where [ORDERNUMBER] IN 
   (
	   Select [ORDERNUMBER] from
	   (
		  Select [ORDERNUMBER], Count([ORDERNUMBER]) Rownumber
	   From [dbo].[sales_data_sample]
	   where [STATUS] = 'Shipped'
	   Group by [ORDERNUMBER]
	   ) AS SB
		Where Rownumber = 2
   )
 

 Select ',' + [PRODUCTCODE] from [dbo].[sales_data_sample]
   Where [ORDERNUMBER] IN 
   (
	   Select [ORDERNUMBER] from
	   (
		  Select [ORDERNUMBER], Count([ORDERNUMBER]) Rownumber
	   From [dbo].[sales_data_sample]
	   where [STATUS] = 'Shipped'
	   Group by [ORDERNUMBER]
	   ) AS SB
		Where Rownumber = 2
   )

    Select ',' + [PRODUCTCODE] from [dbo].[sales_data_sample]
   Where [ORDERNUMBER] IN 
   (
	   Select [ORDERNUMBER] from
	   (
		  Select [ORDERNUMBER], Count([ORDERNUMBER]) Rownumber
	   From [dbo].[sales_data_sample]
	   where [STATUS] = 'Shipped'
	   Group by [ORDERNUMBER]
	   ) AS SB
		Where Rownumber = 2
   )
   For XML path ('')

   Select STUFF (
	   (Select ',' + [PRODUCTCODE] from [dbo].[sales_data_sample]
	   Where [ORDERNUMBER] IN 
	   (
		   Select [ORDERNUMBER] from
		   (
			  Select [ORDERNUMBER], Count([ORDERNUMBER]) Rownumber
		   From [dbo].[sales_data_sample]
		   where [STATUS] = 'Shipped'
		   Group by [ORDERNUMBER]
		   ) AS SB
			Where Rownumber = 2
	   )
	   For XML path ('')),1,1,''
   )

   Select distinct [ORDERNUMBER], stuff(
   	   (Select ',' + [PRODUCTCODE] from [dbo].[sales_data_sample] AS P
	   Where [ORDERNUMBER] IN 
	   (
		   Select [ORDERNUMBER] from
		   (
			  Select [ORDERNUMBER], Count([ORDERNUMBER]) Rownumber
		   From [dbo].[sales_data_sample]
		   where [STATUS] = 'Shipped'
		   Group by [ORDERNUMBER]
		   ) AS SB
			Where Rownumber = 2
	   )
	   AND P.ORDERNUMBER = X.ORDERNUMBER
	   For XML path ('')),1,1,'') AS Productcode from [dbo].[sales_data_sample] AS X
	   Order by 2 desc
    
	Select Distinct * from [dbo].[sales_data_sample]
	Where [PRODUCTCODE] = 'S18_2325'
  
