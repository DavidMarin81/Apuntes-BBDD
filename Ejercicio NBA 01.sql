#--------------------------------------------------------------------------------------------
#	UTILIZACIÓN DE LA Base de Datos 'NBA'
#--------------------------------------------------------------------------------------------
	USE NBA;
#--------------------------------------------------------------------------------------------
#	1. Creamos los usuarios Usuario1, Usuario2, Usuario3 y Usuario4.
#--------------------------------------------------------------------------------------------
# Primera opción
DROP USER IF EXISTS	Usuario1;
DROP USER IF EXISTS	Usuario2;
DROP USER IF EXISTS	Usuario3;
DROP USER IF EXISTS	Usuario4;
CREATE USER Usuario1 IDENTIFIED BY 'abc';
CREATE USER Usuario2 IDENTIFIED BY 'abc';
CREATE USER Usuario3 IDENTIFIED BY 'abc';
CREATE USER Usuario4 IDENTIFIED BY 'abc';

# Segunda opción
DROP USER IF EXISTS	Usuario1, Usuario2, Usuario3, Usuario4;
CREATE USER Usuario1 IDENTIFIED BY 'abc', Usuario2 IDENTIFIED BY 'abc', Usuario3 IDENTIFIED BY 'abc', Usuario4 IDENTIFIED BY 'abc';

#--------------------------------------------------------------------------------------------
#	2. Creamos los roles Rol1, Rol2 y Rol3.
#--------------------------------------------------------------------------------------------
DROP ROLE IF EXISTS Rol1, Rol2, Rol3;
CREATE ROLE 		Rol1, Rol2, Rol3;
#--------------------------------------------------------------------------------------------
#	3. Asignamos Privilegios a los Roles ( R1 - seleccionar, R2 - agregar, R3 - borrar ).
#--------------------------------------------------------------------------------------------
GRANT SELECT ON NBA.* TO Rol1;            	# -> *.*  (BBDD.TABLES)
GRANT SELECT ON NBA.* TO Rol2;				# -> *.*  (BBDD.TABLES)
GRANT SELECT ON NBA.* TO Rol3;				# -> *.*  (BBDD.TABLES)
#--------------------------------------------------------------------------------------------
#	4. Asignamos Roles a Usuarios.
#		Usuario1 -> Rol1 y Rol2
#		Usuario2 -> Rol1 y Rol3
#		Usuario3 -> Rol2 y Rol3
#		Usuario4 -> Rol1, Rol2 y Rol3
#--------------------------------------------------------------------------------------------
GRANT Rol1, Rol2 		TO 	Usuario1;
GRANT Rol1, Rol3 		TO 	Usuario2;
GRANT Rol2, Rol3 		TO 	Usuario3;
GRANT Rol1, Rol2, Rol3 	TO 	Usuario4;
#--------------------------------------------------------------------------------------------
#	5. Activamos los Roles de los Usuarios (si crees necesario).
#--------------------------------------------------------------------------------------------
SET DEFAULT ROLE ALL TO Usuario1, Usuario2, Usuario3, Usuario4;
