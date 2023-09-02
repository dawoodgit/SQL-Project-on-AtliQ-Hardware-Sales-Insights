use moviessb;

select
	*
from movies m
join movie_actor ma on ma.movie_id = m.movie_id
join actors a on a.actor_id = ma.actor_id;

select
	m.title , a.name
from movies m
join movie_actor ma on ma.movie_id = m.movie_id
join actors a on a.actor_id = ma.actor_id;

select
	m.title , group_concat(a.name)
from movies m
join movie_actor ma on ma.movie_id = m.movie_id
join actors a on a.actor_id = ma.actor_id
group by m.movie_id;


select
	m.title , group_concat(a.name separator " / ") as actors
from movies m
join movie_actor ma on ma.movie_id = m.movie_id
join actors a on a.actor_id = ma.actor_id
group by m.movie_id;

select
	a.name , group_concat(m.title separator " | ")  as movies
from actors a
join movie_actor ma on ma.actor_id = a.actor_id
join movies m on m.movie_id = ma.movie_id
group by a.actor_id;

select
	a.name , group_concat(m.title separator " | ")  as movies,
	count(m.title) as movies_count
from actors a
join movie_actor ma on ma.actor_id = a.actor_id
join movies m on m.movie_id = ma.movie_id
group by a.actor_id
order by movies_count desc;

select
	m.title, f.revenue , f.currency , f.unit
    from movies m
join financials f on m.movie_id = f.movie_id
join languages l on m.language_id = l.language_id
where l.name = "Hindi"
order by f.revenue desc;

select
	m.title, f.revenue , f.currency , f.unit,
    case unit
		when "thousand" then round(revenue/1000,2)
        when "billions" then round(revenue*1000,2)
        else revenue
	end as updated_revenue
        from movies m
join financials f on m.movie_id = f.movie_id
join languages l on m.language_id = l.language_id
where l.name = "Hindi"
order by f.revenue desc;

