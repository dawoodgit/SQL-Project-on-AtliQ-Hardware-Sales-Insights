select
	movies.movie_id , title, budget, revenue, currency, unit
from movies
join financials
on movies.movie_id = financials.movie_id;

select
	m.movie_id , title, budget, revenue, currency, unit
from movies m
join financials f
on m.movie_id = f.movie_id;
#by-default inner join : will consider the common (intersection) data & ignore that is not common to both

select
	m.movie_id , title, budget, revenue, currency, unit
from movies m
left join financials f
on m.movie_id = f.movie_id;
#left join : all the records from the left table (m in this case) including the common records & those uncommon parts of the left table.

select
	m.movie_id , title, budget, revenue, currency, unit
from movies m
right join financials f
on m.movie_id = f.movie_id;

select
	f.movie_id , title, budget, revenue, currency, unit
from movies m
right join financials f
on m.movie_id = f.movie_id;
select
	movie_id , title, budget, revenue, currency, unit
from movies m
right join financials f
using (movie_id);

#-----------------------------------------------------#
select
	m.movie_id , title, budget, revenue, currency, unit
from movies m
left join financials f
on m.movie_id = f.movie_id

union

select
	f.movie_id , title, budget, revenue, currency, unit
from movies m
right join financials f
on m.movie_id = f.movie_id;

#-----------------------------------------------------#


select
	movie_id , title, budget, revenue, currency, unit
from movies m
left join financials f
using (movie_id);  #no need to mention m.movies
#format: using(col 1, col2) if column names are different.

select
	m.movie_id , title, budget, revenue, currency, unit
from movies m
left join financials f
on m.movie_id = f.movie_id;
#to join on 2 columns : on colA1 = colA2 AND colB1 = colB2

select
	movie_id , title, budget, revenue, currency, unit
from movies
left join financials
using (movie_id);

select
	movie_id , title, budget, revenue, currency, unit
from movies
right join financials
using (movie_id);

select movie_id, title, language_id, name
 from movies
 left join languages
 using (language_id);
 
 select movie_id, title, l.language_id, name
 from movies m
 left join languages l
 on m.language_id = l.language_id
 where l.name = "telugu";
 
  select movie_id, title, language_id, name
 from movies
 left join languages
 using (language_id)
 where name = "telugu";
 
   select count(*), language_id, name
 from movies
 left join languages
 using (language_id)
 where name = "telugu";
 
 SELECT 
            l.name, 
            COUNT(m.movie_id) as no_movies
	FROM languages l
	LEFT JOIN movies m USING (language_id)        
	GROUP BY language_id
	ORDER BY no_movies DESC;
    
    
    
    
select
	movies.movie_id , title, budget, revenue, currency, unit
from movies
join financials
on movies.movie_id = financials.movie_id;