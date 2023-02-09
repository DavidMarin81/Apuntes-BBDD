- **BBDD**
	- Visitar https://www.w3schools.com/mysql/mysql_sql.asp
- **APUNTES DE BBDD**
- [NOT NULL]()
	- para  que la columna tenga valores nulos
- [UNIQUE]()
	- todos los valores de la columna son distintos
- [DEFAULT]()
	- valor concreto que tendrá una columna si no se especifica otro
		- **CREATE TABLE Empleado (
				 id INT DEFAULT 'AA',
				);**
			 _Toma el valor 'AA' por defecto_
- [SHOW CHARSET]()
	- SHOW COLLATION WHERE CHARSET = "UTF32";
	_Muestra la lista de los elementos que componen "utf32"_
	- ALTER DATABASE Titanic CHARACTER SET utf32 COLLATE utf32_spanish2_ci;
	_Pone la BBDD en español
	
- [CREATE DATABASE]()
	- **DROP DATABASE IF EXISTS empresa;**
 	- **CREATE DATABASE empresa;**
 	- **USE empresa;**
- [Para mostrar las tablas]()
	 - **DESCRIBE Empleado;**
	 - **SHOW tables;** _Muestra todas las tablas de la BBDD_
- [CREAR BBDD]()
	- **CREATE TABLE empleado (
	id int NOT NULL AUTO_INCREMENT,   _Crea un valor no nulo y 		  autoincremental_
	dniEmp varchar (9),
	nombre varchar (25),
	salario double,
	telefono int,
	idDep int
 );**
 - [CREAR TABLA CON UN CREATE + SELECT]()
	 - **CREATE TABLE Pasajeros AS (SELECT idPasajero, Clase, idCabina, Nombre, Edad, Sexo, PadresHijos, Familiares, Sobrevivió, idTicket FROM Titanic_Datos);**
	 - **CREATE TABLE Adquiere AS (SELECT DISTINCT idTicket, Tarifa, Embarque FROM Titanic_Datos);**
- [CREAR CLAVE PRIMARIA]()
	- **ALTER TABLE empleado add primary key (id);**

	 - **CREATE TABLE empleado (
			id INT PRIMARY KEY,
			dniEmp VARCHAR (9),
			nombre VARCHAR (25),
			salario DOUBLE,
			telefono INT,
			idDep INT
			 );**
	- **CREATE TABLE empleado (
	id INT,
	dniEmp VARCHAR (9),
	nombre VARCHAR (25),
	salario DOUBLE,
	telefono INT,
	idDep INT
	PRIMARY KEY (id)
	FOREIGN KEY (PersonID) REFERENCES Persons(PersonID)
 );**
	 - _*Para añadir varias claves primarias:_
		 - **CREATE TABLE Población (
	ProvinciaISO VARCHAR(2),
    Nombre VARCHAR(25),
    Sexo VARCHAR(10),
    Periodo INT,
    Total VARCHAR(9),
    CONSTRAIN PK_Poblacion PRIMARY KEY (ProvinciaISO, Sexo, Periodo)
 );**
	- _*Para dar un formato concreto a un Int:_
			- **salario DECIMAL (4, 1)**
			- _3 CIFRAS Y UN DECIMAL = (NUMERO TOTAL DE DIGITOS - INCLUYENDO LOS DECIMALES, CUANTOS VAN A SER DECIMALES)
 EN ESTE CASO, HABRÁ 4 NUMEROS EN TOTAL, DE LOS CUALES 1 VA A SER DECIMAL ej.- 456,5_
- [CREAR CLAVE FORANEA]()
	- **ALTER TABLE empleado ADD FOREIGN KEY (idDep) REFERENCES departamento (id);**
- [CREAR CAMPOS UNICOS]()
	- **ALTER TABLE empleado ADD UNIQUE (dniEmp);**
- [MODIFICAR NOMBRE DE LA TABLA]()
	- **ALTER TABLE empleado RENAME TABLE old_table TO new_table;**
	- **RENAME TABLE old_table TO new_table;**
- [MODIFICAR CAMPOS DE LA TABLA]()
	- **ALTER TABLE empleado CHANGE id idEmpleado int;** (valor antiguo –> valor nuevo especificando tipo)
	- **ALTER TABLE empleado RENAME COLUMN apellido TO apellidos;**
- [AÑADIR CAMPO A LA TABLA]()
	- **ALTER TABLE empleado ADD COLUMN direccion varchar (50);**
	- _Se puede usar_ **FIRST** o **AFTER** _***nombre_del_campo***_ _para posicionar la columna_
	- **ALTER TABLE empleado ADD COLUMN direccion varchar (50) AFTER apellidos;**
- [MODIFICAR UN CAMPO PARA QUE NO PUEDA SER NULO]()
	- **ALTER TABLE empleado CHANGE nombre nombre varchar (30) NOT NULL;**
	- **ALTER TABLE empleado MODIFY nombre varchar (30) NOT NULL;**
- [ELIMINAR LA TABLA]()
	- **ALTER TABLE empleado DROP COLUMN direccion;**
	- **ALTER TABLE empleado DROP PRIMARY KEY;**
	- **ALTER TABLE empleado DROP FOREIGN KEY idDep;**
