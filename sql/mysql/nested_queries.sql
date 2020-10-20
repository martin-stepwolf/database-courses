-- inside of any query there could be another query

SELECT title, updated_at, status
FROM posts
WHERE updated_at = (
SELECT MAX(updated_at)
 FROM posts
);

SELECT new_table_projection.date, COUNT(*) AS post_count
FROM (
SELECT DATE(MIN(updated_at)) AS date, YEAR(updated_at) AS post_year
FROM posts
GROUP BY post_year
) AS new_table_projection
GROUP BY new_table_projection.date
ORDER BY new_table_projection.date;