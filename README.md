# 🤓 Project_SQL 📊 


&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<img src="https://github.com/Anton-Utray/SQL_DataBase/blob/main/IMAGES/so-sad.jpg" width="500" height="500">


##  ✍️ Objetivo 🧭

Un cliente lleva años usando hojas de calculo de Excel a modo de base de datos y me ha contratado para regularizar su situación y poner orden a sus datos. 

El cliente me proporciona 7 CSV que contienen distintas tablas relacionadas a su negocio de videoclub. 

La secuencia de este proyecto se dividirá en 3 fases:

        1.Limpieza de datos provenientes de los CSV.
        2.Creación de nueva estructura de base de datos para MySQL.
        3.Adecuación de tablas y exportación a MySQL.

##  🔍  Metodología de limpieza 🧼 

La metodología sigue los siguientes pasos:

       - .head() para un vistazo inicial de cada tabla
       - .info() 
       - double-check dtypes
       - valores nulos
       - formula propia "uniquecols". Devuelve el conteo de valores unicos por columna.
       - el conteo de unicos en "ID" de cada tabala tiene que ser igual al numero de filas, para SQL.
       - las columnas con 1 valor unico se borran, ya que no aportan información.

       - duplicated().any() ver si hay duplicados. 
       - en ciertas tablas hemos ido mas allá y verificado duplicados usando subset de      columnas. 

##  💭  Brainstorming ERR Diagram 📌

Tomamos los CSV como molde para la estructura de la base de datos. De ahí emprendemos un analisis critico para optimizar esta estructura:

        - Cuantas tablas necesitamos:
          - Faltan/sobran tablas?    
        - Hay alguna columna que no nos interese? 
        - La estructura de columna por tablas es congruente? Faltaría hacer adecuaciones?

A través de estas preguntas vamos mapeando en un cuaderno una primera idea de como organizar nuestra base de datos. 

&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<img src="https://github.com/Anton-Utray/SQL_DataBase/blob/main/IMAGES/Diagrama_inicial%20.jpg" width="500" height="500">

Ya con una idea mas clara, nos lanzamos al forward engineering de workbench y creamos el diagrama. En un principio, la idea era de crear el diagrama y luego añadir la información a las tablas del mismo. Sin embargo, debido a la presencia de varias Foreign Keys en la estructura de base de datos, opté por importar primero las tablas para luego asignar las relaciones entre ellas.

El plan será entonces usar este diagrama como hoja de ruta y adecuar los CSV a la estructura de las tablas, haciendo drop o merges cuando se necesite. 

&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<img src="https://github.com/Anton-Utray/SQL_DataBase/blob/main/IMAGES/Diagrama_final%20(reverse).JPG" width="500" height="500">

https://github.com/Anton-Utray/SQL_DataBase/blob/main/IMAGES/Diagrama_final%20(reverse).JPG

##  💻 SQL ✔️

Tras esta adecuación, exportamos los CSV y usamos el table import wizzard de workbench. En un principio la idea fue de usar la misma interfaz grafica con la que creamos el ERR diagram pero tras varios intentos fallidos, cambiamos de estrategia. Tendremos que poner la query a mano. 

Import wizzard subió los archivos asignando unicamente tipos de datos text o int. Empezaremos primero cambiando los tipos de datos y asignando las Primary Key a cada tabla. En una segunda instancia, pasamos a asignar las relaciones entre tablas con una query.

Terminamos con una base de datos operativa. Con ciertos huecos en la información que nos proporcionó el cliente pero que está lista para irse actualizando en función de las necesidades del cliente. 
