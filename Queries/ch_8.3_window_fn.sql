SELECT * FROM random_tables.expenses;

select sum(amount) from expenses; #65800
select sum(amount) from expenses where category = "food"; #11800

select *, amount*100/sum(amount) as pct from expenses;

select * , amount*100/(select sum(amount) from expenses) from expenses order by category;

select * , amount*100/(select sum(amount) from expenses) from expenses;

select *, amount*100/sum(amount) over() as pct from expenses order by category;

select *, amount*100/sum(amount) over(partition by category) as pct_wrt_category from expenses order by category;

select *, amount*100/sum(amount) over(partition by description) as pct from expenses order by category;


#about Cumulative Expenses

SELECT * FROM expenses order by category, date;

SELECT * FROM expenses order by date, category;

select *,
		sum(amount) 
		over(partition by category order by date) as total_expense_til_date
 from expenses;

select *,
		sum(amount) 
		over(partition by category order by date) as total_expense_til_date
 from expenses
 order by category, date;
 
 
 select *,
		sum(amount) 
		over(order by date) as total_expense_til_date
 from expenses;
 
 
 # ROW_NUMBER ,  RANK , DENSE_RANK
 select * ,
		row_number() over(order by amount) as rn 
from expenses;
 
 
  select * ,
		row_number() over(partition by category order by amount) as rn 
from expenses;
  
  
 select * ,
		row_number() over(partition by category order by amount desc) as rn 
from expenses;

select * ,
	row_number() over(partition by category order by amount desc) as rn,
	rank() over(partition by category order by amount desc) as rnk
from expenses;

with cte1 as ( select * ,
		row_number() over(partition by category order by amount desc) as rn 
from expenses)
select * from cte1
where rn <=2;

with cte1 as (select * ,
			         row_number() over(partition by category order by amount desc) as rn,
                     rank() over(partition by category order by amount desc) as rnk
			from expenses)
select * from cte1
where rn <=2;

select * ,
	row_number() over(partition by category order by amount desc) as rn,
	rank() over(partition by category order by amount desc) as rnk,
    dense_rank() over(partition by category order by amount desc) as drnk 	 
from expenses;

select * from student_marks;

 select *,
		row_number() over(order by marks desc) as rn,
        rank() over(order by marks desc) as rnk,
        dense_rank() over(order by marks desc) as drnk
 from student_marks;