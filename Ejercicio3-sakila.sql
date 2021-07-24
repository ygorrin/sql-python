use sakila;
-- 1. ¿Qué consulta ejecutarías para obtener todos los clientes dentro de city_id = 312? Su consulta debe devolver el nombre, apellido, 
-- correo electrónico y dirección del cliente.
select city.city_id, customer.first_name, customer.last_name, customer.email, address.address from customer
	left join address on customer.address_id = address.address_id
	left join city on address.city_id = city.city_id
	where city.city_id = 312;

-- 2. ¿Qué consulta harías para obtener todas las películas de comedia? Su consulta debe devolver el título de la película, la descripción, 
-- el año de estreno, la calificación, las características especiales y el género (categoría).
select film.title, film.description, film.release_year, film.rating, film.special_features, category.name from film
	left join film_category on film.film_id = film_category.film_id
	left join category on film_category.category_id = category.category_id
	where category.name = 'Comedy';

-- 3. ¿Qué consulta harías para obtener todas las películas unidas por actor_id = 5? Su consulta debe devolver la identificación del actor, 
-- el nombre del actor, el título de la película, la descripción y el año de lanzamiento.
select actor.actor_id, concat(actor.first_name, " ", actor.last_name), film.film_id, film.title, film.description, film.release_year from film
	left join film_actor on film.film_id = film_actor.film_id
	left join actor on film_actor.actor_id = actor.actor_id
	where actor.actor_id =5;

-- 4. ¿Qué consulta ejecutaría para obtener todos los clientes en store_id = 1 y dentro de estas ciudades (1, 42, 312 y 459)? Su consulta debe devolver el 
-- nombre, apellido, correo electrónico y dirección del cliente.
select store.store_id, city.city_id, customer.first_name, customer.last_name, customer.email, address.address from customer
	left join address on customer.address_id = address.address_id
	left join city on city.city_id = address.city_id
	left join store on customer.store_id = store.store_id
	where store.store_id = 1 and (city.city_id = 1 or city.city_id = 42 or city.city_id = 312 or city.city_id = 459);

-- 5. ¿Qué consulta realizarías para obtener todas las películas con una "calificación = G" y "característica especial = detrás de escena", 
-- unidas por actor_id = 15? Su consulta debe devolver el título de la película, la descripción, el año de lanzamiento, la calificación y 
-- la función especial. Sugerencia: puede usar la función LIKE para obtener la parte 'detrás de escena'.
select * from film;
select film.title, film.description, film.release_year, film.rating, film.special_features from film
	left join film_actor on film.film_id = film_actor.film_id
	left join actor on film_actor.actor_id = actor.actor_id
	where film.rating = 'G' and film.special_features like '%ehin%' and actor.actor_id= 15;

-- 6. ¿Qué consulta harías para obtener todos los actores que se unieron en el film_id = 369? Su consulta debe devolver film_id, title, actor_id y actor_name.
select film.film_id, film.title, actor.actor_id, concat(actor.first_name, " ", actor.last_name) from actor
	left join film_actor on actor.actor_id = film_actor.actor_id
	left join film on film_actor.film_id = film.film_id
	where film.film_id = 369
	order by actor.actor_id asc;

-- 7. ¿Qué consulta harías para obtener todas las películas dramáticas con una tarifa de alquiler de 2.99? Su consulta debe devolver el 
-- título de la película, la descripción, el año de estreno, la calificación, las características especiales y el género (categoría).

select film.title, film.description, film.release_year, film.rating, film.special_features, category.name as genre, film.rental_rate from film
left join film_category on film.film_id = film_category.film_id
left join category on film_category.category_id = category.category_id
where film.rental_rate = 2.99 and category.name = 'Drama';

-- 8. ¿Qué consulta harías para obtener todas las películas de acción a las que se une SANDRA KILMER? Su consulta debe devolver el 
-- título de la película, la descripción, el año de estreno, la calificación, las características especiales, el género (categoría) 
-- y el nombre y apellido del actor.

select actor.actor_id, concat(actor.first_name, " ", actor.last_name), film.film_id, film.title, film.description, film.release_year, 
		film.rating, film.special_features, category.name as genre from film
        left join film_actor on film.film_id = film_actor.film_id
        left join actor on film_actor.actor_id = actor.actor_id
        left join film_category on film.film_id = film_category.film_id
        left join category on film_category.category_id = category.category_id
        where actor.actor_id = 23 and category.name = 'Action';
        

