SET SQL_SAFE_UPDATES = 0;
-- truncate table `walmartsalesdata.csv`;  -- it is use to delete everything in a dataset
-- truncate table `walmartsalesdata.csv2`;
-- truncate table `walmartsalesdata.csv3`;
select *
from `walmartsalesdata.csv`;

create table `walmartsalesdata.csv2`
like `walmartsalesdata.csv`;

insert `walmartsalesdata.csv2`
select *
from `walmartsalesdata.csv`;


select *
from `walmartsalesdata.csv2`;

select *,
row_number() over(partition by `Invoice ID`,Branch,city,`Customer type`,
Gender,`Product line`,`Unit price`,Quantity,`Tax 5%`,Total,`date`,
`Time`,Payment,cogs,`gross margin percentage`,`gross income`,Rating)
as row_num
from `walmartsalesdata.csv2`;

with duplicate_cte as 
(select *,
row_number() over(partition by `Invoice ID`,Branch,city,`Customer type`,
Gender,`Product line`,`Unit price`,Quantity,`Tax 5%`,Total,`date`,
`Time`,Payment,cogs,`gross margin percentage`,`gross income`,Rating)
as row_num
from `walmartsalesdata.csv2`)
select *
from duplicate_cte
where row_num > 1;

select
ceil(`gross income` * 100) /100 as rounded_up_value
from `walmartsalesdata.csv2`;

update `walmartsalesdata.csv2`
set `gross income` = ceil(`gross income` * 100) /100;

select 
ceil(`Tax 5%` * 100)/100
from `walmartsalesdata.csv2`;

update `walmartsalesdata.csv2`
set `Tax 5%` = ceil(`Tax 5%` * 100)/100;

select 
ceil(Total * 100)/100
from `walmartsalesdata.csv2`;

update `walmartsalesdata.csv2`
set total = ceil(Total * 100)/100;

select 
ceil(`Unit price` * 100)/100
from `walmartsalesdata.csv2`;

update `walmartsalesdata.csv2`
set `Unit price` = ceil(`Unit price` * 100)/100;

select
ceil(`gross margin percentage` * 100)/100
from `walmartsalesdata.csv2`;

update `walmartsalesdata.csv2`
set `gross margin percentage` = ceil(`gross margin percentage` * 100)/100;

alter table `walmartsalesdata.csv2`
modify column `date` date;

select
  date,
  dayname(date) as day_of_week
from `walmartsalesdata.csv2`;

alter table `walmartsalesdata.csv2`
add column day_of_weeks varchar(10);

update `walmartsalesdata.csv2`
set day_of_weeks = dayname(date);
  
  alter table `walmartsalesdata.csv2`
  add column time_of_date varchar(10);
  
  select 
    time,
    (case 
         when `time` between '00:00:00' and '12:00:00' then 'Morning'
         when `time` between '12:01:00' and '16:00:00' then 'Afternoon'
         else 'evening'
	end
    ) as time_of_date
    from `walmartsalesdata.csv2`;
 
 update `walmartsalesdata.csv2`
 set time_of_date = (case 
         when `time` between '00:00:00' and '12:00:00' then 'Morning'
         when `time` between '12:01:00' and '16:00:00' then 'Afternoon'
         else 'evening'
	end);

select 
      date,
      monthname(date)
from `walmartsalesdata.csv2`;

alter table `walmartsalesdata.csv2`
add column `month` varchar(15);

update `walmartsalesdata.csv2`
set `month` = monthname(date);

-- expocitory data analysis 

select distinct city,branch,count(city)
from `walmartsalesdata.csv2`
group by city,branch
order by city desc;

select count(distinct `Product line`)
from `walmartsalesdata.csv2`;

select  `Product line`,count(Quantity) as count_qua 
from `walmartsalesdata.csv2`
group by `Product line`
order by count_qua  desc;

select distinct Payment,count(Payment) as payment_cun
from `walmartsalesdata.csv2`
group by Payment
order by payment_cun;

select `month`,
        round(sum(total), 2) as total_revenue
from `walmartsalesdata.csv2`
group by `month`
order by total_revenue desc;

select Gender,
      round(sum(Total),2) as total_by_gen
from `walmartsalesdata.csv2`
group by Gender
order by total_by_gen desc;

select `month`,
round(sum(cogs),2) as cogs 
from `walmartsalesdata.csv2`
group by `month`
order by cogs desc;

