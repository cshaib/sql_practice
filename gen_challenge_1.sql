# how many payment transactions were greater than $5.00? 
SELECT COUNT(amount)
FROM payment
WHERE amount > 5;

# how many actors have a first name that starts with the letter P?
SELECT COUNT(*) 
FROM actor
WHERE first_name ILIKE 'p%';

# how many unique district are the customers from? 
SELECT COUNT(DISTINCT district)
FROM address;

# retrieve the list of names for those distinct districts from above
SELECT DISTINCT district
FROM address;

# how many films have a rating of R and a replacement cost between $5 and $15? 
SELECT COUNT(*)
FROM film
WHERE rating = 'R' AND replacement_cost BETWEEN 5 AND 15;

# how many films ahve the word Truman somewhwere in the title? 
SELECT COUNT(*)
FROM film 
WHERE title LIKE '%Truman%';