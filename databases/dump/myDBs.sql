-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2019-09-14 15:33:19.276

--create databases
CREATE DATABASE IF NOT EXISTS `dinerUser`;

-- tables
-- Table: Agreem_DinerU
USE dinerUser;
DROP TABLE IF EXISTS `Agreem_DinerU`;
CREATE TABLE `Agreem_DinerU` (
    `PK_idAgreemXDiner` int NOT NULL AUTO_INCREMENT,
    `FK_idDiner` int NOT NULL,
    `FK_idAgreement` int NOT NULL,
    CONSTRAINT `userXConve_pk` PRIMARY KEY (`PK_idAgreemXDiner`)
);

-- Table: Agreement
DROP TABLE IF EXISTS `Agreement`;
CREATE TABLE `Agreement` (
    `PK_idAgreement` int NOT NULL AUTO_INCREMENT,
    `FK_idRestaurant` int NOT NULL,
    `nameAgreement` char(20) NOT NULL,
    `desdiscount` int NOT NULL,
    `cutoffDate` date NOT NULL,
    CONSTRAINT `convenios_pk` PRIMARY KEY (`PK_idAgreement`)
);

-- Table: DinerUser
DROP TABLE IF EXISTS `DinerUser`;
CREATE TABLE `DinerUser` (
    `PK_idDiner` int NOT NULL AUTO_INCREMENT,
    `FK_idUser` int NOT NULL,
    `numDocument` bigint NOT NULL,
    `firstname` char(15) NOT NULL,
    `secondname` char(15) NOT NULL,
    `firstLastname` char(15) NOT NULL,
    `secondLastname` char(15) NOT NULL,
    `address` char(30) NOT NULL,
    `telephone` bigint NOT NULL,
    `payMethod` varchar(30) NOT NULL,
    `infoProfile` varchar(200),
    `igUser` varchar(40),
    CONSTRAINT `UsuarioComensal_pk` PRIMARY KEY (`PK_idDiner`)
);

-- Table: Res_DinerU
DROP TABLE IF EXISTS `Res_DinerU`;
CREATE TABLE `Res_DinerU` (
    `PK_idResxPers` int NOT NULL AUTO_INCREMENT,
    `FK_idReservation` int NOT NULL,
    `FK_idDiner` int NOT NULL,
    `availableChairs` int NOT NULL,
    CONSTRAINT `ResxPers_pk` PRIMARY KEY (`PK_idResxPers`)
);

-- Table: Reservation
DROP TABLE IF EXISTS `Reservation`;
CREATE TABLE `Reservation` (
    `PK_idReservation` int NOT NULL AUTO_INCREMENT,
    `FK_idRestaurant` int NOT NULL COMMENT 'Este atributo es FK de la tabla Restaurante.',
    `FK_reservationCreator` int NOT NULL,
    `FK_idTable` int NOT NULL,
    `personInCharge` varchar(15) NOT NULL,
    `reservationDate` date NOT NULL,
    `reservationHour` varchar(15) NOT NULL,
    `reservationType` varchar(15) NOT NULL,
    `cardNumber` int NULL,
    `reservationTotal` int NOT NULL,
    `amountOfPeople` int NOT NULL,
    `reservationStatus` varchar(15) NOT NULL,
    `comments` text NULL,
    CONSTRAINT `Reservas_pk` PRIMARY KEY (`PK_idReservation`)
);

-- Table: Restaurant
DROP TABLE IF EXISTS `Restaurant`;
CREATE TABLE `Restaurant` (
    `PK_idRestaurant` int NOT NULL AUTO_INCREMENT,
    `name` varchar(30) NOT NULL,
    `description` varchar(100) NOT NULL,
    `puntuation` int NOT NULL,
    `comments` text NOT NULL,
    `address` varchar(15) NOT NULL,
    `telephone` bigint NOT NULL,
    `email` varchar(20) NOT NULL,
    CONSTRAINT `idRestaurante` PRIMARY KEY (`PK_idRestaurant`)
);

-- Table: User
DROP TABLE IF EXISTS `User`;
CREATE TABLE `User` (
    `PK_idUser` int NOT NULL AUTO_INCREMENT,
    `userType`int NOT NULL,
    `username` varchar(20) NOT NULL,
    `password` varchar(150) NOT NULL,
    `email` char(50) NOT NULL,
    CONSTRAINT `User_pk` PRIMARY KEY (`PK_idUser`)
);

