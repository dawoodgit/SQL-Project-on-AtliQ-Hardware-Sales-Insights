use moviesdb;



select
	m.movie_id, title, budget, revenue, currency, unit,
    revenue - budget as profit
from movies m
join financials f on m.movie_id = f.movie_id
where industry = "bollywood"
order by profit desc;


select
	m.movie_id, title, budget, revenue, currency, unit,
    case
		when unit = "thousands" then (revenue - budget)/1000
		when unit = "billions" then (revenue - budget)*1000
		else (revenue - budget)
	end as profit_mln
from movies m
join financials f on m.movie_id = f.movie_id
where industry = "bollywood"
order by profit_mln desc;

select * from movies limit 0;