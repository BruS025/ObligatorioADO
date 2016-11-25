USE master
GO

-- Elimino base de datos Obligatorio si ya existe...
if exists (select * from sys.databases where name = 'OBLIGATORIO')
BEGIN
	DROP DATABASE OBLIGATORIO
END 
GO

-- Creo la Base de Datos
CREATE DATABASE OBLIGATORIO
GO

USE OBLIGATORIO
GO

-- Creo la Tabla Clientes...
CREATE TABLE Clientes
(
	ciCli INT NOT NULL PRIMARY KEY,
	nomCli VARCHAR(20) NOT NULL,
	apeCli VARCHAR(20) NOT NULL,
	telCli BIGINT NOT NULL,
	dirCli VARCHAR(40) NOT NULL,
)
GO



-- Creo la tabla Productos
CREATE TABLE Productos
(
	codB INT NOT NULL PRIMARY KEY,
	nomProd VARCHAR(20) NOT NULL,
	fechaVto DATETIME NOT NULL,
	precioProd MONEY NOT NULL,
)
GO

-- Creo la Tabla Enlatados
CREATE TABLE Enlatados
(
	codB INT PRIMARY KEY FOREIGN KEY REFERENCES Productos(codB),
	tipoTapa BIT NOT NULL,
)
GO

-- Creo la Tabla Congelados
CREATE TABLE Congelados
(
	codB INT PRIMARY KEY FOREIGN KEY REFERENCES Productos(codB),
	pesoProd INT NOT NULL,
)
GO


-- Creo la Tabla Ventas...
CREATE TABLE Ventas
(
	idVen INT NOT NULL PRIMARY KEY IDENTITY (1,1),
	fechaVen DATETIME NOT NULL,
	fechaPago DATETIME NOT NULL,
	totalVen MONEY NOT NULL,
	ciCli INT FOREIGN KEY REFERENCES Clientes(ciCli)
)
GO


-- Creo la Tabla Lineas de las Ventas
CREATE TABLE Linea
(
	idVen int foreign key references Ventas(idVen),
	codB INT FOREIGN KEY REFERENCES Productos(codB),
	cantidad int Not Null,
	primary key(idVen, codB)
)
GO

-- Creacion de "Procedimientos almacenados"

--------Clientes

create proc SP_AgregarCli
@ciClieNue int,
@nomCliNue VARCHAR(20),
@apeCliNue VARCHAR(20),
@telCliNue BIGINT,
@dirCliNue VARCHAR(40)
as
begin
	if exists (select c.ciCli from Clientes c where c.ciCli=@ciClieNue)
		begin
			return 1
		end
	else
		begin transaction
			insert into Clientes values (@ciClieNue,@nomCliNue,@apeCliNue,@telCliNue,@dirCliNue)

			IF @@ERROR <> 0
				BEGIN
					ROLLBACK TRANSACTION
					RETURN @@ERROR
				END
			ELSE 
				BEGIN
					COMMIT TRANSACTION
					return 0
				END
end
go

create proc SP_EliminaCliente
@ciCliente int
as
begin
	if exists (select v.ciCli from Ventas v where v.ciCli=@ciCliente)
		begin
			return 1
		end
	else
		begin transaction
			delete Clientes
			where ciCli=@ciCliente

			IF @@ERROR <> 0
				BEGIN
					ROLLBACK TRANSACTION
					RETURN @@ERROR
				END
			ELSE 
				BEGIN
					COMMIT TRANSACTION
					return 0
				END

end
go

create proc SP_ModificarCliente
@ciCliB INT,
@nomCliNue VARCHAR(20),
@apeCliNue VARCHAR(20),
@telCliNue BIGINT,
@dirCliNue VARCHAR (40)
AS
BEGIN
	if exists (select v.ciCli from Ventas v where v.ciCli=@ciCliB)
		begin
			return 1
		end
	else 
		begin transaction 
		update Clientes
		set nomCli=@nomCliNue,
			apeCli=@apeCliNue,
			telCli=@telCliNue,
			dirCli=@dirCliNue
IF @@ERROR <> 0
	BEGIN
		ROLLBACK TRANSACTION
		RETURN @@ERROR
	END
ELSE
	BEGIN
	COMMIT TRANSACTION
	RETURN 1
END
END



	/*ciCli INT NOT NULL PRIMARY KEY,
	nomCli VARCHAR(20) NOT NULL,
	apeCli VARCHAR(20) NOT NULL,
	telCli BIGINT NOT NULL,
	dirCli VARCHAR(40) NOT NULL,*/

alter proc SP_AgregarProdConge

@cod bigint,
@nombre varchar (50),
@fecha_vencimiento datetime,
@precio money,
@peso decimal

AS
BEGIN

if exists (select codB from Productos where codB = @cod)
	begin
		return 2
	end

BEGIN TRANSACTION
INSERT INTO Productos(codB,nomProd,fechaVto,precioProd)
VALUES (@cod,@nombre,@fecha_vencimiento,@precio)

IF @@ERROR <> 0
	BEGIN
		ROLLBACK TRANSACTION
		RETURN @@ERROR
	END

INSERT INTO Congelados(codB,pesoProd)
VALUES (@cod,@peso)

