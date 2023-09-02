-- select year("2022-8-9");
-- select date("12-008-009");
-- select year(curdate());
-- select year(current_date());
-- select current_date();
-- select current_time();
-- select current_timestamp();
select current_user();

select *, year(current_date()) - birth_year as age from actors order by age desc;


