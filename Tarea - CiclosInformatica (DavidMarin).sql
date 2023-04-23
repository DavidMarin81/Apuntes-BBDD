#*******************************************************************************************
#	CREACIÓN Y USO DE LA BASE DE DATOS 'CiclosInformatica'
#*******************************************************************************************
DROP DATABASE IF EXISTS CiclosInformatica;
CREATE DATABASE CiclosInformatica;
USE CiclosInformatica;
#*******************************************************************************************
#	CREACIÓN DE LAS TABLAS DE LA BASE DE DATOS
#*******************************************************************************************
#		TABLA Modulo
#*******************************************************************************************
#		idModulo		int				auto_increment desde 50
#		sigla			varchar(5)
#		codigo			varchar(6)
#		nombre			text
#		horas			int
#		curso			int
#		ciclo			text
#
#		Llave primaria 			->	idModulo
#		Valor único    			->	codigo
#		Comprobación de Valor no nulo	->	sigla, codigo, nombre, horas
#		Comprobación de Valor no vacío	->	sigla, codigo, nombre
#		Comprobación de Valor positivo	->	horas
#		Índice				->	codigo
#*******************************************************************************************
CREATE TABLE Modulo (
				idModulo 			INT AUTO_INCREMENT, 
				sigla 				VARCHAR(5),
				codigo 				VARCHAR(6),
                   		nombre				TEXT,
				horas 				INT,
				curso 				INT,
				ciclo 				TEXT,
	CONSTRAINT		PK_Modulo			PRIMARY KEY 	( idModulo ),					#PK  -> PRIMARY KEY
	#CONSTRAINT		UK_Sigla			UNIQUE KEY 	( sigla ),					#UK  -> UNIQUE KEY
	CONSTRAINT		UK_Codigo			UNIQUE KEY 	( codigo ),					#UK  -> UNIQUE KEY
	CONSTRAINT		INN_Sigla			CHECK 		( sigla 		IS NOT NULL ),		#INN -> IS NOT NULL
	CONSTRAINT		INN_Codigo			CHECK 		( codigo 		IS NOT NULL ),		#INN -> IS NOT NULL
	CONSTRAINT		INN_Nombre			CHECK 		( nombre 		IS NOT NULL ),		#INN -> IS NOT NULL
	CONSTRAINT		INN_Horas			CHECK 		( horas 		IS NOT NULL ),		#INN -> IS NOT NULL
	CONSTRAINT		INE_Sigla			CHECK 		( sigla 		!= '' ),		#INN -> IS NOT EMPTY
	CONSTRAINT		INE_Codigo			CHECK 		( codigo 		!= '' ),		#INN -> IS NOT EMPTY
	CONSTRAINT		INE_Nombre			CHECK 		( nombre 		!= '' ),		#INN -> IS NOT EMPTY
	CONSTRAINT		POS_Horas			CHECK 		( horas 		> 0 ),			#POS -> POSITIVA
	INDEX 			ID_Codigo( Codigo )
  ) AUTO_INCREMENT = 50;
       
## OTRA FORMA: 
#ALTER TABLE Modulo AUTO_INCREMENT = 50;
#ALTER TABLE Modulo ADD CONSTRAINT idModulo PRIMARY KEY (idModulo);
#ALTER TABLE Modulo ADD UNIQUE (sigla);
#ALTER TABLE Modulo ADD UNIQUE (codigo);
#ALTER TABLE Modulo ADD CHECK (sigla 	IS NOT NULL AND 	sigla 	!= 	"");
#ALTER TABLE Modulo ADD CHECK (codigo 	IS NOT NULL AND 	codigo 	!= 	"");
#ALTER TABLE Modulo ADD CHECK (nombre 	IS NOT NULL AND 	nombre 	!= 	"");
#ALTER TABLE Modulo ADD CHECK (horas 	IS NOT NULL AND 	horas 	> 	0);
# Falta "Indice" -> "Codigo"