-- Table: VIPMembership
DROP TABLE IF EXISTS `VIPMembership`;
CREATE TABLE `VIPMembership` (
    `PK_idMembership` int NOT NULL AUTO_INCREMENT,
    `FK_idDiner` int NOT NULL,
    `cutDate` date NOT NULL,
    CONSTRAINT `MembresiaVIP_pk` PRIMARY KEY (`PK_idMembership`)
);

-- foreign keys
-- Reference: Agreem_DinerU_Agreement (table: Agreem_DinerU)
ALTER TABLE `Agreem_DinerU` ADD CONSTRAINT `Agreem_DinerU_Agreement` FOREIGN KEY `Agreem_DinerU_Agreement` (`FK_idAgreement`)
    REFERENCES `Agreement` (`PK_idAgreement`);

-- Reference: Agreement_Restaurant (table: Agreement)
ALTER TABLE `Agreement` ADD CONSTRAINT `Agreement_Restaurant` FOREIGN KEY `Agreement_Restaurant` (`FK_idRestaurant`)
    REFERENCES `Restaurant` (`PK_idRestaurant`);

-- Reference: DinerUser_User (table: DinerUser)
ALTER TABLE `DinerUser` ADD CONSTRAINT `DinerUser_User` FOREIGN KEY `DinerUser_User` (`FK_idUser`)
    REFERENCES `User` (`PK_idUser`);

-- Reference: Membresia_Usuario (table: VIPMembership)
ALTER TABLE `VIPMembership` ADD CONSTRAINT `Membresia_Usuario` FOREIGN KEY `Membresia_Usuario` (`FK_idDiner`)
    REFERENCES `DinerUser` (`PK_idDiner`);

-- Reference: Res_DinerU_DinerUser (table: Res_DinerU)
ALTER TABLE `Res_DinerU` ADD CONSTRAINT `Res_DinerU_DinerUser` FOREIGN KEY `Res_DinerU_DinerUser` (`FK_idDiner`)
    REFERENCES `DinerUser` (`PK_idDiner`);

-- Reference: ResxPers_Reservas (table: Res_DinerU)
ALTER TABLE `Res_DinerU` ADD CONSTRAINT `ResxPers_Reservas` FOREIGN KEY `ResxPers_Reservas` (`FK_idReservation`)
    REFERENCES `Reservation` (`PK_idReservation`);

-- Reference: userXConve_Usuario (table: Agreem_DinerU)
ALTER TABLE `Agreem_DinerU` ADD CONSTRAINT `userXConve_Usuario` FOREIGN KEY `userXConve_Usuario` (`FK_idDiner`)
    REFERENCES `DinerUser` (`PK_idDiner`);

-- Inserciones:
insert into User (`userType`, `username`, `password`, `email`) VALUES(1,'usuarioPrueba','1234','micorreoprueba@outlook.com');
insert into User (`userType`, `username`, `password`, `email`) VALUES(1,'Elxavier','yisus','xavi@outlook.com');
insert into User (`userType`, `username`, `password`, `email`) VALUES(1,'amb18','amb','alejandroMeza@outlook.com');
insert into User (`userType`, `username`, `password`, `email`) VALUES(1,'willi','front','william@yahoo.es');
insert into User (`userType`, `username`, `password`, `email`) VALUES(1,'cucho','roman','christiandany@gmail.com');
insert into User (`userType`, `username`, `password`, `email`) VALUES(1,'SebasT','toro50','storo@hotmail.com');
insert into User (`userType`, `username`, `password`, `email`) VALUES(1,'test','t50','test@hotmail.com');