select `Product line`,
   round(sum(total), 2) as total_revenue
from `walmartsalesdata.csv2`
group by `Product line`
order by total_revenue desc;

select city,branch,
   round(sum(total), 2) as total_revenue
from `walmartsalesdata.csv2`
group by city,branch
order by total_revenue desc;

select `Product line`,
 round(avg(`Tax 5%`),2) as avg_tax
 from `walmartsalesdata.csv2`
 group by `Product line`
 order by avg_tax desc;
 
 -- which branch sold more product than average sold
 
 select branch,
 sum(Quantity) as qty
  from `walmartsalesdata.csv2`
  group by branch
  having sum(Quantity) > (select avg(Quantity)  from `walmartsalesdata.csv2`)
  order by qty desc;
 
 select gender,`Product line`,
 count(gender) as total_cnt
  from `walmartsalesdata.csv2`
  group by gender, `Product line`
  order by total_cnt desc;
 
select  `Product line`,
round( avg(Rating),2) as avg_rating
from `walmartsalesdata.csv2`
group by `Product line`
order by avg_rating desc;

select time_of_date,
count(*) as total_sales
from `walmartsalesdata.csv2`
group by time_of_date
order by total_sales desc;

select time_of_date,
count(*) as total_sales
from `walmartsalesdata.csv2`
where day_of_weeks = 'monday'
group by time_of_date
order by total_sales desc;

select `Customer type`,
round(sum(total),2) as total_revenue
from `walmartsalesdata.csv2`
group by `Customer type`
order by  total_revenue desc;

select city,
round (avg(`Tax 5%`),2) as vat
from `walmartsalesdata.csv2`
group by city
order by vat desc;

select `Customer type`,
round(avg(`Tax 5%`),2) as vat
from `walmartsalesdata.csv2`
group by `Customer type`
order by vat desc;

select distinct `Customer type`
from `walmartsalesdata.csv2`;

select distinct Payment
from `walmartsalesdata.csv2`;

select `Customer type`,
count(*) as cstm_cnt
from `walmartsalesdata.csv2`
group by `Customer type`
order by cstm_cnt desc;

select Gender,
count(*) as gender_cnt
from `walmartsalesdata.csv2`
group by gender
order by gender_cnt desc;

select distinct Gender,
count(*) as gender_cnt
from `walmartsalesdata.csv2`
where Branch = 'c'
group by gender
order by gender_cnt desc;

select distinct Gender,
count(*) as gender_cnt
from `walmartsalesdata.csv2`
where Branch = 'a'
group by gender
order by gender_cnt desc;

select distinct Gender,
count(*) as gender_cnt
from `walmartsalesdata.csv2`
where Branch = 'b'
group by gender
order by gender_cnt desc;

select time_of_date,
round(avg(Rating),2) as avg_rating
from `walmartsalesdata.csv2`
group by time_of_date
order by avg_rating desc;

select time_of_date,
round(avg(Rating),2) as avg_rating
from `walmartsalesdata.csv2`
where branch = 'b'
group by time_of_date
order by avg_rating desc;

select time_of_date,
round(avg(Rating),2) as avg_rating
from `walmartsalesdata.csv2`
where branch = 'a'
group by time_of_date
order by avg_rating desc;

select time_of_date,
round(avg(Rating),2) as avg_rating
from `walmartsalesdata.csv2`
where branch = 'c'
group by time_of_date
order by avg_rating desc;

select day_of_weeks,
round(avg(rating),2) as avg_rating
from `walmartsalesdata.csv2`
group by day_of_weeks
order by avg_rating desc;

select day_of_weeks,
round(avg(rating),2) as avg_rating
from `walmartsalesdata.csv2`
where branch = 'a'
group by day_of_weeks
order by avg_rating desc;

select day_of_weeks,
round(avg(rating),2) as avg_rating
from `walmartsalesdata.csv2`
where branch = 'b'
group by day_of_weeks
order by avg_rating desc;

select day_of_weeks,
round(avg(rating),2) as avg_rating
from `walmartsalesdata.csv2`
where branch = 'c'
group by day_of_weeks
order by avg_rating desc;

select distinct `product line`
from `walmartsalesdata.csv2`;

select distinct`Invoice ID`
from `walmartsalesdata.csv2`;

select *
from `walmartsalesdata.csv2`

