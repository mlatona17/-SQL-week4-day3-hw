--1. List all customers who live in Texas (use JOINs)
SELECT first_name, last_name, district
FROM address
FULL JOIN customer
ON customer.address_id = address.address_id
WHERE address.district = 'Texas'


--2. Get all payments above $6.99 with the Customer's Full Name

SELECT first_name, last_name, amount
FROM customer
FULL JOIN payment
ON customer.customer_id = payment.customer_id
WHERE payment.amount > 6.99
ORDER BY amount ASC;

--3. Show all customers names who have made payments over $175(use subqueries)

SELECT first_name, last_name
FROM customer
WHERE customer_id IN(
	SELECT customer_id
	FROM payment
	GROUP BY customer_id
	HAVING SUM(amount) > 175.00
);

--4. List all customers that live in Nepal (use the city table)

SELECT customer.customer_id, first_name, last_name, city, country
FROM customer
JOIN address
ON customer.address_id = address.address_id
JOIN city
ON address.city_id = city.city_id
JOIN country
ON city.country_id = country.country_id
WHERE country = 'Nepal';
	
--5. Which staff member had the most transactions?
	
SELECT staff.staff_id, first_name, last_name, SUM(rental.staff_id)
FROM staff
JOIN rental
ON staff.staff_id = rental.staff_id
GROUP BY staff.staff_id
ORDER BY sum DESC
LIMIT 1;
	
--6. How many movies of each rating are there?

SELECT rating, COUNT(title) AS title_count
FROM film
GROUP BY rating
ORDER BY title_count DESC;

--7.Show all customers who have made a single payment above $6.99 (Use Subqueries)
	
SELECT customer_id, first_name, last_name
FROM customer
WHERE customer_id IN(
	SELECT customer_id
	FROM payment
	WHERE amount > 6.99
	GROUP BY customer_id
);

--8. How many free rentals did our stores give away?
	
SELECT COUNT(amount)
FROM payment
WHERE amount = 0.00;