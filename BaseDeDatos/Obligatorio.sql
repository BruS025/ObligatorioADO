USE master
GO

-- Elimino base de datos Obligatorio si ya existe...
IF EXISTS (SELECT * FROM sys.databases WHERE name = 'OBLIGATORIO')
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
	nroPueCli INT NOT NULL
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
	codB INT PRIMARY KEY FOREIGN KEY REFERENCES Productos(codB) ON DELETE CASCADE,
	tipoTapa BIT NOT NULL,
)
GO

-- Creo la Tabla Congelados
CREATE TABLE Congelados
(
	codB INT PRIMARY KEY FOREIGN KEY REFERENCES Productos(codB) ON DELETE CASCADE,
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
	idVen int foreign key references Ventas(idVen) ON DELETE CASCADE,
	codB INT FOREIGN KEY REFERENCES Productos(codB),
	cantidad int Not Null,
	primary key(idVen, codB)
)
GO

-- Creacion de "Procedimientos almacenados"


--Clientes



CREATE PROCEDURE SP_AgregarCliente

@ciClieNue INT,
@nomCliNue VARCHAR(20),
@apeCliNue VARCHAR(20),
@telCliNue BIGINT,
@dirCliNue VARCHAR(40)

AS
BEGIN
	IF EXISTS (SELECT c.ciCli FROM Clientes c WHERE c.ciCli=@ciClieNue)
		BEGIN
			RETURN 1
		END
	ELSE
		BEGIN transaction
			INSERT INTO Clientes VALUES (@ciClieNue,@nomCliNue,@apeCliNue,@telCliNue,@dirCliNue)

			IF @@ERROR <> 0
				BEGIN
					ROLLBACK TRANSACTION
					RETURN @@ERROR
				END
			ELSE 
				BEGIN
					COMMIT TRANSACTION
					RETURN 0
				END
END
GO

CREATE PROCEDURE SP_EliminarCliente

@ciCliente INT

AS
BEGIN
	IF EXISTS (select v.ciCli FROM Ventas v WHERE v.ciCli=@ciCliente)
		BEGIN
			RETURN 1
		END
	ELSE
		BEGIN TRANSACTION
			DELETE Clientes
			WHERE ciCli=@ciCliente

			IF @@ERROR <> 0
				BEGIN
					ROLLBACK TRANSACTION
					RETURN @@ERROR
				END
			ELSE 
				BEGIN
					COMMIT TRANSACTION
					RETURN 0
				END

END
GO

CREATE PROCEDURE SP_ModificarCliente
@ciCliB INT,
@nomCliNue VARCHAR(20),
@apeCliNue VARCHAR(20),
@telCliNue BIGINT,
@dirCliNue VARCHAR (40)
AS
BEGIN
	IF EXISTS (SELECT v.ciCli FROM Ventas v WHERE v.ciCli=@ciCliB)
		BEGIN
			RETURN 1
		END
	ELSE
		BEGIN TRANSACTION 
		UPDATE Clientes
		SET nomCli=@nomCliNue,
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
GO

CREATE PROCEDURE SP_BuscarCliente
@ciCliB INT
AS
BEGIN 
	IF NOT EXISTS (SELECT c.ciCli FROM Clientes c WHERE c.ciCli=@ciCliB)
		BEGIN
			RETURN 1
		END
	ELSE
		SELECT * FROM Clientes WHERE ciCli=@ciCliB
END
GO

CREATE PROCEDURE SP_ListarCliente
AS
BEGIN
	SELECT * FROM Clientes
END
GO


--Productos


CREATE PROCEDURE SP_AgregarProdConge

@cod BIGINT,
@nombre VARCHAR (50),
@fecha_vencimiento DATETIME,
@precio MONEY,
@peso DECIMAL

AS
BEGIN

IF EXISTS (SELECT codB FROM Productos WHERE codB = @cod)
	BEGIN
		RETURN 2
	END

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
GO

CREATE PROCEDURE SP_AgregarProdEnl

@cod BIGINT,
@nombre VARCHAR (50),
@fecha_vencimiento DATETIME,
@precio MONEY,
@TipoTapa BIT

AS
BEGIN

	IF EXISTS (SELECT codB FROM Productos WHERE codB = @cod)
		BEGIN
			RETURN 2
		END


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
GO

CREATE PROCEDURE SP_ModificarEnla
@cod BIGINT,
@NomProNue VARCHAR(20),
@FechaVtoNue DATETIME,
@PrecioProdNue MONEY,
@TipoTapaNue BIT
AS

