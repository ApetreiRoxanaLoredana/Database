ALTER TABLE Actori
ADD CHECK (Experienta > 0 AND Experienta <= 10);

/*
Valideaza informatiile despre un actor
*/
CREATE OR ALTER FUNCTION TestActori 
(@nume VARCHAR(50), @prenume VARCHAR(100), @varsta INT, @experienta INT)
RETURNS VARCHAR(200)
AS
BEGIN
	DECLARE @errors VARCHAR(200)
	--Validare nume
	IF @nume LIKE '%[0-9]%'
	BEGIN
		SET @errors = CONCAT(@errors, 'Numele nu poate contine numere')
		SET @errors = CONCAT(@errors, CHAR(13))
	END

	IF @nume LIKE ''
	BEGIN
		SET @errors = CONCAT(@errors, 'Numele nu poate fi vid')
		SET @errors = CONCAT(@errors, CHAR(13))
	END
	--Validare prenume
	IF @prenume LIKE '%[0-9]%'
	BEGIN
		SET @errors = CONCAT(@errors, 'Prenumele nu poate contine numere')
		SET @errors = CONCAT(@errors, CHAR(13))
	END

	IF @prenume LIKE ''
	BEGIN
		SET @errors = CONCAT(@errors, 'Prenumele nu poate fi vid')
		SET @errors = CONCAT(@errors, CHAR(13))
	END
	--Validare varsta
	IF @varsta <= 16 OR @varsta >= 60
	BEGIN
		SET @errors = CONCAT(@errors, 'Varsta trebuie sa fie intre (16, 60)')
		SET @errors = CONCAT(@errors, CHAR(13))
	END
	--Validare experienta
	IF @experienta <= 0 OR @experienta > 10
	BEGIN
		SET @errors = CONCAT(@errors, 'Experienta trebuie sa fie intre [1,10]')
		SET @errors = CONCAT(@errors, CHAR(13))
	END

	RETURN @errors
END
GO

/*
Valideaza numarul de randuri sa fie intre [1-100]
*/
CREATE OR ALTER FUNCTION TestNoOfRoWS(@noOfRows INT)
RETURNS VARCHAR(50)
AS
BEGIN
	DECLARE @errors VARCHAR(50)
	IF @noOfRows <= 0 or @noOfRows > 100
		SET @errors = CONCAT(@errors, 'Numarul de linii inserate poate fi intre [1-100]')
	RETURN @errors
END
GO

/*
Valideaza datele despre un spectacol
*/
CREATE OR ALTER FUNCTION TestSpectacole 
(@piesa VARCHAR(50), @regizor VARCHAR(50), @data VARCHAR(20))
RETURNS VARCHAR(200)
AS 
BEGIN
	DECLARE @errors VARCHAR(200)

	--Validare piesa
	IF @piesa LIKE ''
	BEGIN
		SET @errors = CONCAT(@errors, 'Piesa nu poate fi vida')
		SET @errors = CONCAT(@errors, CHAR(13))
	END
	--Validare regizor
	IF @regizor LIKE '%[0-9]%'
	BEGIN
		SET @errors = CONCAT(@errors, 'Numele regizorului nu poate contine numere')
		SET @errors = CONCAT(@errors, CHAR(13))
	END

	IF @regizor LIKE ''
	BEGIN
		SET @errors = CONCAT(@errors, 'Numele regizorului nu poate fi vid')
		SET @errors = CONCAT(@errors, CHAR(13))
	END
	--Validare data
	IF (SELECT ISDATE(@data)) = 0
	BEGIN
		SET @errors = CONCAT(@errors, 'Data e invalida')
		SET @errors = CONCAT(@errors, CHAR(13))
	END

	RETURN @errors
END
GO