#*******************************************************************************************
#	AÑADIMOS LOS DATOS
#*******************************************************************************************
INSERT INTO Modulo( sigla, codigo, nombre, horas, curso, ciclo )	VALUES
		( 'ISO',	'MP0369',	'Implantación de sistemas operativos',				213, 1, 'ASIR' ),
        ( 'PAR',	'MP0370',	'Planificación e administración de redes',				213, 1,	'ASIR' ),
        ( 'FH',		'MP0371',	'Fundamentos de hardware',						107, 1,	'ASIR' ),
        ( 'XBD',	'MP0372',	'Xestión de bases de datos',						187, 1, 'ASIR' ),
        ( 'LMSXE', 	'MP0373',	'Linguaxes de marcas e sistemas de xestión empresarial',		133, 1,	'ASIR,DAM,DAW' ),
        ( 'ASO',	'MP0374',	'Administración de sistemas operativos',				140, 2, 'ASIR' ),
        ( 'SRI',	'MP0375',	'Servizos de rede e internet',						140, 2, 'ASIR' ),
        ( 'IAW',	'MP0376',	'Implantación de aplicacións web',					122, 2, 'ASIR' ),
        ( 'ASXBD',	'MP0377',	'Administración de sistemas xestores de bases de datos',		 70, 2, 'ASIR' ),
        ( 'SAD',	'MP0378',	'Seguridade e alta dispoñibilidade',					105, 2, 'ASIR' ),
        ( 'PASIR',	'MP0379',	'Proxecto de administración de sistemas informáticos en rede',	 	 26, 2,	'ASIR' ),
        ( 'FOL',	'MP0380',	'Formación e orientación laboral',					107, 1, 'ASIR' ),
	( 'EIE',	'MP0381',	'Empresa e iniciativa emprendedora',					 53, 2, 'ASIR' ),
        ( 'FCT',	'MP0382',	'Formación en centros de traballo',					384, 2,	'ASIR' ),
	( 'SI', 	'MP0483',	'Sistemas Informáticos',						186, 1, 'DAM,DAW' ),
        ( 'BD',		'MP0484',	'Bases de Datos',							187, 1, 'DAM,DAW' ),
        ( 'PRG',	'MP0485',	'Programación',								240, 1, 'DAM,DAW' ),
        ( 'AD',		'MP0486',	'Acceso a datos',							157, 2, 'DAM' ),
        ( 'CD',		'MP0487',	'Contornos de Desenvolvemento',						107, 1, 'DAM,DAW' ),
        ( 'DI',		'MP0488',	'Desenvolvemento de Interfaces',					140, 2,	'DAM' ),
        ( 'PMDM',	'MP0489',	'Programación multimedia e dispositivos móbiles',			123, 2, 'DAM' ),
        ( 'PSP',	'MP0490',	'Programación de servizos e procesos',					 70, 2,	'DAM' ),
        ( 'SXE',	'MP0491',	'Sistemas de xestión empresarial',					 87, 2, 'DAM' ),
        ( 'PDAM',	'MP0492',	'Proxecto de desenvolvemento de aplicacións multiplaforma',		 26, 2,	'DAM' ),
        ( 'FOL',	'MP0493',	'Formación e orientación laboral',					107, 1, 'DAM' ),
        ( 'EIE',	'MP0494',	'Empresa e iniciativa emprendedora',					 53, 2, 'DAM' ),
        ( 'FCT',	'MP0495',	'Formación en centros de traballo',					384, 2, 'DAM' ),
        ( 'DWBC',	'MP0612',	'Desenvolvemento Web en contorno Cliente',				157, 2, 'DAW' ),
        ( 'DWBS',	'MP0613',	'Desenvolvemento Web en contorno Servidor',				175, 2, 'DAW' ),
        ( 'DAW',	'MP0614',	'Despregamento de Aplicacións Web',					 88, 2, 'DAW' ),
        ( 'DIW',	'MP0615',	'Deseño de Interfaces Web',						157, 2, 'DAW' ),
        ( 'PDAW',	'MP0616',	'Proxecto de desenvolvemento de Aplicacións Web',			 26, 2, 'DAW' ),
        ( 'FOL',	'MP0617',	'Formación e orientación laboral',					107, 1, 'DAW' ),
        ( 'EIE',	'MP0618',	'Empresa e iniciativa emprendedora',					 53, 2, 'DAW' ),
        ( 'FCT',	'MP0619',	'Formación en centros de traballo',					384, 2, 'DAW' )
        ;
