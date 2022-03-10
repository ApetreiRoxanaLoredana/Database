/*
Creeare proceduri pentru insert, delete si select
*/
-------------------------------------------------------------------------------------------------------------------
--INSERARI
/*
Procedura de inserare in tabela Adrese
Tabela care are doar cheie primara
*/
CREATE OR ALTER PROCEDURE insert_1
@noOfRows int
AS
BEGIN
	DECLARE @i INT --contor de inserari
	SET @i = 0

	DECLARE @judet VARCHAR(50)
	DECLARE @localitate VARCHAR(50)
	DECLARE @strada VARCHAR(50)
	DECLARE @numar INT
	DECLARE @bloc VARCHAR(50)
	DECLARE @scara VARCHAR(50)
	DECLARE @apartament INT
	
	WHILE @i < @noOfRows
	BEGIN
		SET @strada = 'Strada' + CONVERT (VARCHAR(5), @i)
		SET @numar = @i
		SET @bloc = 'Bloc' + CONVERT (VARCHAR(5), @i)
		SET @scara = 'Scara' + CONVERT (VARCHAR(5), @i)
		SET @apartament = @i

		--imi setez judetele si localitatile sa fie mai variate (mai mult pt view)
		IF @i % 3 = 0
		BEGIN
			SET @judet = 'Cluj'
			SET @localitate = 'Cluj-Napoca'
		END
		ELSE IF @i % 3 = 1
		BEGIN
			SET @judet = 'Bistrita-Nasaud'
			SET @localitate = 'Bistrita'
		END
		ELSE
		BEGIN
			SET @judet = 'Brasov'
			SET @localitate = 'Brasov'
		END
		--inserez
		INSERT INTO Adrese (Judet, Localitate, Strada, Numar, Bloc, Scara, Apartament) VALUES
		(@judet, @localitate, @strada, @numar, @bloc, @scara, @apartament)

		--incrementez contorul
		SET @i = @i + 1
	END
END

/*
Procedura de inserare in tabela Actori
Tabela care are o cheie primara si doua chei straine
*/
CREATE OR ALTER PROCEDURE insert_2
@noOfRows int
AS
BEGIN
	
	DECLARE @i INT --contor de inserari
	SET @i = 0

	DECLARE @nume VARCHAR(50)
	DECLARE @prenume VARCHAR(50)
	DECLARE @varsta INT
	DECLARE @experienta INT
	DECLARE @idGrupe INT
	DECLARE @idAdrese INT

	SELECT TOP 1 @idGrupe = IDGrupe FROM Grupe --luam o cheie straina din tabelul grupe
	--verificam daca exista
	IF @idGrupe IS NULL
	BEGIN
		INSERT INTO Grupe (NumarActori) VALUES (100)
		SELECT TOP 1 @idGrupe = IDGrupe FROM Grupe
	END

	SELECT TOP 1 @idAdrese = IDAdrese FROM Adrese --luam o cheie straina din tabelul adrese
	--verificam daca exista
	IF @idAdrese IS NULL
	BEGIN
		INSERT INTO Adrese (Judet, Localitate, Strada, Numar, Bloc, Scara, Apartament) VALUES
		('Cluj', 'Cluj-Napoca', 'Bistritei', 3, '3D', 'A', 14)
		SELECT TOP 1 @idAdrese = IDAdrese FROM Adrese
	END


	WHILE @i < @noOfRows
	BEGIN
		SET @nume = 'Nume' + CONVERT (VARCHAR(5), @i)
		SET @prenume = 'Prenume' + CONVERT (VARCHAR(5), @i)
		SET @varsta = 30
		SET @experienta = 8

		--inserez
		INSERT INTO Actori (Nume, Prenume, Varsta, Experienta, IDGrupe, IDAdrese) VALUES
		(@nume, @prenume, @varsta, @experienta, @idGrupe, @idAdrese)

		--incrementez contorul
		SET @i = @i + 1
	END
END
GO

