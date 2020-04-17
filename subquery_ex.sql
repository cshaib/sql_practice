# find students who did better than average
SELECT student, grade
FROM test_scores
WHERE grade > (SELECT AVG(grade) 
	FROM test_scores)

# find students who where on the honour roll
SELECT student, grade
FROM test_scores
WHERE student in (SELECT student 
	FROM honour_roll_table)

# rental movie example
SELECT film_id, title
FROM film
WHERE film_id IN (SELECT inventory.film_id 
	FROM rental
	INNER JOIN inventory ON inventory.inventory_id = rental.inventory_id
	WHERE return_date BETWEEN '2005-05-29' AND '2005-05-30')
ORDER BY title DESC;

# can also use "WHERE NOT EXISTS" before sub-query