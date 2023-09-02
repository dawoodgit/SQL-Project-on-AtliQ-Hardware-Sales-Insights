 select 
	s.date , s.product_code , p.product , p.variant , s.sold_quantity
	from fact_sales_monthly s
    join dim_product p
    on p.product_code = s.product_code
where 
	customer_code = 90002002
    and
    get_fy(date) = 2021
    order by date asc
    limit 1000000;
 --  --------------------------------------------------------------------------------  
select 
	s.date , s.product_code , p.product , p.variant , s.sold_quantity,
    gp.gross_price
	from fact_sales_monthly s
    join dim_product p
    on 
		p.product_code = s.product_code
    
    join fact_gross_price gp
    on 
		s.product_code = gp.product_code and 
		get_fy(s.date) = gp.fiscal_year
    
where 
	customer_code = 90002002
    and
    get_fy(date) = 2021
order by date asc
limit 100;

-- -----------------------------------------------------------

select 
	s.date , s.product_code , p.product , p.variant , s.sold_quantity,
    gp.gross_price
	from fact_sales_monthly s
    join dim_product p
    using(product_code)
    
    join fact_gross_price gp
    on 
		s.product_code = gp.product_code and 
		get_fy(s.date) = gp.fiscal_year
    
where 
	customer_code = 90002002
    and
    get_fy(date) = 2021
order by date asc
limit 100; 
    
-- -----------------------------

select 
	s.date, monthname(s.date) as month, s.product_code , p.product , p.variant , s.sold_quantity,
    round(gp.gross_price,2) as unit_gross_price, 
    round(s.sold_quantity*gp.gross_price,2) as gross_price_amt
	
from fact_sales_monthly s
	join dim_product p
    on  p.product_code = s.product_code
    
    join fact_gross_price gp
    on  s.product_code = gp.product_code and 
		get_fy(s.date) = gp.fiscal_year
    
where 
	customer_code = 90002002
    and
    get_fy(date) = 2021
order by date asc
limit 1000000;

 -- ---------------------------------------
 select 
	s.date, monthname(s.date) as month, s.product_code , p.product , p.variant , s.sold_quantity,
    round(gp.gross_price,2) as unit_gross_price, 
    round(s.sold_quantity*gp.gross_price,2) as gross_price_amt
	
from fact_sales_monthly s
	join dim_product p
    on  p.product_code = s.product_code
    
    join fact_gross_price gp
    on  s.product_code = gp.product_code and 
		get_fy(s.date) = gp.fiscal_year
    
where 
	customer_code = 90002002
    and
    get_fy(date) = 2021
order by date asc
limit 1000000;


