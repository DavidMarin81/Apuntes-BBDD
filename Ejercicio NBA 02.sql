#--------------------------------------------------------------------------------------------
#	UTILIZACIÓN DE LA Base de Datos 'NBA'
#--------------------------------------------------------------------------------------------
USE NBA;
#--------------------------------------------------------------------------------------------
#	1. Creamos los roles Agregar, Borrar, Modificar, Listar, Todo.
#--------------------------------------------------------------------------------------------
DROP USER IF EXISTS	Rol1, Rol2, Rol3, Rol4;
CREATE USER 		Rol1, Rol2, Rol3, Rol4;
#--------------------------------------------------------------------------------------------
#	2.	Asignamos los permisos necesarios para cada Rol.
#--------------------------------------------------------------------------------------------
GRANT SELECT ON NBA.* TO Rol1;
GRANT INSERT ON NBA.* TO Rol2;
GRANT DELETE ON NBA.* TO Rol3;
GRANT UPDATE ON NBA.* TO Rol4;
GRANT ALL 	 ON NBA.* TO Rol5;

#--------------------------------------------------------------------------------------------
#	3. Creamos los usuarios Usuario1, Usuario2, Usuario3 y Usuario4 y les asignamos los permisos.
#--------------------------------------------------------------------------------------------
DROP USER IF EXISTS	Usuario1, Usuario2, Usuario3, Usuario4;
CREATE USER Usuario1 IDENTIFIED BY 'abc' DEFAULT ROLE Rol1, Rol2, Rol4;
CREATE USER Usuario2 IDENTIFIED BY 'abc' DEFAULT ROLE Rol1, Rol3;
CREATE USER Usuario3 IDENTIFIED BY 'abc' DEFAULT ROLE Rol2, Rol3;
CREATE USER Usuario4 IDENTIFIED BY 'abc' DEFAULT ROLE Rol1, Rol2, Rol3, Rol4;
#--------------------------------------------------------------------------------------------
#--------------------------------------------------------------------------------------------
