select movie_id, revenue, budget, (revenue - budget) as profit from financials;

select * from financials;
select movie_id , revenue, unit from financials;

select movie_id , revenue, unit,currency,
if(currency = "usd", revenue*77, revenue) as revenue_INR
 from financials;
 
 select distinct unit from financials;
 
 select count(*) from financials where unit = "Thousands";
 
select *,
if(unit = "Billions", revenue*1000, if(unit="Thousands", revenue/1000,revenue)) as new_revn
 from financials;
 
select *,
	case
		when unit = "thousands" then revenue/1000
        when unit = "billions" then revenue*1000
        else revenue
	end as revenue_mln
from financials;

select 
        *, 
    (revenue-budget) as profit, 
    100*(revenue-budget)/budget as profit_pct 
   from financials;
   
   select * from financials order by movie_id limit 3 offset 1;
   select * from financials order by movie_id limit 3;
   
   SELECT count(distinct imdb_rating), STDDEV(imdb_rating) from movies