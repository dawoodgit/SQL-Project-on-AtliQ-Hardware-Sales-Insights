SELECT * FROM fact_sales_monthly;



#printing fiscal_year (staring from sep) & (fiscal) quarter alongwith *
select *,
		year(date_add(date, interval 4 month)) as fiscal_year,
        concat('Q' , quarter(date_add(date, interval 4 month))) as quarter
from fact_sales_monthly;


#Achieving the same by creating a view ('sales_with_fy_q') for all the columns.
select * from sales_with_fy_q;


#Trying the same using dim_date
select f.*,
       d.fiscal_year,
       d.quarter
from fact_sales_monthly f 
left join dim_date d
on f.date = d.date;
#NOTE: dim_date is a 'view' derived from fact_sales_monthly only.



#using user-defined functions : get_fy & get_fy_quarter
select *,
		get_fy(date) as fiscal_year,
        get_fy_Quarter(date) as quarter
from fact_sales_monthly;




      
      








