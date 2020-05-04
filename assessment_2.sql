# how can you retrieve all the information from the cd.facilities table?
SELECT * 
FROM cd.facilities;

# how would you retrieve a list of only facility names and costs?
SELECT DISTINCT(name), membercost
FROM cd.facilities
ORDER BY name ASC;

# how can you produce a list of facilities that charge a fee to members?
SELECT DISTINCT(name), membercost
FROM cd.facilities
WHERE membercost > 0
ORDER BY name ASC;

# how can you produce a list of facilities that charge a fee to members, and that fee is less than 1/50th of the monthly maintenance cost? 
# return the facid, facility name, member cost, and monthly maintenance of the facilities in question.
SELECT DISTINCT(name), membercost, facid, monthlymaintenance
FROM cd.facilities
WHERE membercost > 0
AND membercost < monthlymaintenance/50
ORDER BY name ASC;

# how can you produce a list of all facilities with the word 'Tennis' in their name?
SELECT name
FROM cd.facilities
WHERE name ILIKE '%tennis%';

# how can you retrieve the details of facilities with ID 1 and 5? Try to do it without using the OR operator.
SELECT *
FROM cd.facilities
WHERE facid IN (1,5);

# how can you produce a list of members who joined after the start of September 2012? Return the memid, surname, firstname, and joindate of the members in question.
SELECT DISTINCT(memid), surname, firstname, joindate
FROM cd.members
WHERE to_char(joindate, 'YYYY-MM-DD')::date > date '2012-09-01';

# how can you produce an ordered list of the first 10 surnames in the members table? The list must not contain duplicates.
SELECT DISTINCT(surname)
FROM cd.members
ORDER BY surname ASC
LIMIT 10;

# you'd like to get the signup date of your last member. How can you retrieve this information?
SELECT joindate
FROM cd.members
ORDER BY joindate DESC
LIMIT 1;

# produce a count of the number of facilities that have a cost to guests of 10 or more.
SELECT COUNT(DISTINCT(facid))
FROM cd.facilities
WHERE guestcost > 10 
LIMIT 1;

# produce a list of the total number of slots booked per facility in the month of September 2012. 
# produce an output table consisting of facility id and slots, sorted by the number of slots.
SELECT facid, SUM(slots) 
FROM cd.bookings
WHERE to_char(starttime, 'YYYY-MM-DD')::date > date '2012-09-01' 
AND to_char(starttime, 'YYYY-MM-DD')::date < date '2012-09-30' 
GROUP BY facid
ORDER BY SUM(slots) DESC;

# produce a list of facilities with more than 1000 slots booked. Produce an output table consisting of facility id and total slots, sorted by facility id.
SELECT facid, SUM(slots) 
FROM cd.bookings
GROUP BY facid
HAVING SUM(slots) > 1000
ORDER BY facid ASC;

# how can you produce a list of the start times for bookings for tennis courts, for the date '2012-09-21'? 
# return a list of start time and facility name pairings, ordered by the time.
SELECT fac.name, book.starttime  
FROM cd.bookings as book
JOIN cd.facilities as fac
ON book.facid = fac.facid
WHERE fac.name ILIKE 'tennis%'
AND to_char(book.starttime, 'YYYY-MM-DD')::date = date '2012-09-21'
ORDER BY book.starttime ASC;

# how can you produce a list of the start times for bookings by members named 'David Farrell'?
SELECT mem.firstname, mem.surname, book.starttime  
FROM cd.bookings as book
JOIN cd.members as mem
ON book.memid = mem.memid
WHERE mem.firstname ILIKE 'David'
AND mem.surname ILIKE 'Farrell'
ORDER BY book.starttime ASC;