BEGIN

	IF NOT EXISTS (SELECT p.codB FROM Productos p WHERE p.codB=@Cod)
		BEGIN 
			RETURN 1
		END
	ELSE
		BEGIN TRANSACTION
			UPDATE Productos 
			SET nomProd=@NomProNue,
				fechaVto=@FechaVtoNue,
				precioProd=@PrecioProdNue
			WHERE  
				Productos.codB=@cod

		IF @@ERROR <> 0
			BEGIN
				ROLLBACK TRANSACTION
				RETURN @@ERROR
			END
		UPDATE Enlatados
			SET tipoTapa=@TipoTapaNue
			WHERE 
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
			END					
END
GO

CREATE PROCEDURE SP_ModificarCong
@cod BIGINT,
@NomProNue VARCHAR(20),
@FechaVtoNue DATETIME,
@PrecioProdNue MONEY,
@PesoProdNue BIT
AS

BEGIN

	IF NOT EXISTS (SELECT p.codB FROM Productos p WHERE p.codB=@Cod)
		BEGIN
			RETURN 1
		END
	ELSE
		BEGIN TRANSACTION
			UPDATE Productos 
			SET nomProd=@NomProNue,
				fechaVto=@FechaVtoNue,
				precioProd=@PrecioProdNue
			WHERE  
				Productos.codB=@cod

		IF @@ERROR <> 0
			BEGIN
				ROLLBACK TRANSACTION
				RETURN @@ERROR
			END
		UPDATE Congelados
			SET pesoProd=@PesoProdNue
			WHERE 
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
			END				
END
GO

CREATE PROCEDURE SP_BuscarEnl
@codBus BIGINT
AS
BEGIN
	IF NOT EXISTS (SELECT p.codB FROM Productos p WHERE p.codB=@codBus)
		BEGIN
			RETURN 1
		END
	ELSE
		BEGIN
			RETURN SELECT * FROM Productos p WHERE p.codB=codB UNION SELECT * FROM Enlatados e WHERE e.codB=@codBus
		END
END
GO

CREATE PROCEDURE SP_BuscarCon
@codBus BIGINT
AS
BEGIN
	IF NOT EXISTS (SELECT p.codB FROM Productos p WHERE p.codB=@codBus)
		BEGIN
			RETURN 1
		END
	ELSE
		BEGIN
			RETURN SELECT * FROM Productos p WHERE p.codB=codB UNION SELECT * FROM Congelados c WHERE c.codB=@codBus
		end
end
GO

CREATE PROCEDURE SP_Listar
AS
BEGIN
	SELECT * FROM Productos p JOIN Congelados c ON p.codB=c.codB 
	SELECT * FROM Productos p JOIN Enlatados e ON p.codB=e.codB
END

DECLARE @RETORNO INT
EXEC @RETORNO = SP_Listar
PRINT @retorno
GO

CREATE PROCEDURE SP_EliminarPro
@codB BIGINT
AS
BEGIN

	IF EXISTS (SELECT l.codB FROM Linea l WHERE l.codB=@codB)
		BEGIN TRANSACTION
			DELETE Linea
			WHERE codB=@codB

			IF @@ERROR <> 0
				BEGIN
					ROLLBACK TRANSACTION
					RETURN @@ERROR
				END
			DELETE Productos
			WHERE codB=@codB

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
	IF EXISTS (SELECT p.codB FROM Productos p WHERE p.codB=@codB)
		BEGIN TRANSACTION
			DELETE Productos
			WHERE codB=@codB

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
GO


--Ventas

CREATE PROCEDURE SP_AgregarVenta
@fechaVen DATETIME,
@fechaPago DATETIME,
@totalVen MONEY,
@ciCliV INT,
--Linea
@codB INT,
@cantidad INT
AS
BEGIN
	IF EXISTS (SELECT c.ciCli FROM Clientes c where c.ciCli=@ciCliV)
	BEGIN TRANSACTION
		INSERT INTO Ventas (fechaVen,fechaPago,totalVen,ciCli)
			VALUES (@fechaVen,@fechaPago,@totalVen,@ciCliV)

			IF @@ERROR <> 0
				BEGIN
					ROLLBACK TRANSACTION
					RETURN @@ERROR
				END
		INSERT INTO Linea (codB,cantidad)
			VALUES (@codB,@cantidad)

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
GO

/*Agregar
Eliminar
listar mensuales
listar anuales





	idVen 
	fechaVen 
	fechaPago 
	totalVen 
	ciCli

(
	idVen int foreign key references Ventas(idVen) ON DELETE CASCADE,
	codB 
	cantidad 
	primary 
)*/