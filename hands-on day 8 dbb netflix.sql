-- show_id,type,title,director,cast,country,date_added,release_year,rating,duration,listed_in,description
-- create table dbb.netflix(
-- 	show_id varchar,
-- 	"type" varchar,
-- 	title varchar,
-- 	director varchar,
-- 	"cast" varchar,
-- 	country varchar,
-- 	date_added date,
-- 	release_year int,
-- 	rating varchar,
-- 	duration varchar,
-- 	listed_in varchar,
-- 	description varchar
-- );
-- select *
-- from dbb.netflix

-- 1. Show all movies and TV shows available on Netflix
-- 2. Show title, director and country.
-- 3. Show all shows that have no director data and fill the data with “Unknown”
-- 4. Show show_id, type, title and change the column name in the result to ShowID, ShowType, and ShowTitle
-- 5. Show unique type


-- select *
-- from dbb.netflix;

-- 1. Show all movies and TV shows available on Netflix
-- select 
-- show_id
-- "type",
-- title
-- from dbb.netflix;

--3. Show all shows that have no director data and fill the data with “Unknown”
-- select *
-- from dbb.netflix
-- where director is null

-- 4. Show show_id, type, title and change the column name in the result to ShowID, ShowType, and ShowTitle
-- select 
-- show_id showid,
-- "type" showtype,
-- title showtitle
-- from dbb.netflix;

-- 5. Show unique type
-- select
-- distinct
-- "type"
-- from dbb.netflix;

-- 6. Show unique title
-- 7. Show unique titles that are released in 2021
-- 8. Show TV Shows titles and their rating that are released in 2020
-- 9. Show movie titles that are added in August 2021
-- 10. Show 10 most recently added titles

-- 6. Show unique title
-- select
-- distinct title
-- from dbb.netflix;

-- -- 7. Show unique titles that are released in 2021
-- select 
-- distinct title
-- from dbb.netflix
-- where release_year = 2021;

-- 8. Show TV Shows titles and their rating that are released in 2020
-- select
-- title, 
-- rating
-- from dbb.netflix
-- where release_year = 2020 and lower ("type") = 'tv show'

-- 9. Show movie titles that are added in August 2021
-- --CARA 1
-- select
-- 	title,
-- 	date_added,
-- 	extract (year from date_added) as year_added,
-- 	extract (month from date_added) as month_added,
-- 	extract (day from date_added) as day_added
-- from dbb.netflix
-- where lower ("type") = 'movie'
-- and extract (year from date_added) = 2021
-- and extract (month from date_added) = 8

----CARA 2--
-- select
-- title,
-- date_added,
-- extract(year from date_added) as year_added,
-- extract(month from date_added) as month_added,
-- extract(day from date_added) as day_added
-- from dbb.netflix
-- where lower("type") = 'movie'
-- and date_added between '2021-08-01' and '2021-08-31'

--CARA 3--
-- select
-- title,
-- date_added,
-- extract(year from date_added) as year_added,
-- extract(month from date_added) as month_added,
-- extract(day from date_added) as day_added
-- from dbb.netflix
-- where lower ("type") = 'movie'
-- and date_added >= '2021-08-01'
-- and date_added <= '2021-08-31'
-- ;

--10. Show 10 most recently added titles
-- select
-- title,
-- date_added
-- from dbb.netflix
-- where date_added is not null
-- order by 2 desc
-- limit 10;

-- 11. Show top 10 longest movie titles
-- 12. Show all movies that are played by Ryan Gosling
-- 13. Show how old each movie/tv series
-- 14. Show all movies and tv series from United Kingdom
-- 15. In what show Steve Carell and Anne Hathaway played together?
-- 16. In what shows Leonardo DiCaprio played which not Thrillers genre?
-- 17. Show top 10 oldest movies.
-- 18. Show all movies that were released in the 2020s and listed in the Comedy and Talk Shows genre.

-- 17. Show top 10 oldest movies.
-- select
-- title,
-- release_year,
-- 2024-release_year as movie_age
-- from dbb.netflix
-- where lower ("type")='movie'
-- order by 3 desc
-- limit 10;

-- 15. In what show Steve Carell and Anne Hathaway played together?
-- select *
-- from dbb.netflix
-- where lower ("cast") like '%steve carell%' and lower ("cast") like '%anne hathaway%'


-- 4. Show year with more that 500 releases
-- 5. Categorized releases into different decades to show total releases per decade.

-- 1. Get the number of records in the dataset
-- select
-- 	count (*) as total_record
-- from dbb.netflix

-- 2. Count the number of TV shows and movies
-- select
-- "type",
-- count(distinct title) as total_title
-- from dbb.netflix
-- group by 1;

-- 3. Show content added per year
-- select
-- extract(year from date_added) as year_added,
-- count(distinct title) total_title_added
-- from dbb.netflix
-- where date_added is not null
-- group by 1
-- order by 1;

-- 4. Show year with more that 500 releases
-- select
-- release_year,
-- count(distinct title) total_title_released
-- from dbb.netflix
-- where date_added is not null
-- group by release_year
-- having count(distinct title) > 500
-- order by 2 desc

-- 6. Categorized country into the United States and Others then show the total releases.
-- select
-- 	case when lower(country) like '%united states%' then '%United States%'
-- 	else 'Others' end as country_group,
-- count(distinct title) total_title_released
-- from dbb.netflix
-- group by 1

-- 7. Show the average released to added duration for all shows.
-- select
-- title,
-- release_year,
-- extract(year from date_added) year_added,
-- avg(extract(year from date_added) - release_year) avg_duration_released_to_added
-- from dbb.netflix