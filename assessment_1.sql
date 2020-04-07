# return the customer IDs of customers who have spent at least $110 with the staff member who has an ID of 2.
SELECT customer_id
FROM payment
WHERE staff_id = 2
GROUP BY customer_id
HAVING SUM(AMOUNT) > 110;

# how many films begin with the letter J?
SELECT COUNT(*)
FROM film
WHERE title ILIKE 'j%';

# what customer has the highest customer ID number whose name starts with an 'E' and has an address ID lower than 500?
SELECT first_name, last_name
FROM customer
WHERE first_name ILIKE 'e%' AND address_id < 500
GROUP BY first_name, last_name, customer_id
ORDER BY customer_id DESC 
LIMIT 1;


