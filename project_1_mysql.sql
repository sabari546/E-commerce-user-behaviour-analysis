use ecommerce;
-- Q.no:3.
desc users_data;
-- Q.no:4.
select * from users_data limit 100;
-- Q.no.5.
select count(distinct country), count(distinct language) from users_data;
-- Q.no:6.
SELECT gender, MAX(socialNbfollowers) AS max_followers
FROM users_data group by gender;
-- Q.no:7.
select (select count(*) from users_data where hasprofilepicture = 'True') has_profilepic, (select count(*)  from users_data where hasAndroidApp = 'True')has_androidapp, (select count(*) from users_data where hasIosApp = 'True') has_Iosapp, (select count(*) from users_data where hasAnyApp = 'True') uses_as_ecommerce_platform;
-- Q.no:8.
select country, count(distinct productsBought) from users_data group by country order by productsBought desc; 
-- Q.no:9.
select count(distinct productsSold) number_of_products_sold, country from users_data group by country order by productsSold;
-- Q.no:10.
SELECT 
    country, COUNT(*) pass_rate
FROM
    users_data
GROUP BY country
ORDER BY productspassrate DESC
LIMIT 10;
-- Q.no:11.
select count(*), language from users_data group by language order by type desc;
-- Q.no 12.
SELECT 
    'Products in Wishlist' choice, COUNT(*) count
FROM
    users_data
WHERE
    gender = 'F' AND hasanyapp = 'true'
        AND productsWished > 0 
UNION SELECT 
    'Social Products Liked' choice, COUNT(*) count
FROM
    users_data
WHERE
    gender = 'F' AND hasanyapp = 'true'
        AND socialProductsLiked > 0
ORDER BY count;
-- Q.no 13. 
select 'buyers' choice, count(*) male_count from users_data where gender = 'M' and productsbought > 0 union select 'seller' choice, count(*) from users_data where gender = 'm' and productsSold >0 order by male_count ;
-- Q.no 14.
SELECT Country, COUNT(*) BuyerCount
FROM users_data
WHERE productsbought >0
GROUP BY Country
ORDER BY BuyerCount DESC
LIMIT 1;
-- Q.no 15.
select country from users_data where productsbought = 0 limit 10;
-- Q.no 16
select * from users_data order by dayssincelastlogin  limit 110;
-- Q.no 17
SELECT COUNT(gender) number_of_inactive_female_users
FROM users_data
WHERE gender = 'f'
AND dayssincelastlogin <= DATE_SUB(NOW(), INTERVAL 100 DAY);
-- Q.no 18
select country, count(gender) female from users_data where gender = 'f' group by country;
-- Q.no 19
select country, count(gender) male from users_data where gender = 'm' group by country;
-- Q.no: 20. 
select country,avg(productsbought), avg(productssold) from users_data where gender = 'm' group by country;

