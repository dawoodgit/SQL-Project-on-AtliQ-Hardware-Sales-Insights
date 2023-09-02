use moviesdb;

select max(imdb_rating) from movies where industry = "bollywood";
select min(imdb_rating) from movies where industry = "bollywood";
select avg(imdb_rating) from movies where studio = "marvel studios";
select  round(avg(imdb_rating), 2) from movies where studio = "marvel studios";
select  round(avg(imdb_rating), 2) as avg_rating from movies where studio = "marvel studios";

select avg(imdb_rating),
max(imdb_rating),
round(min(imdb_rating),1) from movies where studio = "marvel studios";

select avg(imdb_rating) as avg_r,
max(imdb_rating) as max_r,
round(min(imdb_rating),1) as min_r 
from movies where studio = "marvel studios";

select 
	industry, count(*)
from movies
group by industry;

select 
	studio, count(*)
from movies
group by studio;

select 
	studio, count(*) as cnt
from movies
group by studio;

select studio, count(*) from movies group by studio order by count(*) desc;
select studio, count(*) as cnt from movies group by studio order by cnt desc;

select industry, count(*) as cnt, avg(imdb_rating) as avg_r  from movies group by industry;
select industry, avg(imdb_rating) from movies group by industry;

select studio, count(*) as cnt, round(avg(imdb_rating),1) as avg_r from movies group by studio order by avg_r desc;

select studio, count(*) as cnt, round(avg(imdb_rating),1) as avg_r
from movies where studio!= ""
group by studio order by avg_r desc;

select release_year, count(*) from movies group by release_year order by release_year;

select count(*) from movies where release_year >= 2015 and release_year <= 2022;

select count(*) from movies where release_year between 2015 and 2022;

select title, release_year from movies where release_year between 2015 and 2022;

select max(release_year) from movies;
select min(release_year) from movies;
select round(avg(release_year),1) from movies;

select release_year, count(*) from movies group by release_year having count(*) > 2  order by count(*) desc ;
select release_year from movies group by release_year having count(*) > 2  order by count(*) desc ;