#*******************************************************************************************
#	CREAMOS LOS GRUPOS DE USUARIOS:	Direccion, Alumnado, Profesorado
#		En Dirección → Director, Vicedirector, Secretario, JefeEstudiosDiurno, JefeEstudiosNoctu
#		En Alumnado -> AlumnadoDAM, AlumnadoDAW, AlumnadoASIR
#		En Profesorado -> ProfesoradoDAM, ProfesoradoDAW, ProfesoradoASIR
#-------------------------------------------------------------------------------------------
#	DROP ROLE IF EXISTS <Rol1>, <Rol2>, ..., <RolN>;
#	CREATE ROLE 	    <Rol1>, <Rol2>, ..., <RolN>;
#*******************************************************************************************
# Se crean los roles para Direccion, Alumnado y Profesorado
DROP ROLE IF EXISTS 	Direccion, Alumnado, Profesorado;
CREATE ROLE 			Direccion, Alumnado, Profesorado;
# Se crean los roles de Director, Vicedirector, Secretario, JefeEstudiosDiurno, JefeEstudiosNocturno
DROP ROLE IF EXISTS 	Director, Vicedirector, Secretario, jefeEstudiosDiurno, jefeEstudiosNocturno;
CREATE ROLE				Director, Vicedirector, Secretario, jefeEstudiosDiurno, jefeEstudiosNocturno;
# Se crean los roles de AlumnadoDAM, AlumnadoDAW, AlumnadoASIR;
DROP ROLE IF EXISTS 	AlumnadoDAM, AlumnadoDAW, AlumnadoASIR;
CREATE ROLE				AlumnadoDAM, AlumnadoDAW, AlumnadoASIR;
# Se crean los roles de ProfesoradoDAM, ProfesoradoDAW, ProfesoradoASIR
DROP ROLE IF EXISTS 	ProfesoradoDAM, ProfesoradoDAW, ProfesoradoASIR;
CREATE ROLE				ProfesoradoDAM, ProfesoradoDAW, ProfesoradoASIR;
#*******************************************************************************************
#	ASIGNAMOS LOS MISMOS PRIVILEGIOS A LOS COMPONENTES DE LOS GRUPOS ALUMNADO Y PROFESORADO
#-------------------------------------------------------------------------------------------
#	GRANT <RolGrupo> TO <RolComponente1>, <RolComponente2>, ..., <RolComponenteN>;
#*******************************************************************************************
GRANT Alumnado  	TO AlumnadoDAM, 	AlumnadoDAW, 	AlumnadoASIR;
GRANT Profesorado 	TO ProfesoradoDAM, 	ProfesoradoDAW, ProfesoradoASIR;
#*******************************************************************************************
#	CREAMOS LAS VISTAS ASOCIADAS A CADA CICLO FORMATIVO
#-------------------------------------------------------------------------------------------
#	DROP VIEW IF EXISTS ..., ..., ...;
#	CREATE VIEW ... AS SELECT ...;
#*******************************************************************************************
# Vista para el Ciclo de ASIR
DROP VIEW IF EXISTS CicloASIR; 
CREATE VIEW 		CicloASIR	AS SELECT sigla, codigo, nombre, horas, curso FROM Modulo WHERE ciclo like '%ASIR%';
# Vista para el Ciclo de DAM
DROP VIEW IF EXISTS CicloDAM; 
CREATE VIEW 		CicloDAM 	AS SELECT sigla, codigo, nombre, horas, curso FROM Modulo WHERE ciclo like '%DAM%';
# Vista para el Ciclo de DAW
DROP VIEW IF EXISTS CicloDAW; 
CREATE VIEW 		CicloDAW	AS SELECT sigla, codigo, nombre, horas, curso FROM Modulo WHERE ciclo like '%DAW%';
#*******************************************************************************************
#	ASIGNAMOS LOS PERMISOS A DIRECCIÓN Y A LOS GRUPOS DEL PROFESORADO
#-------------------------------------------------------------------------------------------
#	GRANT <permiso> ON <tabla> TO <Rol1>, <Rol2>, ..., <Rol3>;
#*******************************************************************************************
GRANT ALL ON Modulo	TO Direccion 		WITH GRANT OPTION;
# Se le dan los permisos a las vistas para más adelante asignárselas a los alumnos
GRANT ALL ON Modulo	TO VistaASIR 		WITH GRANT OPTION;
GRANT ALL ON Modulo	TO VistaDAM 		WITH GRANT OPTION;
GRANT ALL ON Modulo	TO VistaDAW 		WITH GRANT OPTION;
GRANT ALL ON VistaASIR	TO ProfesoradoASIR 	WITH GRANT OPTION;
GRANT ALL ON VistaDAM	TO ProfesoradoDAM 	WITH GRANT OPTION;
GRANT ALL ON VistaDAW	TO ProfesoradoDAW 	WITH GRANT OPTION;
#*******************************************************************************************
#	CREAMOS LOS USUARIOS DE DIRECCIÓN CON DEFAULT ROLE
#-------------------------------------------------------------------------------------------
#	DROP USER IF EXISTS <direccion1>, <direccion2>, ..., <direccionN>;
#	CREATE USER <direccion1> IDENTIFIED BY 'dir' DEFAULT ROLE 'Rol1';
#	...........................
#	CREATE USER <direccionN> IDENTIFIED BY 'dir' DEFAULT ROLE 'Rol1';
#*******************************************************************************************
DROP USER IF EXISTS	Director;		CREATE USER Director			IDENTIFIED BY 'dir' 		DEFAULT ROLE Direccion;
DROP USER IF EXISTS Vicedirector;		CREATE USER Vicedirector		IDENTIFIED BY 'vic'		DEFAULT ROLE Direccion;
DROP USER IF EXISTS Secretario;			CREATE USER Secretario			IDENTIFIED BY 'sec'		DEFAULT ROLE Direccion;
DROP USER IF EXISTS JefeEstudiosDiurno;		CREATE USER JefeEstudiosDiurno		IDENTIFIED BY 'jed'		DEFAULT ROLE Direccion;
DROP USER IF EXISTS JefeEstudiosNocturno;	CREATE USER JefeEstudiosNocturno  	IDENTIFIED BY 'jen'		DEFAULT ROLE Direccion;

