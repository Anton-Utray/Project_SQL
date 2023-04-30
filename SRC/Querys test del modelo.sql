use videoclub;

-- cuantas peliculas tenemos por categoria

SELECT category.category, COUNT(film.title) AS title_count
FROM category
JOIN film ON film.category_id = category.category_id
GROUP BY category.category;

-- LOS 10 ACTORES CON MAS PELIS

SELECT actor.full_name, count(film.title) AS film_titles
FROM film
JOIN film_actor ON film.film_id = film_actor.film_id
JOIN actor ON actor.actor_id = film_actor.actor_id
GROUP BY actor.full_name
ORDER BY film_titles DESC
LIMIT 10;

-- las top 5 mas alquiladas

SELECT film.title, COUNT(rental.rental_id) AS rental_count
FROM rental
JOIN inventory ON rental.inventory_id = inventory.inventory_id
JOIN film ON inventory.film_id = film.film_id
GROUP BY film.title
ORDER BY rental_count DESC
LIMIT 5;

-- top 5 mas alquiladas y su rate, vemos que 2 estan a 2.99 y se podría, por su popularidad, cobrar 4.99

SELECT film.title, COUNT(rental.rental_id) AS rental_count, rental_rate
FROM rental
JOIN inventory ON rental.inventory_id = inventory.inventory_id
JOIN film ON inventory.film_id = film.film_id
GROUP BY film.title, rental_rate
ORDER BY rental_count DESC
LIMIT 5;

-- Los clientes que mas alquilan 

SELECT customer_id, count(rental.rental_id) as num_rentals
FROM  rental
GROUP BY customer_id
ORDER BY num_rentals DESC
LIMIT 5;

-- las categorias de pelicula que mas se alquilan, excluyendo category 'unknown'
SELECT category.category, count(rental.rental_id) AS rental_count
FROM rental
JOIN inventory  ON rental.inventory_id = inventory.inventory_id
JOIN film ON inventory.film_id = film.film_id
JOIN category ON film.category_id = category.category_id
WHERE category.category <> 'unknown'
GROUP BY category.category
ORDER BY rental_count DESC
LIMIT 5;

-- Que tienda alquila mas pelis

SELECT store_id, count(rental.rental_id) as rental_count
FROM rental
JOIN inventory on inventory.inventory_id=rental.inventory_id
GROUP BY store_id
ORDER BY rental_count DESC;

-- alquiler de pelis por staff id

SELECT staff_id, count(rental.rental_id) as rental_count
FROM rental
GROUP BY staff_id
ORDER BY rental_count DESC;