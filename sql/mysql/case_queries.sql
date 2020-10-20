/*
CASE allows to add a new col
This col could have an specific content
*/

SELECT  language, price
CASE
	WHEN price > 1000 THEN "so expensive"
	WHEN price > 500 THEN "expensive"
	ELSE "cheap"
END AS "price_opinion"
FROM books;