-----------------------------------------------------------------------------------
---------------------------------- Data Exploration -------------------------------

-- Show all data
select *
from [Sales Data ]


-- Add New Column
select 
	year([Order Date]) as Year
from [Sales Data ]

alter table [Sales Data ]
add Year int

update [Sales Data ]
set Year = year([Order Date])



-- Remove trailing spaces in column City
select trim(city) from [Sales Data ]

update[Sales Data ]
set city = trim(city)


-- total sales
SELECT 
	FORMAT(sum(Sales), '0,000,000') AS sum_Profit,
	FORMAT(sum([Price Each]), '0,000,000') AS sum_each_order
FROM [Sales Data];



-- Number of requests
select 
	count(distinct([Order ID])) as count_customers
from [Sales Data ]



-- Show All Quantity For All Orders
select 
	sum([Quantity Ordered]) as count_quantity
from [Sales Data ]


-- Profit By Month
select
	FORMAT(sum(Sales),'000,000') as 'total profit',
	[Month Name]
from [Sales Data ]
group by [Month Name]
order by 'total profit' desc


-- Average Price For Each Prodact 
select 
	round(avg([Price Each]),2) as avg_per_product,
	Product
from [Sales Data ]
group by Product
order by avg_per_product desc ;



-- The Best Product For Sales
select top(10)
	sum([Quantity Ordered]) as Count_Quantity,
	Product
from [Sales Data ]
group by Product
order by Count_Quantity desc;


-- The Best Product For Profit
select top 10
	FORMAT(sum(Sales), '0,000,000') AS 'Total Profit',
	Product
from [Sales Data ]
group by Product
order by 'Total Profit' desc

-- The Best City For Sales
select 
	sum([Quantity Ordered]) as 'Total Quantity',
	City
from [Sales Data ]
group by City
order by 'Total Quantity' desc



-- The City Has larget profit
select 
	FORMAT(sum(Sales), '0,000,000') AS 'Total Profit',
	City
from [Sales Data ]
group by City
order by 'Total Profit' desc



-- The Best Month For Sales
select 
	round(sum([Quantity Ordered]),2) 'Total Quantity',
	[Month Name]
from [Sales Data ]
group by [Month Name]
order by 'Total Quantity' desc



-- The year with the largest sales
select 
	format(sum(Sales),'0,000,000') as sum_profit,
	format(sum([Quantity Ordered]),'000,000') as total_quantity,
	year
from [Sales Data ]
group by Year
order by sum_sales desc;



-- Show months for each year ---(2020 has one month)---
select 
	distinct([Month Name]),
	year
from [Sales Data ]
order by year



-- Number of products and total profit for each city
select 
	count(Product) as count_prod,
	format(round(sum(Sales),0),'0,000,000') as total_sales,
	Product
from [Sales Data ]
where City = 'San Francisco' --  change the city  ==> (San Francisco _ Los Angeles _ Portland 
-- Austin _ Seattle _ Atlanta _ Boston _ Dalla _ New York City)
group by Product
order by total_sales desc