/*
Procedura de inserare in tabela ActoriSpectacole
Tabela care are doua chei primare
*/
CREATE OR ALTER PROCEDURE insert_3
@noOfRows INT 
AS
BEGIN
	DECLARE @noActori INT --numarul de inserari actuale din tabela Actori
	DECLARE @noSpectacole INT --numarul de inserari actuale din tabela Spectacole
	SELECT @noActori = COUNT(*) FROM Actori
	SELECT @noSpectacole = COUNT(*) FROM Spectacole

	--verific daca exista suficiente inserari in tabela Actori
	IF @noActori < @noOfRows
	BEGIN
		DECLARE @rest INT
		SET @rest = @noOfRows - @noActori
		EXEC insert_2 @rest
	END

	--pentru Spectacole ma asigur ca exista macar o inserare
	IF @noSpectacole = 0
	BEGIN
		--Tabela spectacole are drept cheie straina IDSaliOnline
		--Trebuie verificat daca si acolo am macar o inserare
		DECLARE @idSaliOnline INT
		SELECT TOP 1 @idSaliOnline = IDSaliOnline FROM SaliOnline

		IF @idSaliOnline IS NULl
		BEGIN
			--inserez in SaliOnline
			INSERT INTO SaliOnline (Platforma, Cod, Parola, NumarLocuri) VALUES
			('Zoom', '12345', 'xxx', 50)
			SELECT TOP 1 @idSaliOnline = IDSaliOnline FROM SaliOnline
		END
		--inserez in Spectacole
		INSERT INTO Spectacole(Piesa, Regizor, Data, IDSaliOnline) VALUES
		('O scrisoare pierduta', 'Pop Mihai', '2021-12-17', @idSaliOnline)
	END

	--inserez in tabela de legatura ActoriSpectacole
	INSERT INTO ActoriSpectacole (IDActori, IDSpectacole)
	SELECT TOP (@noOfRows) IDActori, IDSpectacole
	FROM Actori CROSS JOIN Spectacole 
	
END
GO

/*
Procedura ce apeleaza insertul necesar in functie de tabela
*/
CREATE OR ALTER PROCEDURE insert_table
@idTable INT,
@noOfRows INT 
AS
BEGIN
	DECLARE @TableName VARCHAR(50)
	SELECT TOP 1 @TableName = NAME FROM Tables WHERE TableID = @idTable
	exec ('insert_' + @idTable + ' ' + @NoOfRows)
	PRINT 'S-au inserat datele in tabela ' + @TableName
END
GO

--------------------------------------------------------------------------------------------------------
--DELETE-URI

/*
Procedura de stergere a tabelei ActoriSpectacole
Tabela cu doua chei primare
*/
CREATE OR ALTER PROCEDURE delete_1
AS
BEGIN
	DELETE FROM ActoriSpectacole
	PRINT 'S-a sters tabela ActoriSpectacole'
END
GO

/*
Procedura de stergere a tabelei Actori
Tabela cu o cheie primara si una straina
*/
CREATE OR ALTER PROCEDURE delete_2
AS
BEGIN
	DELETE FROM ActoriSpectacole
	DELETE FROM Actori
	PRINT 'S-a sters tabela Actori'
END
GO

/*
Procedura de stergere a tabelei Adrese
Tabela cu o cheie primara
*/
CREATE OR ALTER PROCEDURE delete_3
AS
BEGIN
	DELETE FROM ActoriSpectacole
	DELETE FROM Actori
	DELETE FROM Adrese
	
	PRINT 'S-a sters tabela Adrese'
END
GO

/*
Procedura ce apeleaza delete ul necesar in fucntie de tabela
*/
CREATE OR ALTER PROCEDURE delete_table
@idTable INT
AS
BEGIN
	DECLARE @TableName VARCHAR(50)
	EXEC ('delete_' + @idTable)
END
GO
---------------------------------------------------------------------------------------------
--VIEW-URI

/*
Procedura ce apeleaza view urile necesare
*/
CREATE OR ALTER PROCEDURE select_view
@view_number INT
AS
BEGIN
	DECLARE @view_name VARCHAR(50)
	SET @view_name = 'view_' + CONVERT(VARCHAR(5), @view_number)
	EXEC('SELECT * FROM ' + @view_name)
end 
go







