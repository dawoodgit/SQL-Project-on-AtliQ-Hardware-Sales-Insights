select studio from moviesdb.movies;
select title from moviesdb.movies;
use moviesdb;
select language_id from movies;

select * from movies where imdb_rating = 8.1; 
select count(industry) from movies where industry = "Hollywood"  ;
select count(industry) from movies where industry = "Bollywood"  ;
select count(*) from movies where industry = "Bollywood"  ;
select count(*) from movies;
select distinct industry from movies;
select count(distinct industry) from movies;
select * from movies where title like "%thor%";
select * from movies where title like "thor%";
select * from movies where title like "%soldier";
select * from movies where title like "%america%";
select * from movies where title like "%:%";
select * from movies where title like "K.G.F: Chapter 2";
select * from movies where title like "%K.G.F: Chapter 2%";
select * from movies where title like "%.F: Chapte%";
select * from movies where studio = "";
select title , release_year, studio from movies where studio like "%Marvel%";
select title , release_year from movies where studio = "Marvel Studios" ;
select * from movies where title like "%avenger%";
select release_year from movies where title = "The Godfather";
select distinct(studio) from movies;

