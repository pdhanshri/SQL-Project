-- 1.use the database
use etlwakad;

-- 2.show table
show tables;

-- 3.use database
select * from athletes;

-- 4.Show how many medal counts present for entire data
select count(medal)
from athletes; 

-- 5.Show count of unique Sports are present in olympics.
select count(Sport) as unique_sports
from athletes;

-- 6.Show how many different medals won by Team India in data.
select medal,count(medal)
from athletes
where Team='india'
group by medal;

-- 7.Show event wise medals won by india show from highest to lowest medals won in order.
select event,count(medal) as won_medal
from athletes
where team='india'
group by event
order by won_medal desc;

-- 8.Show event and yearwise medals won by india in order of year
select event,year , count(medal) as yearwise_medals
from athletes
where team = 'india'
group by event,year
order by yearwise_medals asc;

-- 9.Show the country with maximum medals won gold, silver, bronze
select city,max('gold') as gold_medal,  max('silver') as silver_medal,max('bronze') as bronze_medal
from athletes
group by city;

-- 10.Show the top 10 countries with respect to gold medals
select city,count('gold') as gold_medal
from athletes
group by city
order by city asc
limit 10;

-- 11. Show in which year did United States won most medals
select year,count('medal') as won_medal
from athletes
where city = 'United state'
group by year
order by won_medal asc;

-- 12.In which sports United States has most medals
select sport, count(medal)
from athletes
where city = 'United state'
group by sport
order by medal asc;

-- 13. Find top 3 players who have won most medals along with their sports and country.
select name, games , city, medal
from athletes
order by medal
limit 3;


-- 14.Find player with most gold medals in cycling along with his country.
select name, team, count(medal) as gold_medal_count
from athletes
where sport='Cycling' and medal='Gold'
group by name 
order by gold_medal_count desc
limit 1;

-- 15.Find player with most medals (Gold + Silver + Bronze) in Basketball also show his country.
select name, count(medal) as medal_count 
from athletes
where sport='Basketball' and medal<>'NoMedal'
group by name
order by medal_count desc
limit 1;
-- 16.. Find out the count of different medals of the top basketball player.
select count(medal),games
from athletes
where games = 'basketball'
limit 1;

-- 17. Find out medals won by male, female each year.
select year, sex, count(medal) as medal_count
from athletes
where medal<>'NoMedal'
group by year, sex
order by year asc;





