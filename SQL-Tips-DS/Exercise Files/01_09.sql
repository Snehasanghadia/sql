-- Date & Time Functions

-- Get total sales for the month and show the last day of the month
SELECT 
		EOMONTH(OrderDate) as 'Month'
	,	SUM(SalesAmount) as 'Sales'
FROM FactInternetSales
GROUP BY
		EOMONTH(OrderDate)
ORDER BY 1

-- Calculate the customer acquisition funnel
SELECT
		c.FirstName
	,	c.LastName
	,	c.DateFirstPurchase
	,	DATEDIFF(d,c.DateFirstPurchase,getdate()) as 'DaysSinceFirstPurchase' -- How long have they been a customer?
FROM DimCustomer c
ORDER BY 3 DESC


-- Calculate a Monthly average of customer tenure
SELECT
		EOMONTH(c.DateFirstPurchase) as 'MonthOfFirstPurchase' -- What month did they become a customer?
	,	DATEDIFF(d,EOMONTH(c.DateFirstPurchase),getdate()) as 'DaysSinceFirstPurchase' -- How long have they been a customer?
	,	COUNT(1) as 'CustomerCount' -- How manY customers are there for this month?
FROM DimCustomer c
GROUP BY EOMONTH(c.DateFirstPurchase)
ORDER BY 2 DESC


-- The data might not always be updated, so lets find the latest monthly sales amount

-- Get the most recent month
SELECT
		d.CalendarYear
	,	d.MonthNumberOfYear
	,	mdt.IsMaxDate
	,	sum(s.SalesAmount) as 'TotalSales'

FROM DimDate d
JOIN FactInternetSales s ON d.DateKey = s.OrderDateKey
LEFT JOIN (
		SELECT
			1 as 'IsMaxDate',
			MAX(OrderDate) as 'MaxDate'
		FROM
			FactInternetSales
	) mdt
	ON
		d.CalendarYear = YEAR(mdt.MaxDate)
	AND
		d.MonthNumberOfYear = MONTH(mdt.MaxDate)

GROUP BY
		d.CalendarYear,
		d.MonthNumberOfYear,
		mdt.IsMaxDate

ORDER BY
		1 DESC,2 DESC