-----------------------------------------------------------------------------------------------------------------------------------------------
insert into DinerUser (`FK_idUser`,`numDocument`, `firstname`, `secondname`, `firstLastname`, `secondLastname`, `address`, `telephone`, `payMethod`) VALUES(1,1453487801,'pedro','pablo','leon','jaramillo','cra 44 #13-10',8295562,'tarjeta de credito');
-----------------------------------------------------------------------------------------------------------------------------------------------
insert into VIPMembership (`FK_idDiner`,`cutDate`) VALUES(1,'15/12/19');
-----------------------------------------------------------------------------------------------------------------------------------------------
insert into Restaurant(`name`,`description`,`puntuation`,`comments`,`address`,`telephone`,`email`) VALUES('EL cielo', 'Este es un restaurante de lujo ubicado en bogotá',9,'None','cll 105 #45-72',3144789520,'ResElcielo@gmail.com');
-----------------------------------------------------------------------------------------------------------------------------------------------
insert into Agreement(`FK_idRestaurant`, `nameAgreement`, `desdiscount`, `cutoffDate`) VALUES(1,'convenio El cielo', 10, '24/11/19');
-----------------------------------------------------------------------------------------------------------------------------------------------
insert into Agreem_DinerU(`FK_idDiner`,`FK_idAgreement`)VALUES(1,1);
-----------------------------------------------------------------------------------------------------------------------------------------------
insert into Reservation(FK_idRestaurant,FK_reservationCreator,FK_idTable,personInCharge,reservationDate,reservationHour,reservationType,cardNumber,reservationTotal,amountOfPeople,reservationStatus,comments)
    VALUES(1,4,5,'Camilo Rojas','01/10/19','9:00','normal',102394,300000,2,'creada','none');
-----------------------------------------------------------------------------------------------------------------------------------------------
insert into Res_DinerU(`FK_idReservation`,`FK_idDiner`,`availableChairs`)VALUES(1,1,2);   
-- End of file.

/* CREACION DE FUNCIONES */
drop function validarCedula;

/*Funcion que retorna booleano, si la cedula se encuentra registrada o no en la tabla de DinerUser*/
delimiter $$ 
CREATE function validarCedula(cedula int)
RETURNS BOOLEAN
BEGIN
  declare consulta int;
  select PK_idDiner into consulta from DinerUser where numDocument = cedula;
  if consulta is null then
    RETURN False;
  else
    RETURN True;
  end if;
END$$
delimiter ;
--------------------------------------------------------------------------------------
/*Funcion que retorna booleano, si el username se encuentra registrado o no en la tabla User*/
delimiter $$
CREATE function validarNickname(user varchar(20))
RETURNS BOOLEAN
BEGIN
  declare consulta int;
  select PK_idUser into consulta from User where username = user;
  if consulta is null then
    RETURN False;
  else
    RETURN True;
  end if;
END$$
delimiter ;

--------------------------------------------------------------------------------------
delimiter $$
CREATE function getUserIdByNick(user varchar(20))
RETURNS INT
BEGIN
  declare consulta int;
  select PK_idUser into consulta from User where username = user;
  RETURN consulta;
END$$
delimiter ;

--------------------------------------------------------------------------------------
/*Funcion que retorna booleano, si el id de usuario se encuentra registrado o no en la tabla User*/

delimiter $$
CREATE function validarUsuario(iduser int)
RETURNS BOOLEAN
BEGIN
  declare consulta varchar(20);
  select username into consulta from User where PK_idUser = iduser;
  if consulta is null then
    RETURN False;
  else
    RETURN True;
  end if;
END$$
delimiter ;

--------------------------------------------------------------------------------------
/*Funcion que retorna booleano, si el id de comensal se encuentra registrado o no en la tabla DinerUser*/

delimiter $$
CREATE function validarComensal(idDiner int)
RETURNS BOOLEAN
BEGIN
declare consulta bigint;
  select numDocument into consulta from DinerUser where PK_idDiner = idDiner;
  if consulta is null then
    RETURN False;
  else
    RETURN True;
  end if;
END$$
delimiter ;

--------------------------------------------------------------------------------------
/*Funcion que retorna booleano, si la fecha es valida(es mayor a la fecha actual) o no en la tabla de membresias*/

delimiter $$
CREATE function validarFechaCorte(fecha date)
RETURNS BOOLEAN
BEGIN
declare consulta date;
  set consulta = CURDATE();
  
  if consulta > fecha then
    RETURN False;
  else
    RETURN True;
  end if;
END$$
delimiter ;

--------------------------------------------------------------------------------------
/*Funcion que retorna booleano, si el id de convenio se encuentra registrado  o no en la tabla de convenios*/

delimiter $$
CREATE function validarConvenio(idConvenio int)
RETURNS BOOLEAN
BEGIN
declare consulta char(20);
  select nameAgreement into consulta from Agreement where PK_idAgreement = idConvenio;
  if consulta is null then
    RETURN False;
  else
    RETURN True;
  end if;