- [COMPROBACIONES DE DATOS (CHECK)]()
	- **ALTER TABLE pasajerosTitanic ADD CHECK (Clase IN(1, 2, 3));**
	- **ALTER TABLE pasajerosTitanic ADD CHECK (Sexo IN('fame', 'female'));**
	- **ALTER TABLE pasajerosTitanic ADD CHECK (Familiares > -1);**
	- **ALTER TABLE pasajerosTitanic ADD CHECK (Sobrevivió > 0 AND Clase > 0);**
	- **ALTER TABLE pasajerosTitanic ADD CHECK (Sobrevivió > 0 OR Clase > 0);**
	- **ALTER TABLE pasajerosTitanic ADD CHECK (PadresHijos IS NOT NULL);**
	- **ALTER TABLE pasajerosTitanic ADD CHECK (nombre IS NOT NULL OR nombre ='');**
- [CONSULTAS (**SELECT**)]()
	- **SELECT * FROM diamantes;**
	- **SELECT ID, nombre FROM diamantes;**
	- **SELECT DISTINCT precio FROM diamantes;** *"Muestra los precios sin repetir"*
	- *Muestra los valores que esten dentro del parentesis. La coma actua como un **"OR"***
	- **SELECT nombre, edad FROM alumnos WHERE edad IN (18, 35, 45);**
	- *Muestra solo las edades que sean 18, 35, 45*
	- *No muestra los valores que estan dentro del parentesis. La coma actua con un **"AND"***
	- **SELECT nombre, edad FROM alumnos WHERE edad NOT IN (18, 35, 45);** 
	- Muestra solo las edades que no sean 18, 35, 45
	- **SELECT nombre, edad FROM alumnos WHERE edad = 18 OR edad = 35;**
- [CONSULTAS CON OPERADORES DE RANGO(**SELECT**)]()
	- **SELECT * FROM diamante WHERE precio >= 8000 AND precio <= 10000;**
	- **SELECT * FROM diamante WHERE NOT(precio < 8000 OR precio > 10000);**
	- **SELECT * FROM diamante WHERE precio BETWEEN (8000, 10000);**
	- **SELECT * FROM diamante WHERE NOT(precio BETWEEN 0 AND 7999 OR precio BETWEEN 10001 AND 100000);**
	- **SELECT * FROM Recetas WHERE NOT(comensales between 2 AND 2) OR NOT(valoracion between 1 AND 2);**
- [CONSULTAS CON OPERADORES DE VALOR NULO(**SELECT**)]()
	- **SELECT * FROM oficina WHERE ciudad IS NULL;**
	- **SELECT * FROM Diamante WHERE color IS NOT NULL;**
	- **SELECT * FROM Recetas WHERE Dificultad IS NULL AND Tipo IS NOT NULL;**
- [PARA CAMBIAR EL NOMBRE A LA COLUMNA]()
	- **SELECT AlumnosID AS ID, name AS nombre FROM alumnos;**
	- **select * from oficina where ciudad IS NULL;**
	- **select * from Diamante where color IS NOT NULL;**
- [INSERTAR VALORES (**INSERT**)]()
	- **INSERT INTO PasajerosTitanic (idPasajero, Sobrevivió, Clase, Nombre)
		VALUES ( 1, 0, 3, 'Braund,  Mr. Owen Harris');**
		
	- **INSERT INTO	ComarcasGalicia
	VALUES 	( 100, 'Arzúa', 10 ),
		( 101, 'Barbanza', 10 ),
		( 102, 'A Barcala', 10 ),
                ( 103, 'Bergantiños', 10 )
	);**

- [DICCIONARIO ASOCIADO]()
	- TITANIC = { Titanic } * el archivo del Titanic *
	- Pasajeros = @idPasajero + Clase + idCabina + Nombre + Edad + Sexo + PadresHijos + Familiares + Sobrevivió + idTicket
	 - Adquiere = @idTicket + Tarifa + Embarque
	 - idPasajero = * identificador interno de un pasajero, campo clave del depósito Pasajeros ** [1...999] **un número entre 1 y 99 *
	- Clase = 1{ digito [1|2|3] }
	 - idCabina = { ([A] + digito [1..370]) OR _([B] + digito [1..168]) OR ([C] + digito [1..297]) } 
	*El Titanic tenía 370 cabinas de primera clase (A), 168 cabinas de segunda clase (B) y 297 cabinas de tercera clase* 
	-  Nombre = 1{ Apellido (en formato letra UpperCase) + ',' + Nombre (en formato letra UpperCase }100 ** Apellido y nombre debe estar separado por una coma. 
	-  Edad = 1{ dígito }3
	-  Sexo = [ 'male' | 'female' ]
	-  PadresHijos = 1{ digito }
	-  Familiares = 1{ digito }
	-  Sobrevivió = [ 0 | 1 ]
	- idTicket = 1{ letras, digitos }50
	- idTicket = 1{ letras, digitos }50 * identificador interno de un ticket, campo clave del depósito Adquiere ** [1...50] *
	- Tarifa = 1{ digitos }8
	- Embarque = 1{ 'C' | 'Q' | 'S' }  ** 'C' -> Cheburgo | 'Q' -> Queenstown | 'S' -> Southampton **
	- digito = [ 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 0 ]
	- letra = [A...Z | a..z]