IF @@ERROR <> 0
	BEGIN
		ROLLBACK TRANSACTION
		RETURN @@ERROR
	END
ELSE
	BEGIN
	COMMIT TRANSACTION
	RETURN 1
END
END


DECLARE @RETORNO INT
EXEC @RETORNO = SP_AgregarProdConge 123456,'prueba','2016-10-25',15,50
PRINT @retorno
go

create proc SP_Buscar
@ciCliB int
as
begin 
	if not exists (select c.ciCli from Clientes c where c.ciCli=@ciCliB)
		begin
			return 1
		end
	else
		select * from Clientes where ciCli=@ciCliB
end
go

create proc SP_ListClie
as
begin
	select * from Clientes
end

--Productos

alter proc SP_AgregarProdEnl

@cod bigint,
@nombre varchar (50),
@fecha_vencimiento datetime,
@precio money,
@TipoTapa bit

AS
BEGIN

if exists (select codB from Productos where codB = @cod)
	begin
		return 2
	end


BEGIN TRANSACTION
INSERT INTO Productos(codB,nomProd,fechaVto,precioProd)
VALUES (@cod,@nombre,@fecha_vencimiento,@precio)

IF @@ERROR <> 0
	BEGIN
		ROLLBACK TRANSACTION
		RETURN @@ERROR
	END

INSERT INTO Enlatados(codB,tipoTapa)
VALUES (@cod,@TipoTapa)

IF @@ERROR <> 0
	BEGIN
		ROLLBACK TRANSACTION
		RETURN @@ERROR
	END
ELSE
	BEGIN
	COMMIT TRANSACTION
	RETURN 1
END
END

DECLARE @RETORNO INT
EXEC @RETORNO = SP_AgregarProdEnl 1234567,'prueba','2016-10-27',15,1
PRINT @retorno
go

/*
create proc SP_Eliminar
@Cod bigint
as
begin
	if not exists (select p.codB from Productos p where p.codB=@Cod)
		begin
			return 1
		end
	else if exists(select li.codB from Linea li where li.codB=@Cod)
		begin
			delete Ventas
			where idVen=

			delete Linea
			where codB=@Cod
end
go
*/
go

create proc SP_ModificarEnla
@cod bigint,
@NomProNue VARCHAR(20),
@FechaVtoNue DATETIME,
@PrecioProdNue MONEY,
@TipoTapaNue BIT
as

begin

	if not exists (select p.codB from Productos p where p.codB=@Cod)
		begin 
			return 1
		end
	else
		BEGIN TRANSACTION
			UPDATE Productos 
			set nomProd=@NomProNue,
				fechaVto=@FechaVtoNue,
				precioProd=@PrecioProdNue
			where  
				Productos.codB=@cod

		IF @@ERROR <> 0
			BEGIN
				ROLLBACK TRANSACTION
				RETURN @@ERROR
			END
		UPDATE Enlatados
			set tipoTapa=@TipoTapaNue
			where 
				Enlatados.codB=@cod

		IF @@ERROR <> 0
			BEGIN
				ROLLBACK TRANSACTION
				RETURN @@ERROR
			END
		
		ELSE
			BEGIN
				COMMIT TRANSACTION
				RETURN 1	
			end					
end
go

create proc SP_ModificarCong
@cod bigint,
@NomProNue VARCHAR(20),
@FechaVtoNue DATETIME,
@PrecioProdNue MONEY,
@PesoProdNue BIT
as

begin

	if not exists (select p.codB from Productos p where p.codB=@Cod)
		begin 
			return 1
		end
	else
		BEGIN TRANSACTION
			UPDATE Productos 
			set nomProd=@NomProNue,
				fechaVto=@FechaVtoNue,
				precioProd=@PrecioProdNue
			where  
				Productos.codB=@cod

		IF @@ERROR <> 0
			BEGIN
				ROLLBACK TRANSACTION
				RETURN @@ERROR
			END
		UPDATE Congelados
			set pesoProd=@PesoProdNue
			where 
				Congelados.codB=@cod

		IF @@ERROR <> 0
			BEGIN
				ROLLBACK TRANSACTION
				RETURN @@ERROR
			END
		
		ELSE
			BEGIN
				COMMIT TRANSACTION
				RETURN 1	
			end					
end
go


create proc SP_BuscarEnl
@codBus bigint
as
begin
	if not exists (select p.codB from Productos p where p.codB=@codBus)
		begin
			return 1
		end
	else
		begin
			return select * from Productos p where p.codB=codB union select * from Enlatados e where e.codB=@codBus
		end
end
go

create proc SP_BuscarCon
@codBus bigint
as
begin
	if not exists (select p.codB from Productos p where p.codB=@codBus)
		begin
			return 1
		end
	else
		begin
			return select * from Productos p where p.codB=codB union select * from Congelados c where c.codB=@codBus
		end
end
go

alter proc SP_Listar
as
begin
	select * from Productos p join Congelados c on p.codB=c.codB 
	select * from Productos p join Enlatados e on p.codB=e.codB
end

DECLARE @RETORNO INT
EXEC @RETORNO = SP_Listar
PRINT @retorno
go



