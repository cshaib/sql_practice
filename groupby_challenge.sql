' notes:
 about WHERE vs HAVING when using agg functions: 
	- WHERE: used to filter the GROUPBY column 
	- HAVING: used to filter the aggregated column
 about the GROUPBY statement:
 	- all non-agg columns that are selected must appear in the GROUPBY
'


# find staff member that handled the most number of payments?
SELECT staff_id, COUNT(*)
FROM payment
WHERE staff_id IN (1, 2)
GROUP BY staff_id
ORDER BY COUNT(payment_date) DESC;

# what is the average replacement cost per MPAA rating? 
SELECT rating, ROUND(AVG(replacement_cost), 2)
FROM film
GROUP BY rating
ORDER BY AVG(replacement_cost) DESC;

# what are the top 5 customer ids with the highest spending?
SELECT customer_id, SUM(amount)
FROM payment
GROUP BY customer_id
ORDER BY SUM(amount) DESC
LIMIT 5;


