use platziblog;

/* Main structure
SELECT
FROM
WHERE
GROUP BY
ORDER BY
HAVING
LIMIT
*/

SELECT  COUNT(*) as amount 
/* other functions
AVG 
COUNT 
GROUP_CONCAT 
    the result is splitted by commas
    this could help COUNT function
    GROUP_CONCAT(DISTINCT value Separator ' - ')
        avoid duplicate value
        and comma is remplaced by -
SUM 
MAX 
MIN 
*/
FROM people 

-- examples about FROM query
 SELECT * FROM people -- main sentence
 -- get all the people with and without posts
 LEFT JOIN posts
 ON people.id = posts_id
 -- get all the people who does not have any post
 LEFT JOIN posts
 ON people.id = posts.person_id
 WHERE post.person_id IS NULL;
-- get all the post with and without user
 RIGHT JOIN posts
 ON people.id = posts_id
 -- get all the posts without user
 RIGHT JOIN posts
 ON people.id = posts.person_id
 WHERE people.id is null;
 -- get all the user whit post or and post whit user
 -- this is the most used query
 INNER JOIN posts
 ON people.id = posts_id
 
 -- get all the posts and users(UNION)
 -- FULL OUTER JOIN is a similar option
 -- but in MySQL is not supported
SELECT *
FROM people
LEFT JOIN posts
ON people.id = posts.person_id
UNION
SELECT *
FROM people
RIGHT JOIN posts
ON people.id = posts_id
 -- UNION deletes the deplicate rows
 -- UNION ALL joins the tables completely
 
 -- get all the users whitout posts and posts whitout user
SELECT *
FROM people
LEFT JOIN posts
ON people.id = posts.person_id
WHERE post.person_id is NULL
UNION
SELECT *
FROM people
RIGHT JOIN posts
ON people.id = posts.person_id
WHERE post.person_id is NULL;


-- examples about WHERE query
SELECT * FROM people -- main sentence
WHERE id not in (43, 44, 45, 46);
WHERE id < 43 and id > 46;
WHERE status='activo';
WHERE id!=50;
WHERE titulo LIKE '%world%';
WHERE titulo LIKE 'world%';
WHERE titulo LIKE '%world';
WHERE updated_at>'2025-01-01';
WHERE updated_at BETWEEN '2025-01-01' AND '2025-12-31';
WHERE YEAR(updated_at) BETWEEN '2023' AND '2024';
WHERE MONTH(updated_at)=04;
WHERE category IN ("tech","english","design");

WHERE title = null -- incorrect sentence, null is a value
WHERE title IS NULL -- correct sentence
WHERE title != null -- incorrect sentence, null is a value
WHERE title IS NOT NULL -- correct sentence

-- WHERE could have AND in order to set more filters
WHERE title IS NULL AND person_id IS NOT NULL AND YEAR(updated_at) = '2020'


-- examples about GROUP BY query
SELECT status, COUNT(*) post_quantity
FROM posts
GROUP BY status;

SELECT YEAR(updated_at) AS post_year, COUNT(*) AS post_quantity
FROM posts
GROUP BY post_year;

-- this query groups by status and then by post_month
SELECT status, MONTHNAME(updated_at) AS post_month, COUNT(*) AS post_quantity
FROM posts
GROUP BY status, post_month;

select year(updated_at) as year, monthname(updated_at) as month, count(*) as amount
from posts
group by year, month;


-- examples about ORDER BY query
SELECT status, COUNT(*) post_quantity
FROM posts
ORDER BY status ASC;
-- ASC is the default order

SELECT YEAR(updated_at) AS post_year, COUNT(*) AS post_quantity
FROM posts
ORDER BY post_year DESC;

-- this query gets just 5 rows
SELECT status, MONTHNAME(updated_at) AS post_month, COUNT(*) AS post_quantity
FROM posts
ORDER BY status
LIMIT 5;

-- example about HAVING query
-- HAVING is the same like WHERE
-- HAVING is used when GROUP BY is used
SELECT MONTHNAME(updated_at) AS month, status, COUNT(*) AS amount
FROM posts
-- WHERE amount > 1 AND month IN ('December', 'May') ;
-- WHERE does not work because it does not know the amount col
-- then HAVING is used because it filters before the data is grouped
GROUP BY status, month
HAVING amount > 1 AND month IN ('December', 'May') ;