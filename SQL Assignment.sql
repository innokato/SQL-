SELECT*from dbo.adventurework_sales

SELECT*from dbo.adventureworks_products

select*from dbo.adventureworks_customers

select*from dbo.adventureworks_product_categories

select*from dbo.adventureworks_product_subcategories

SELECT*from dbo.adventureworks_territories


SELECT*from dbo.adventurework_sales sal
left join dbo.adventureworks_products pro on
sal.productkey = pro.productkey


--QUESTION 2
--a
select pro.productname, sum(sal.salesamount) as [Total Sales] from dbo.adventurework_sales as sal, dbo.adventureworks_products as pro
group by productname

--b
select productcolor, sum(taxamt) as [Total Tax Amount] from dbo.adventurework_sales, dbo.adventureworks_products
group by productcolor

--c
select pro.productname, sum(freight) as [Total Freight] from dbo.adventurework_sales as sal, dbo.adventureworks_products as pro
group by productname

--d
select productname, sum(productcost) as [Total Product Cost] from dbo.adventureworks_products
group by productname


--QUESTION 3
--a
Select sum(salesamount) as[Total Sales], sum(freight) as [Total Freight], terr.country from adventurework_sales sal
left join adventureworks_territories terr on
sal.salesterritorykey = terr.salesterritorykey
group by terr.country


--b
create view [Tax Per Country] as
Select sum(taxamt) as [Tax Amount], terr.country from adventurework_sales sal
left join adventureworks_territories terr on
sal.salesterritorykey = terr.salesterritorykey
group by terr.country


select sum("tax amount") as [Total Tax] from [Tax Per Country]


Select sum(taxamt)*100/2348694.23010005 as [Tax Amount Percentage], terr.region from adventurework_sales sal
left join adventureworks_territories terr on
sal.salesterritorykey = terr.salesterritorykey
group by terr.region


--QUESTION 4

select*from dbo.world_gdp_cleaned


--a
select country_territory, UN_estimate from world_gdp_cleaned
where un_region = 'Europe'

--b
select un_region, sum(world_bank_estimate) as[Total World Bank Estimate] from world_gdp_cleaned
where un_region <> '—'
group by un_region


--c
select un_region, avg(world_bank_estimate) as[Average World Bank Estimate] from world_gdp_cleaned
where un_region <> '—'
group by un_region
having avg(world_bank_estimate) >100000

--d
select country_territory, sum(world_bank_estimate) as[Total World Bank Estimate] from world_gdp_cleaned
group by country_territory
having sum(world_bank_estimate) >2000000

