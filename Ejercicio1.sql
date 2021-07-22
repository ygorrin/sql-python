SELECT * FROM twitter.users;

INSERT INTO `twitter`.`users`
(`first_name`, `last_name`, `handle`,`birthday`, `created_at`)
VALUES ('Yamy', 'Gorrin', 'ygorrin', '2000-08-21', NOW());

UPDATE `twitter`.`users` 
SET `handle` = 'yamilagorrin', `updated_at` = NOW()
WHERE `id` = 6;

DELETE FROM `twitter`.`users`
WHERE `id` = 5;