#*******************************************************************************************
#	CREAMOS LOS USUARIOS DEL PROFESORADO CON DEFAULT ROLE
#-------------------------------------------------------------------------------------------
#	DROP USER IF EXISTS <profesor1>, <profesor2>, ..., <profesorN>;
#	CREATE USER <profesor1> IDENTIFIED BY 'pro' DEFAULT ROLE 'Rol2';
#	...........................
#	CREATE USER <profesorN> IDENTIFIED BY 'pro' DEFAULT ROLE 'Rol2';
#*******************************************************************************************
# Profesores Ciclo ASIR
DROP USER IF EXISTS	Prof_01ASIR;	CREATE USER Prof_01ASIR		IDENTIFIED BY 'pro'	DEFAULT ROLE ProfesoradoASIR;
DROP USER IF EXISTS	Prof_02ASIR;	CREATE USER Prof_02ASIR		IDENTIFIED BY 'pro'	DEFAULT ROLE ProfesoradoASIR;
DROP USER IF EXISTS	Prof_03ASIR;	CREATE USER Prof_03ASIR		IDENTIFIED BY 'pro'	DEFAULT ROLE ProfesoradoASIR;
DROP USER IF EXISTS	Prof_04ASIR;	CREATE USER Prof_04ASIR		IDENTIFIED BY 'pro'	DEFAULT ROLE ProfesoradoASIR;
DROP USER IF EXISTS	Prof_05ASIR;	CREATE USER Prof_05ASIR		IDENTIFIED BY 'pro'	DEFAULT ROLE ProfesoradoASIR;
# Profesores Ciclo DAM
DROP USER IF EXISTS	Prof_01DAM;	CREATE USER Prof_01DAM		IDENTIFIED BY 'pro'	DEFAULT ROLE ProfesoradoDAM;
DROP USER IF EXISTS	Prof_02DAM;	CREATE USER Prof_02DAM		IDENTIFIED BY 'pro'  	DEFAULT ROLE ProfesoradoDAM;
DROP USER IF EXISTS	Prof_03DAM;	CREATE USER Prof_03DAM		IDENTIFIED BY 'pro'	DEFAULT ROLE ProfesoradoDAM;
DROP USER IF EXISTS	Prof_04DAM;	CREATE USER Prof_04DAM		IDENTIFIED BY 'pro'	DEFAULT ROLE ProfesoradoDAM;
DROP USER IF EXISTS	Prof_05DAM;	CREATE USER Prof_05DAM		IDENTIFIED BY 'pro'	DEFAULT ROLE ProfesoradoDAW;
# Profesores Ciclo DAW
DROP USER IF EXISTS	Prof_01DAW;	CREATE USER Prof_01DAW		IDENTIFIED BY 'pro'	DEFAULT ROLE ProfesoradoDAW;
DROP USER IF EXISTS	Prof_02DAW;	CREATE USER Prof_02DAW		IDENTIFIED BY 'pro'	DEFAULT ROLE ProfesoradoDAW;
DROP USER IF EXISTS	Prof_03DAW;	CREATE USER Prof_03DAW		IDENTIFIED BY 'pro'	DEFAULT ROLE ProfesoradoDAW;
DROP USER IF EXISTS	Prof_04DAW;	CREATE USER Prof_04DAW		IDENTIFIED BY 'pro'	DEFAULT ROLE ProfesoradoDAW;
DROP USER IF EXISTS	Prof_05DAW;	CREATE USER Prof_05DAW		IDENTIFIED BY 'pro'	DEFAULT ROLE ProfesoradoDAW;