END$$
delimiter ;

--------------------------------------------------------------------------------------
/*Funcion que retorna booleano, si el DinerUser tiene membresia o no*/

delimiter $$
CREATE function userVIP(idDinerUser int)
RETURNS BOOLEAN
BEGIN
declare consulta int;
  select PK_idMembership into consulta from VIPMembership where FK_idDiner = idDinerUser;
  if consulta is null then
    RETURN False;
  else
    RETURN True;
  end if;
END$$
delimiter ;
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*Funcion que retorna los nombres y apellidos de un usuario segun el idDiner pasado por parametro*/
delimiter $$
CREATE function getNamesAndLastnames(idUser int)
RETURNS VARCHAR(50)
BEGIN
  declare consulta varchar(50);
  
  select concat_ws(' ', firstname, secondname, firstLastname, secondLastname) into consulta from DinerUser where PK_idDiner = idUser;
  RETURN consulta;
  
END$$
delimiter ;

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*Funcion que retorna el instagram de un usuario segun el idDiner pasado por parametro*/
delimiter $$
CREATE function getIgUser(idUser int)
RETURNS VARCHAR(40)
BEGIN
  declare consulta varchar(40);
  select igUser into consulta from DinerUser where PK_idDiner = idUser;
  RETURN consulta;
END$$
delimiter ;

-------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*Funcion que retorna booleano, si el correo se encuentra registrado o no en la tabla User*/
delimiter $$
CREATE function verifyEmail(correo char(30))
RETURNS BOOLEAN
BEGIN
  declare consulta char(30);
  select PK_idUser into consulta from User where email = correo ;
  if consulta is null then
    RETURN False;
  else
    RETURN True;
  end if;
END$$
delimiter ;

--*****************************************************************************************************************************************
--PROCEDIMIENTOS:
/*Procedimiento que crea un usuario en la tabla User*/

delimiter $$
Create procedure addUser(tipo INT,IN usuario varchar(20) ,IN contrasena varchar(20),IN correo varchar(30))
BEGIN
    if validarNickname(usuario) = 0 then
      if verifyEmail(correo) = 0 then
        insert into User (userType, username, password, email) VALUES(tipo,usuario,contrasena,correo);
      else
        select 'Ese correo ya se encuentra registrado';
      end if;
    else
        select 'Ese nombre de usuario ya existe';
    end if;
END$$

delimiter ;

----------------------------------------------------------------------------------------------------- 512348748
/*Procedimiento que crea un usuario-comensal en la tabla DinerUser*/

delimiter $$
Create procedure add_dinerUser(IN userNick varchar(20), IN cedula INT,IN nombre char(15),IN segundoNombre char(15) ,IN apellido char(15),IN segundoApellido char(15),IN direccion char(30), IN telefono bigint, IN pago varchar(30))
BEGIN
  declare idUsuario int;
  set idUsuario = getUserIdByNick(userNick);
  if validarCedula(cedula) = 0 then
    insert into DinerUser (FK_idUser, numDocument, firstname, secondname, firstLastname, secondLastname, address, telephone, payMethod) VALUES(idUsuario,cedula , nombre,segundoNombre,apellido,segundoApellido, direccion, telefono, pago);
  else
    select 'Esa identificacion ya esta registrada';
  end if;
END$$
delimiter ;

------------------------------------------------------------------------------------------------------------------------------------------------------
/*Procedimiento que crea una membresia en la tabla VIPMembership*/

delimiter $$
create procedure crearMembresia(IN idComensal INT, IN fechaCorte DATE)
BEGIN
  if validarComensal(idComensal) = 1 then
    if validarFechaCorte(fechaCorte) = 1 then
      insert into VIPMembership(FK_idDiner, cutDate) VALUES(idComensal, fechaCorte);
    else
      select 'La fecha de corte ingresada no es valida ';
    end if;
  else
    select 'El id del usuario-comensal no existe';
  end if;
END$$
delimiter ;

------------------------------------------------------------------------------------------------------------------------------------------------------
/*Procedimiento que crea un registro en la tabla transaccional Agreem_DinerU*/

