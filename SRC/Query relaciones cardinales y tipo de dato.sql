/*
Como importamos las tablas sin existir en la base de datos, asignó unicamente tipos "text" o "int"
Primero vamos a modificar los tipos de valor por tabla y asignar los primary keys

Despues, haremos las relaciones de FK porque no he conseguido hacerlo a través del diagrama.
Me he fijado que en la query de uno de los labs que usa ADD INDEX en las FK de cada tabla para cambiar la estructura a indice
Esto hace mas eficiente el codigo. A la hora de asignar las FK se tiene que hacer referencia al indice de la FK en vez de la columna en si. (para que en vez de leer como entero, lo lee como indice y hace las asociaciones mas rapido)

En la ultima asociación de FK me dí cuenta que no encajan los valores de las columnas 'inventory ID' entre las tablas 'rental' y 'inventory'. En inventory los ID tienen rango hasta 1000 y en rental ascienden hasta los 4000 y cacho. 

Esto significa que nuestra base de datos de inventory está incompleta. En concreto solo tiene inventario de las peliculas de A-D.

Para efectos de poder vincular las tablas con FK, borraré de la tabla 'rental' todas las filas que contengan un id por encima de 1000. Cuando el cliente entregue la base de datos completa podremos añadir los IDs faltantes. 

*/

ALTER TABLE videoclub.actor
MODIFY COLUMN actor_id INT NOT NULL,
MODIFY COLUMN full_name VARCHAR(200),
ADD PRIMARY KEY (actor_id);

ALTER TABLE videoclub.category
MODIFY COLUMN category_id INT NOT NULL,
MODIFY COLUMN category VARCHAR(200),
ADD PRIMARY KEY (category_id);

ALTER TABLE videoclub.film
MODIFY COLUMN film_id INT NOT NULL,
MODIFY COLUMN title VARCHAR(200),
MODIFY COLUMN `description` VARCHAR(200),
MODIFY COLUMN language_id INT,
MODIFY COLUMN rental_duration INT, 
MODIFY COLUMN rental_rate FLOAT,
MODIFY COLUMN length INT,
MODIFY COLUMN replacement_cost FLOAT, 
MODIFY COLUMN rating VARCHAR(45),
MODIFY COLUMN special_features VARCHAR(200),
MODIFY COLUMN category_id INT,
ADD INDEX fk_film_category1_idx (category_id ASC) VISIBLE,
ADD INDEX fk_film_language1_idx (language_id ASC) VISIBLE,
ADD PRIMARY KEY (film_id);

ALTER TABLE videoclub.film_actor 
ADD INDEX fk_film_actor_actors1_idx (actor_id ASC) VISIBLE,
ADD INDEX fk_film_actor_film1_idx (film_id ASC) VISIBLE;

ALTER TABLE videoclub.inventory 
MODIFY COLUMN inventory_id INT NOT NULL,
MODIFY COLUMN film_id INT NOT NULL,
MODIFY COLUMN store_id INT,
ADD INDEX fk_inventory_film1_idx (film_id ASC) VISIBLE,
ADD PRIMARY KEY (inventory_id);

ALTER TABLE videoclub.`language`
MODIFY COLUMN `language_id` INT NOT NULL,
MODIFY COLUMN `language` VARCHAR(200),
ADD PRIMARY KEY (`language_id`);

ALTER TABLE videoclub.rental
MODIFY COLUMN rental_id INT NOT NULL,
MODIFY COLUMN rental_date DATETIME,
MODIFY COLUMN inventory_id INT,
MODIFY COLUMN customer_id INT, 
MODIFY COLUMN return_date DATETIME,
MODIFY COLUMN staff_id INT,
ADD INDEX fk_rental_inventory1_idx (inventory_id ASC) VISIBLE,
ADD PRIMARY KEY (rental_id);

ALTER TABLE videoclub.film 
ADD CONSTRAINT fk_film_category1
  FOREIGN KEY (category_id)
  REFERENCES videoclub.category (category_id)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT fk_film_language1
  FOREIGN KEY (language_id)
  REFERENCES videoclub.language (language_id)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
ALTER TABLE videoclub.film_actor 
ADD CONSTRAINT fk_film_actor_actors1
  FOREIGN KEY (actor_id)
  REFERENCES videoclub.actor (actor_id)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
  
ADD CONSTRAINT fk_film_actor_film1
  FOREIGN KEY (film_id)
  REFERENCES videoclub.film (film_id)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
ALTER TABLE videoclub.inventory 
ADD CONSTRAINT fk_inventory_film1
  FOREIGN KEY (film_id)
  REFERENCES videoclub.film (film_id)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

DELETE FROM videoclub.rental WHERE inventory_id > 1000; -- En la ultima etapa 

  
ALTER TABLE videoclub.rental 
ADD CONSTRAINT fk_rental_inventory1
  FOREIGN KEY (inventory_id)
  REFERENCES videoclub.inventory (inventory_id)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;



