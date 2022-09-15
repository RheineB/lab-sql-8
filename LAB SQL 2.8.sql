-- 1. Write a query to display for each store its store ID, city, and country.
SELECT s.store_id, ci.city, co.country
FROM sakila.store s
JOIN sakila.address a USING (address_id)
JOIN sakila.city ci USING (city_id)
JOIN sakila.country co USING (country_id)
ORDER BY store_id;

-- 2. Write a query to display how much business, in dollars, each store brought in.
SELECT * FROM sakila.sales_by_store;
 
-- 3. Which film categories are longest?
SELECT c.name, SUM(f.length)
FROM sakila.category c
JOIN sakila.film_category fc USING (category_id)
JOIN sakila.film f USING (film_id)
GROUP BY c.name
ORDER BY SUM(f.length) DESC;

-- 4. Display the most frequently rented movies in descending order.
SELECT f.title, COUNT(r.inventory_id) AS 'times rented'
FROM sakila.rental r
JOIN sakila.inventory i USING (inventory_id)
JOIN sakila.film f USING (film_id)
GROUP BY f.title
ORDER BY COUNT(r.inventory_id) DESC;

-- 5. List the top five genres in gross revenue in descending order.
select * from sakila.sales_by_film_category
ORDER BY total_sales DESC;

-- 6. Is "Academy Dinosaur" available for rent from Store 1?
SELECT i.store_id as store_number, COUNT(f.title) as title, f.title
FROM sakila.film f
JOIN sakila.inventory i
ON (f.film_id = i.film_id)
WHERE (f.title = "Academy Dinosaur") AND (i.store_id = 1);

-- 7. Get all pairs of actors that worked together.
SELECT  f.title, a.first_name, a.last_name
FROM sakila.film_actor fa
JOIN sakila.actor a
ON fa.actor_id = a.actor_id
JOIN sakila.film f ON fa.film_id = f.film_id
ORDER BY f.title; 

-- BONUS------------------------
-- 8. Get all pairs of customers that have rented the same film more than 3 times.
-- 9. For each film, list actor that has acted in more films