delimiter $$
create procedure crearAsociacionConvenio(IN idComensal INT, IN idConvenio INT)
BEGIN
  if validarComensal(idComensal) = 1 then
    if validarConvenio(idConvenio) = 1 then
      insert into Agreem_DinerU(FK_idDiner, FK_idAgreement) VALUES(idComensal, idConvenio);
    else
      select 'El id del convenio no existe';
    end if;
  else
    select 'El id del usuario-comensal no existe';
  end if;
END$$
delimiter ;

--------------------------------------------------------------------------------------
/*Procedimiento que modifica la fecha de corte de una membresia conociendo el idDiner*/

delimiter $$
create procedure modificarMembresia(IN usuario INT, IN fechaCorte DATE)
BEGIN
  if validarFechaCorte(fechaCorte) = 1 then
      update VIPMembership set cutDate = fechaCorte where FK_idDiner = usuario;
  else
    select 'La fecha de corte ingresada no es valida ';
  end if;
END$$
delimiter ;


/*Procedimiento que modifica la fecha de corte de una membresia conociendo la cedula del usuario*/

delimiter $$
create procedure modificarMembresiaCedula(IN cedula BIGINT, IN fechaCorte DATE)
BEGIN
  if validarFechaCorte(fechaCorte) = 1 then
    update VIPMembership inner join DinerUser on (FK_idDiner = PK_idDiner) set cutDate = fechaCorte  where numDocument = cedula;
  else
    select 'La fecha de corte ingresada no es valida ';
  end if;
END$$
delimiter ;

---------------------------------------------------------------------------------------------------------------------------------
/*Procedimiento que modifica TODOS los atributos de una cuenta de usuario comensal*/
delimiter $$
Create procedure edit_dinerUser(IN cedula INT,IN nuevoNombre char(15), IN segundoNombre char(15) ,IN apellido char(15),IN segundoApellido char(15),IN direccion char(30), IN telefono bigint,IN pago varchar(30))
BEGIN
    if validarCedula(cedula) = 1 then
        update DinerUser set firstname = nuevoNombre, secondname = segundoNombre, firstLastname = apellido, secondLastname = segundoApellido, address = direccion, telephone = telefono, payMethod = pago where numDocument = cedula;
    else
      select 'Esa identificacion no esta registrada';
     end if;
END$$
delimiter ;

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--DELETES:
/*Procedimiento que elimina la cuenta de un usuario comensal*/
delimiter $$
Create procedure delete_dinerUser(IN cedula INT)
BEGIN
    if validarCedula(cedula) = 1 then
        delete from DinerUser where numDocument = cedula;
    else
      select 'Esa identificacion no esta registrada';
     end if;
END$$
delimiter ;


----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*Procedimiento que elimina la membresia actual de un usuario conociendo su id de usuario-comensal*/

delimiter $$
Create procedure EliminarMembresia(IN idDiner INT)
BEGIN
    if validarComensal(idDiner) = 1 then
        delete from VIPMembership where FK_idDiner = idDiner;
    else
      select 'Ese id no esta registrado';
     end if;
END$$
delimiter ;

/*Procedimiento que elimina la membresia actual de un usuario conociendo su cedula*/

delimiter $$
Create procedure EliminarMembresiaCedula(IN cedula BIGINT)
BEGIN
    if validarCedula(cedula) = 1 then
        delete VIPMembership from VIPMembership inner join DinerUser on VIPMembership.FK_idDiner = DinerUser.PK_idDiner where DinerUser.numDocument = cedula;
    else
      select 'Ese id no esta registrado';
    end if;
END$$
delimiter ;

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*Procedimiento que consulta los nombres y apellidos de un usuario junto con su intagram sabiendo su idDiner*/
delimiter $$
CREATE procedure getNameIgUserByidUser(IN idUser int)
BEGIN
  declare nombres varchar(50);
  declare inst varchar(40);
  
  set nombres = getNamesAndLastnames(idUser);
  set inst = getIgUser(idUser);
  select nombres, inst;
END$$
delimiter ;

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*Procedimiento que retorna un booleano, True si la contraseña y el correo ingresados estan registrados, False de lo contrario*/
delimiter $$
create procedure login(IN correo VARCHAR(50), IN contrasenia VARCHAR(150))
BEGIN
  declare consulta int;
  set consulta = (select PK_idUser from User where email = correo AND password = contrasenia);
  if consulta is null then
    SELECT False;
  else
    SELECT True;
  end if;
END$$
delimiter ;
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
