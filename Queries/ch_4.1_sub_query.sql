use moviesdb;

select * from movies
where imdb_rating = (select max(imdb_rating) from movies);

select * from movies
where imdb_rating in (
						(select min(imdb_rating) from movies),
                        (select max(imdb_rating) from movies)
						);
                        


select * from					
(select name,
	   year(current_date()) - birth_year as age
from actors ) as actors_age
where age > 70 and age < 85;

select * from actors where actor_id in (
	select actor_id from movie_actor where movie_id in (101,110,121)
    );

select * from actors where actor_id = any (
	select actor_id from movie_actor where movie_id in (101,110,121)
    );
    
select * from movies where studio = "Marvel Studios" order by imdb_rating desc;
select * from movies where studio = "Marvel Studios";

select max(imdb_rating) from movies where studio = "Marvel Studios";


select * from movies where imdb_rating >
			(select max(imdb_rating) from movies where studio = "Marvel Studios");
            
            
select * from movies where imdb_rating > all
			(select imdb_rating from movies where studio = "Marvel Studios");
            
 select * from movies where imdb_rating > any
			(select imdb_rating from movies where studio = "Marvel Studios");


select * from movies where imdb_rating > any
			(select max(imdb_rating) from movies where studio = "Marvel Studios");




                        
                        