#*******************************************************************************************
#	DAMOS LOS RESPECTIVOS PRIVILEGIOS A LOS GRUPOS DEL ALUMNADO
#-------------------------------------------------------------------------------------------
#	GRANT <permiso> ON <tabla> TO <Rol1>;
#	---------------------
#	GRANT <permiso> ON <tabla> TO <RolN>;
#*******************************************************************************************
GRANT SELECT ON	VistaASIR 	TO 	AlumnASIR 	WITH GRANT OPTION;
GRANT SELECT ON	VistaDAM 	TO	AlumnDAM 	WITH GRANT OPTION;
GRANT SELECT ON	VistaDAW 	TO	AlumnDAW 	WITH GRANT OPTION;
#*******************************************************************************************
#	CREAMOS LOS USUARIOS, ASIGNÁNDOLES LOS ROLES CORRESPONDIENTES
#-------------------------------------------------------------------------------------------
#	DROP USER IF EXISTS <usuario1>, <usuario2>, ..., <usuarioN>;
#	CREATE USER <usuario1> IDENTIFIED BY 'use' DEFAULT ROLE 'Rol3';
#	...........................
#	CREATE USER <usuarioN> IDENTIFIED BY 'use' DEFAULT ROLE 'Rol3';
#*******************************************************************************************
DROP USER IF EXISTS	Al_01ASIR;	CREATE USER Al_01ASIR	IDENTIFIED BY 'abc'		DEFAULT ROLE AlumnadoASIR;
DROP USER IF EXISTS	Al_02ASIR;	CREATE USER Al_02ASIR	IDENTIFIED BY 'abc'		DEFAULT ROLE AlumnadoASIR;
DROP USER IF EXISTS	Al_03ASIR;	CREATE USER Al_03ASIR	IDENTIFIED BY 'abc'		DEFAULT ROLE AlumnadoASIR;
DROP USER IF EXISTS	Al_04ASIR;	CREATE USER Al_04ASIR	IDENTIFIED BY 'abc'		DEFAULT ROLE AlumnadoASIR;
DROP USER IF EXISTS	Al_05ASIR;	CREATE USER Al_05ASIR	IDENTIFIED BY 'abc'		DEFAULT ROLE AlumnadoASIR;
# Alumnos Ciclo DAM
DROP USER IF EXISTS	Al_01DAM;	CREATE USER Al_01DAM	IDENTIFIED BY 'abc'		DEFAULT ROLE AlumnadoDAM;
DROP USER IF EXISTS	Al_02DAM;	CREATE USER Al_02DAM	IDENTIFIED BY 'abc'		DEFAULT ROLE AlumnadoDAM;
DROP USER IF EXISTS	Al_03DAM;	CREATE USER Al_03DAM	IDENTIFIED BY 'abc'		DEFAULT ROLE AlumnadoDAM;
DROP USER IF EXISTS	Al_04DAM;	CREATE USER Al_04DAM	IDENTIFIED BY 'abc'		DEFAULT ROLE AlumnadoDAM;
DROP USER IF EXISTS	Al_05DAM;	CREATE USER Al_05DAM	IDENTIFIED BY 'abc'		DEFAULT ROLE AlumnadoDAM;
# Alumnos Ciclo DAW
DROP USER IF EXISTS	Al_01DAW;	CREATE USER Al_01DAW	IDENTIFIED BY 'abc'		DEFAULT ROLE AlumnadoDAW;
DROP USER IF EXISTS	Al_02DAW;	CREATE USER Al_02DAW	IDENTIFIED BY 'abc'		DEFAULT ROLE AlumnadoDAW;
DROP USER IF EXISTS	Al_03DAW;	CREATE USER Al_03DAW	IDENTIFIED BY 'abc'		DEFAULT ROLE AlumnadoDAW;
DROP USER IF EXISTS	Al_04DAW;	CREATE USER Al_04DAW	IDENTIFIED BY 'abc'		DEFAULT ROLE AlumnadoDAW;
DROP USER IF EXISTS	Al_05DAW;	CREATE USER Al_05DAW	IDENTIFIED BY 'abc'		DEFAULT ROLE AlumnadoDAW;

#*******************************************************************************************
#*******************************************************************************************
