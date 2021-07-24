use friends;
-- 1.Devuelva a todos los usuarios que son amigos de Kermit, asegúrese de que sus nombres se muestren en los resultados.
select * from friendships; 
select * from users; 

select users.first_name as nombre, users.last_name as apellido, user2.first_name as Amigo_Nombre, user2.last_name as Amigo_Apellido from users
join friendships on users.id = friendships.user_id
join users as user2 on friendships.friend_id = user2.id
;

-- 2.Devuelve el recuento de todas las amistades.
select users.first_name as nombre, users.last_name as apellido, count(user2.id) as Numero_de_Amigos from users
left join friendships on users.id = friendships.user_id
left join users as user2 on friendships.friend_id = user2.id
group by users.id
;

-- 3.Descubre quién tiene más amigos y devuelve el recuento de sus amigos.
select users.first_name as nombre, users.last_name as apellido, count(user2.id) as Numero_de_Amigos from users
left join friendships on users.id = friendships.user_id
left join users as user2 on friendships.friend_id = user2.id
group by users.id
order by count(user2.id) desc
;

-- 4.Crea un nuevo usuario y hazlos amigos de Eli Byers, Kermit The Frog y Marky Mark.
select * from friendships; 
select * from users; 
INSERT INTO `friends`.`users`
(`first_name`,`last_name`,`created_at`)
VALUES ('Yamy','Gorrin', NOW());

INSERT INTO `friends`.`friendships`
(`user_id`, `friend_id`,`created_at`)
VALUES (6, 2, NOW());

INSERT INTO `friends`.`friendships`
(`user_id`, `friend_id`,`created_at`)
VALUES (6, 4, NOW());

INSERT INTO `friends`.`friendships`
(`user_id`, `friend_id`,`created_at`)
VALUES (6, 5, NOW());

-- 5.Devuelve a los amigos de Eli en orden alfabético.
select * from users; 
select users.first_name as nombre, users.last_name as apellido, user2.first_name as Amigo_Nombre, user2.last_name as Amigo_Apellido from users
join friendships on users.id = friendships.user_id
join users as user2 on friendships.friend_id = user2.id
where users.id = 2
order by user2.first_name asc
;

-- 6.Eliminar a Marky Mark de los amigos de Eli.
select * from users; 
DELETE FROM `friends`.`friendships`
WHERE user_id = 2 and friend_id = 5;

-- 7.Devuelve todas las amistades, mostrando solo el nombre y apellido de ambos amigos
select concat(users.first_name, " ", users.last_name) AS Usuario, concat(user2.first_name, " ", user2.last_name) AS Amigo from users
join friendships on users.id = friendships.user_id
join users as user2 on friendships.friend_id = user2.id
;
