USE TeatruOnline
GO

/*
Stocheaza numarul versiunii in care se afla baza de date
Versiunea initiala va fi 0
*/
CREATE TABLE Versiune(
	IDVersiune INT PRIMARY KEY IDENTITY,
	NrVersiune INT DEFAULT 0
)
INSERT INTO Versiune (NrVersiune) VALUES ('');

GO
/*
Moodifica tipul coloanei Prenume din tabelul Actori
din varchar(50) in varchar(100)
*/
CREATE PROCEDURE Versiune1
AS
BEGIN
	ALTER TABLE Actori
	ALTER COLUMN Prenume VARCHAR(100) NOT NULL
	PRINT 'S-a modificat tipul coloanei Prenume din tabelul Actori din varchar(50) in varchar(100)'
END

GO

/*
Operatia inversa versiunii 1
Moodifica tipul coloanei Prenume din tabelul Actori
din varchar(100) in varchar(50)
*/
CREATE PROCEDURE InversVersiune1
AS
BEGIN
	ALTER TABLE Actori
	ALTER COLUMN Prenume VARCHAR(50) NOT NULL
	PRINT 'S-a modificat tipul coloanei Prenume din tabelul Actori din varchar(100) in varchar(50)'
END

GO

/*
Adauga o costrângere de “valoare implicita” pentru campul Experienta din tabelul Actori
valoare implicita = 5
*/
CREATE PROCEDURE Versiune2
AS
BEGIN
	ALTER TABLE Actori
	ADD CONSTRAINT df_Actori_Experienta DEFAULT 5 FOR Experienta
	PRINT 'S-a adaugat constrangerea default in tabelul Actori pentru campul Experienta'

END
GO

/*
Operatia inversa versiunii 2
Sterge costrângerea de “valoare implicită” pentru campul Experienta din tabelul Actori
*/
CREATE PROCEDURE InversVersiune2
AS
BEGIN
	ALTER TABLE Actori
	DROP CONSTRAINT df_Actori_Experienta
	PRINT 'S-a sters constrangerea default in tabelul Actori pentru campul Experienta'
END
GO

/*
Creare tabela ActoriRezerve
*/
CREATE PROCEDURE Versiune3
AS
BEGIN
	CREATE TABLE ActoriRezerve(
		IDActoriRezerve INT PRIMARY KEY IDENTITY,
		Nume VARCHAR(50),
		Prenume VARCHAR(50),
		DataNasterii DATE,
		NrTelefonMobil VARCHAR(12)
	)

	INSERT INTO ActoriRezerve (Nume, Prenume, DataNasterii, NrTelefonMobil) VALUES
	('Mitu', 'Ioan', '1956-12-03', '0756789567'),
	('Minolache', 'Paula', '1960-02-03', '0734573456'),
	('Pop', 'Gabriela-Maria', '1958-10-10', '0748903490')

	PRINT 'S-a creat o tabela noua numita ActoriRezerve'
END
GO

/*
Operatia inversa versiunii 3
Stergere tabela ActoriRezerve
*/
CREATE PROCEDURE InversVersiune3
AS
BEGIN
	DROP TABLE ActoriRezerve
	PRINT 'S-a sters tabela ActoriRezerve'
END
GO

/*
Adauga campul nou IDGrupe in tabela ActoriRezerve
*/
CREATE PROCEDURE Versiune4
AS
BEGIN
	ALTER TABLE ActoriRezerve
	ADD IDGrupe INT
	PRINT 'S-a adaugat campul IDGrupe in tabela ActoriRezerve'
END
GO

/*
Operatia inversa versiunii 4
Sterge campul IDGrupe din tabela ActoriRezerve
*/
CREATE PROCEDURE InversVersiune4
AS
BEGIN
	AlTER TABLE ActoriRezerve
	DROP COLUMN IDGrupe
	PRINT 'S-a sters campul IDGrupe din tabela ActoriRezerve'
END
GO

/*
Creeaza o constrangere de cheie straina intre IDGrupe din tabela
ActoriRezerve si IDGrupe din tabela Grupe
*/
CREATE PROCEDURE Versiune5
AS
BEGIN
	ALTER TABLE ActoriRezerve
	ADD CONSTRAINT fk_ActoriRezerve FOREIGN KEY (IDGrupe)
	REFERENCES Grupe(IDGrupe)
	PRINT 'S-a setat campul IDGrupe din tabela ActoriRezerve ca si cheie straina 
			catre campul IDGrupe din tabela Grupe'
END
GO

/*
Operatia inversa versiunii 5
Sterge constrangerea de cheie straina dintre IDGrupe din tabela
ActoriRezerve si IDGrupe din tabela Grupe
*/
CREATE PROCEDURE InversVersiune5
AS
BEGIN
	ALTER TABLE ActoriRezerve
	DROP CONSTRAINT fk_ActoriRezerve
	Print 'S-a sters cheia straina a campului IDGrupe din tabela ActoriRezerve 
			catre campul IDGrupe din tabela Grupe'
END
GO

/*
Schimba versiune in care se afla baza de date
Arunca eroare daca versiunea data ca parametru nu apartine [0, 5]
*/
CREATE PROCEDURE ModificaVersiune(@versiune INT)
AS
BEGIN


	DECLARE @procedura VARCHAR(30)
	DECLARE @i INT

	SELECT @versiune = CONVERT(INT, @versiune)

	IF(@versiune < 0 OR @versiune > 5)
		RAISERROR('Versiunile sunt doar 0, 1, 2, 3, 4, 5', 12, 1)
	ELSE
		BEGIN
		DECLARE @versiuneInitiala AS INT
		SELECT TOP 1 @versiuneInitiala = NrVersiune FROM Versiune

		IF (@versiune = @versiuneInitiala)
			RAISERROR('Data de baze se afla deja la aceasta versiune', 12, 1)
		ELSE
			BEGIN
			IF(@versiune > @versiuneInitiala)
				BEGIN
				SET @i = @versiuneInitiala + 1
				WHILE @i <= @versiune
					BEGIN
					SELECT @procedura = CONCAT('Versiune', @i)
					SET @i = @i + 1
					EXEC @procedura
					END
				END
			ELSE
				BEGIN
				SET @i = @versiuneInitiala
				WHILE @i > @versiune
					BEGIN
					SELECT @procedura = CONCAT('InversVersiune', @i)
					SET @i = @i - 1
					EXEC @procedura
					END
				END
			UPDATE Versiune SET NrVersiune = @versiune
			PRINT 'Baza de date este acum la versiunea: '
			PRINT @versiune
			END
		END
END
GO



EXEC ModificaVersiune 1
SELECT * FROM Versiune



