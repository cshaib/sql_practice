# find emails of customers in california
SELECT c.first_name, c.email
FROM customer AS c
INNER JOIN address AS a
ON a.address_id = c.address_id
WHERE a.district ILIKE 'California';

# find list of all movies with "Nick Wahlberg"
SELECT f.title 
FROM film AS f
INNER JOIN film_actor as fa
ON f.film_id = fa.film_id
INNER JOIN actor as a
ON a.actor_id = fa.actor_id
WHERE a.first_name  ILIKE 'Nick' 
AND a.last_name ILIKE 'Wahlberg';