/*
Insereaza un numar de inregistrari in tabela Actori
*/
CREATE OR ALTER PROCEDURE CreateActori
@nume VARCHAR(50),
@prenume VARCHAR(100),
@varsta INT,
@experienta INT,
@noOfRows INT
AS
BEGIN
	DECLARE @idGrupe INT
	DECLARE @idAdrese INT
	--extragere chei straine 
	SELECT TOP 1 @idGrupe = IDGrupe FROM Grupe
	SELECT TOP 1 @idAdrese = IDAdrese FROM Adrese
	--inserare cheii straine daca nu exista
	IF @idGrupe IS NULL
	BEGIN
		INSERT INTO Grupe (NumarActori) VALUES (5)
		SELECT TOP 1 @idGrupe = IDGrupe FROM Grupe
	END

	IF @idAdrese IS NULL
	BEGIN
		INSERT INTO Adrese (Judet, Localitate, Strada, Numar, Bloc, Scara, Apartament) VALUES
		('Cluj', 'Cluj-napoca', 'Decebal', 12, '3D', 'D', 12)
		SELECT TOP 1 @idAdrese = IDAdrese FROM Adrese
	END

	--CREATE=INSERT
	DECLARE @i INT --contor
	SET @i = 0
	WHILE @i < @noOfRows
	BEGIN
		INSERT INTO Actori (Nume, Prenume, Varsta, Experienta, IdGrupe, IdAdrese) VALUES 
		(@nume, @prenume, @varsta, @experienta, @idGrupe, @idAdrese)
		SET @i = @i + 1
	END
END
GO


/*
Sterge din tabela Actori actorii care au o experienta mai mica de 6
*/
CREATE OR ALTER PROCEDURE DeleteActori
AS
BEGIN
	--DELETE
	--Stergem din ActoriSpectacole 
	DECLARE @idActori INT
	DECLARE cursorActori CURSOR FAST_FORWARD FOR
	SELECT IDActori FROM Actori WHERE Experienta < 6
	OPEN cursorActori
	FETCH NEXT FROM cursorActori INTO @idActori
	WHILE(@@FETCH_STATUS = 0)
	BEGIN
		DELETE FROM ActoriSpectacole WHERE IDActori = @idActori
		FETCH NEXT FROM cursorActori INTO @idActori
	END
	CLOSE cursorActori
	DEALLOCATE cursorActori
	--Stergem din Actori
	DELETE FROM Actori WHERE Experienta < 6
END
GO

/*
Insereaza un numar de inregistrari in tabela Spectacole
*/
CREATE OR ALTER PROCEDURE CreateSpectacole
@piesa VARCHAR(50),
@regizor VARCHAR(50),
@data VARCHAR(20),
@noOfRows INT
AS
BEGIN
	DECLARE @idSaliOnline INT
	--extragere cheie straina
	SELECT TOP 1 @idSaliOnline = IDSaliOnline FROM SaliOnline
	--inserare cheie straina daca nu exista
	IF @idSaliOnline IS NULL
	BEGIN
		INSERT INTO SaliOnline (Platforma, Cod, Parola, NumarLocuri) VALUES
		('Zoom', '12345', 'xxx', 50)
		SELECT TOP 1 @idSaliOnline = IDSaliOnline FROM SaliOnline
	END

	--CREATE=INSERT
	DECLARE @i INT --contor
	SET @i = 0
	WHILE @i < @noOfRows
	BEGIN
		INSERT INTO Spectacole(Piesa, Regizor, Data, IDSaliOnline) VALUES
		(@piesa, @regizor, @data, @idSaliOnline)
		SET @i = @i + 1
	END
END
GO

/*
Sterge din tabela Spectacole spectacolele a caror piesa incepe cu litera C
*/
CREATE OR ALTER PROCEDURE DeleteSpectacole
AS
BEGIN
	--DELETE
	--Stergem inregistrarile din tabelele unde cheia noastra primara e cheie straina
	--Stergem din ActoriSpectacole, Bilete,  SpectacoleRecuzita
	DECLARE @idSpectacole INT
	DECLARE cursorSpectacole CURSOR FAST_FORWARD FOR
	SELECT IDSpectacole FROM Spectacole WHERE Piesa LIKE 'C%'
	OPEN cursorSpectacole
	FETCH NEXT FROM cursorSpectacole INTO @idSpectacole
	WHILE(@@FETCH_STATUS = 0)
	BEGIN
		DELETE FROM ActoriSpectacole WHERE IDSpectacole = @idSpectacole
		DELETE FROM Bilete WHERE IDSpectacole = @idSpectacole
		DELETE FROM SpectacoleRecuzita WHERE IDSpectacole = @idSpectacole
		FETCH NEXT FROM cursorSpectacole INTO @idSpectacole
	END
	CLOSE cursorSpectacole
	DEALLOCATE cursorSpectacole
	
	--Stergem din Spectacole
	DELETE FROM Spectacole WHERE Piesa LIKE 'C%'
END
GO

/*
Insereaza un numar de inregistrari in tabela ActoriSpectacole
*/
CREATE OR ALTER PROCEDURE CreateActoriSpectacole
@noOfRows INT
AS
BEGIN
	--CREATE=INSERT

	--verific daca exista suficiente inserari in tabela Actori
	--daca nu, mai inseram cate sunt necesare
	DECLARE @noActori INT
	SELECT @noActori = COUNT(*) FROM Actori
	IF @noActori < @noOfRows
	BEGIN
		DECLARE @rest INT
		SET @rest = @noOfRows - @noActori
		EXEC CreateActori 'Popescu', 'Antonia', 25, 3, @rest
	END

	--extrag id-ul unui spectacol
	--daca nu exista nici unul atunci adaug 
	DECLARE @idSpectacole INT
	SELECT TOP 1 @idSpectacole = IDSpectacole FROM Spectacole
	IF @idSpectacole IS NULL
	BEGIN
		EXEC CreateSpectacole 'Craciunul lui Grinch', 'Popescu Anton', '2004-12-12', 1
		SELECT TOP 1 @idSpectacole = IDSpectacole FROM Spectacole
	END

	--inserez in tabela ActoriSpectacole
	INSERT INTO ActoriSpectacole (IDActori, IDSpectacole)
	SELECT TOP (@noOfRows) IDActori, IDSpectacole
	FROM Actori CROSS JOIN Spectacole
END
GO

