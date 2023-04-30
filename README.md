# Project_SQL


Hemos empezado por una limpieza de los CSV. 

## Metodología de limpieza

La metodología sigue los siguientes pasos:

 - .head() para un vistazo inicial de cada tabla
 - .info() 
    - double-check dtypes
    - valores nulos
- formula propia "uniquecols". Devuelve el conteo de valores unicos por columna.
   - el conteo de unicos en "ID" de cada tabala tiene que ser igual al numero de filas, para SQL.
   - las columnas con 1 valor unico se borran, ya que no aportan información.

- duplicated().any() ver si hay duplicados. 
   - en ciertas instancias hemos ido mas allá y verificado duplicados usando subset de columnas. 

## Brainstorming ERR Diagram

Tomamos los CSV como molde para la estructura de la base de datos. De ahí emprendemos un analisis critico para optimizar esta base:

- Cuantas tablas necesitamos:
  - Faltan/sobran tablas?    
- Hay alguna columna que no nos interese? 
- La estructura de columna por tablas es congruente? Faltaría hacer adecuaciones?

A través de estas preguntas vamos mapeando en un cuaderno una primera idea de como organizar nuestra base de datos. 

Ya con una idea mas clara, nos lanzamos al forward engineering de workbench y creamos el diagrama. En un principio, la idea era de crear el diagrama y luego añadir la información a las tablas del mismo, pero por las FK, retrocedí sobre esta idea. 

El plan será entonces crear este diagrama como hoja de ruta y adecuar los CSV a la estructura de las tablas, haciendo drop o merges cuando se necesite. 

(MAS INFO SOBRE LOS MERGE- tal vez conviene hacer dos notebooks distintos, uno data cleaning y luego otro de merge. pero bueno explica tu logica con los merge)

## SQL 

Tras esta adecuación, exportamos los CSV y usamos el table import wizzard de workbench. En un principio la idea fue de usar la misma interfaz grafica con la que creamos el ERR diagram pero tras varios intentos fallidos, cambiamos de estrategia. Tendremos que poner la query a mano. 

Import wizzard subió los archivos asignando unicamente tipos de datos text o int. Empezaremos primero cambiando los tipos de datos y asignando las PK a cada tabla. 

Luego tocará meter query para relacionar las tablas entre si con FK.

