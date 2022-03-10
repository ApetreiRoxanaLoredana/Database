--cele 3 tabele in relatie many to many:
--> Actori - O cheie primara, 2 chei straine
--> ActoriSpectacole - O cheie primara formata din 2 chei straine
--> Spectacole - O cheie primara, o cheie straina

GO
--> Cheia primara e identity
CREATE OR ALTER PROCEDURE CrudActori
@nume VARCHAR(50),
@prenume VARCHAR(100),
@varsta INT,
@experienta INT,
@noOfRows INT
AS
BEGIN
	SET NOCOUNT ON
	--verificare parametrii
	DECLARE @validatorActori VARCHAR(200)
	SET @validatorActori = dbo.TestActori(@nume, @prenume, @varsta, @experienta)
	DECLARE @validatorNoOfRows VARCHAR(50)
	SET @validatorNoOfRows = dbo.TestNoOfRows(@noOfRows)
	IF @validatorActori IS NULL AND @validatorNoOfRows IS NULL
	BEGIN
		--parametrii sunt ok

		--CREATE=INSERT
		EXEC CreateActori @nume, @prenume, @varsta, @experienta, @noOfRows
		PRINT 'S-au inserat ' + CAST(@noOfRows as varchar(10)) + ' inregistrari'

		--READ=SELECT
		SELECT * FROM Actori

		--UPDATE
		UPDATE Actori SET Experienta = 10
		WHERE Varsta > 40

		--DELETE
		EXEC DeleteActori

		PRINT 'S-au realizat operatiile CRUD pentru tabela Actori'
	END
	ELSE
	BEGIN
		PRINT @validatorActori
		PRINT @validatorNoOfRows
		RETURN
	END

END
GO
------------------------------------------------------------------------------------------------------------------

CREATE OR ALTER PROCEDURE CrudSpectacole
@piesa VARCHAR(50),
@regizor VARCHAR(50),
@data VARCHAR(20),
@noOfRows INT
AS
BEGIN
	SET NOCOUNT ON
	--verificare parametrii
	DECLARE @validatorSpectacole VARCHAR(200)
	SET @validatorSpectacole = dbo.TestSpectacole(@piesa, @regizor, @data)
	DECLARE @validatorNoOfRows VARCHAR(50)
	SET @validatorNoOfRows = dbo.TestNoOfRows(@noOfRows)

	IF @validatorSpectacole IS NULL AND @validatorNoOfRows IS NULL
	BEGIN
		--parametrii sunt ok
		--CREATE=INSERT
		EXEC CreateSpectacole @piesa, @regizor, @data, @noOfRows
		PRINT 'S-au inserat ' + CAST(@noOfRows as varchar(10)) + ' inregistrari'

		--READ=SELECT
		SELECT * FROM Spectacole

		--UPDATE
		UPDATE Spectacole SET Data = '2020-12-12'
		WHERE Data < '2020-01-01' OR Data > '2025-01-01'

		--DELETE
		EXEC DeleteSpectacole

		PRINT 'S-au realizat operatiile CRUD pentru tabela Actori'
	END
	ELSE
	BEGIN
		PRINT @validatorSpectacole
		PRINT @validatorNoOfRows
		RETURN
	END
END
GO
------------------------------------------------------------------------------------------------------------------

CREATE OR ALTER PROCEDURE CrudActoriSpectacole
@noOfRows INT
AS
BEGIN
	SET NOCOUNT ON
	--validam parametrii
	DECLARE @validatorNoOfRows VARCHAR(50)
	SET @validatorNoOfRows = dbo.TestNoOfRows(@noOfRows)
	IF @validatorNoOfRows IS NULL
	BEGIN
		--parametrii sunt ok
		--CREATE=INSERT
		EXEC CreateActoriSpectacole @noOfRows
		PRINT 'S-au inserat ' + CAST(@noOfRows as varchar(10)) + ' inregistrari'

		--READ=SELECT
		SELECT * FROM ActoriSpectacole

		--UPDATE
		PRINT 'Nu se face update pe tabela asta'

		--DELETE
		DELETE FROM ActoriSpectacole

		PRINT 'S-au realizat operatiile CRUD pentru tabela Actori'
	END
	ELSE
	BEGIN
		PRINT @validatorNoOfRows
		RETURN
	END

END
GO

EXEC CrudActori 'Constantin', 'Ionut', 45, 4, 3
SELECT * FROM Actori

EXEC CrudSpectacole 'Cariuca', 'Ana Popescu', '2021-12-12', 5
SELECT * FROM Spectacole

EXEC CrudActoriSpectacole 6
SELECT * FROM ActoriSpectacole
