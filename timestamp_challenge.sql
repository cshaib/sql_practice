# find which months payment occurred 
SELECT DISTINCT(TO_CHAR(payment_date, 'MONTH'))
FROM payment;

# how many payments occurred on a monday? 
SELECT COUNT(*) 
FROM payment
WHERE EXTRACT(dow FROM payment_date)=1;
