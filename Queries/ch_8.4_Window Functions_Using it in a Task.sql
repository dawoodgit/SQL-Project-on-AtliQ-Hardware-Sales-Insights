select 
	customer , 
	round(sum(net_sales)/1000000,2) as net_sales_mln
from net_sales s
join dim_customer c
		on s.customer_code = c.customer_code
where s.fiscal_year = 2021
group by customer
order by net_sales_mln desc;

#using window function
with cte1 as (
select 
	customer , 
	round(sum(net_sales)/1000000,2) as net_sales_mln
from net_sales s
join dim_customer c
		on s.customer_code = c.customer_code
where s.fiscal_year = 2021
group by customer)
select *,
		net_sales_mln*100/sum(net_sales_mln) over() as pct
 from cte1 
 order by net_sales_mln;
 
 
 #  ROW_NUMBER ,  RANK , DENSE_RANK

 #--------------------------------------#
 
 select
		p.division,
        p.product,
        sum(sold_quantity) as total_qty
from fact_sales_monthly s 
join dim_product p 
		on p.product_code = s.product_code
where fiscal_year = 2021
group by product, division;
 
 
with cte1 as (select
		p.product,
		p.division,
        sum(sold_quantity) as total_qty
from fact_sales_monthly s 
join dim_product p 
		on p.product_code = s.product_code
where fiscal_year = 2021
group by  division, product)
  
select *,
		 dense_rank() over(partition by division order by total_qty desc) as drnk_div
from cte1;


with cte1 as (select
		p.product,
		p.division,
        sum(sold_quantity) as total_qty
from fact_sales_monthly s 
join dim_product p 
		on p.product_code = s.product_code
where fiscal_year = 2021
group by  division, product),
cte2 as (select *,
		 dense_rank() over(partition by division order by total_qty desc) as drnk_div
from cte1)

select *
from cte2
where drnk_div <=3;

with cte1 as (select
		market,
		region,
        sum(gp.gross_price*s.sold_quantity) as total_qty
from fact_sales_monthly s 
join dim_product p
		on p.product_code = p.product_code
join fact_gross_price gp
		on p.product_code = gp.product_code and
           gp.fiscal_year = s.fiscal_year
join dim_customer c
		on c.customer_code = s.customer_code
where s.fiscal_year = 2021
group by  market, region),
cte2 as (select *,
		 dense_rank() over(partition by region order by total_qty desc) as drnk_div
from cte1)

select *
from cte2
where drnk_div <=2;