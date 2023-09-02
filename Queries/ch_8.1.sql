 select 
	s.date,
    s.product_code,
    p.product , p.variant,
    s.sold_quantity,
	round(g.gross_price,2) as gross_price_per_item,
    round(s.sold_quantity*g.gross_price,2) as gross_price_total,
    concat(round(pre.pre_invoice_discount_pct*100,2),"%")
from fact_sales_monthly s
join dim_product p
	on s.product_code = p.product_code
join fact_gross_price g
	on g.fiscal_year = get_fy(s.date)
    and g.product_code = s.product_code
join fact_pre_invoice_deductions pre
	on pre.customer_code = s.customer_code and
    pre.fiscal_year = get_fy(s.date)
where
-- 	s.customer_code = 90002002 and
    get_fy(s.date) = 2021;
    
    

-- explain analyze
select 
	s.date,
    s.product_code,
    p.product , p.variant,
    s.sold_quantity,
	round(g.gross_price,2) as gross_price_per_item,
    round(s.sold_quantity*g.gross_price,2) as gross_price_total,
    concat(round(pre.pre_invoice_discount_pct*100,2),"%")
from fact_sales_monthly s
join dim_product p
	on s.product_code = p.product_code
join fact_gross_price g
	on g.fiscal_year = year(date_add(s.date , interval 4 month))
    and g.product_code = s.product_code
join fact_pre_invoice_deductions pre
	on pre.customer_code = s.customer_code and
    pre.fiscal_year = year(date_add(s.date , interval 4 month))
where
    get_fy(s.date) = 2021;
 -- --------------------------------    
-- explain analyze
select 
	s.date,
    s.product_code,
    p.product , p.variant,
    s.sold_quantity,
	round(g.gross_price,2) as gross_price_per_item,
    round(s.sold_quantity*g.gross_price,2) as gross_price_total,
    concat(round(pre.pre_invoice_discount_pct*100,2),"%")
from fact_sales_monthly s
join dim_product p
	on s.product_code = p.product_code
join fact_gross_price g
	on g.fiscal_year = s.fiscal_year
    and g.product_code = s.product_code
join fact_pre_invoice_deductions pre
	on pre.customer_code = s.customer_code and
    pre.fiscal_year = s.fiscal_year
where
    s.fiscal_year = 2021;