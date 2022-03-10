/*
adaug in Tables numele tabelelor pe care voi face teste
Adrese - o tabelă având un câmp ca şi cheie primară şi nici o cheie străină,
Actori - o tabelă având un câmp ca şi cheie primară şi cel puţin o cheie străină,
ActoriSpectacole - o tabelă având două câmpuri ca şi cheie primară,
*/
INSERT INTO Tables (Name) 
VALUES ('Adrese'), ('Actori'), ('ActoriSpectacole')

SELECT * FROM Tables

/*
adaug in tabela Tests numele testelor pe care le voi face
delete, insert, select
*/
INSERT INTO Tests (Name) VALUES
('Delete'), ('Insert'), ('Select')

SELECT * FROM Tests

-------------------------------------------------------------------------------------------


--Adaug numele view urilor in tabelul Views
INSERT INTO Views (Name) VALUES 
('View_1'), ('View_2'), ('View_3')

SELECT * FROM Views

-----------------------------------------------------------------------------------------------
--Inserare in tabelele de legatura
SELECT * FROM Tests
SELECT * FROM Views

INSERT INTO TestViews (TestID, ViewID) VALUES
(3, 1), (3, 2), (3, 3)

SELECT * FROM TestViews

-----------------------------------------------------------------------------------------------
SELECT * FROM Tests
SELECT * FROM Tables

INSERT INTO TestTables (TestID, TableID, Position, NoOfRows) VALUES
(1, 1, 3, 100), (1, 2, 2, 100), (1, 3, 1, 100), (2, 1, 1, 100), (2, 2, 2, 100), (2, 3, 3, 100)

SELECT * FROM TestTables
Go

----------------------------------------------------------------------------------------------
--Scriu procedurile pentru teste

/*
Test pentru tabelul Adrese si view-ul 1
*/
CREATE OR ALTER PROCEDURE test
@numberTable INT 
AS
BEGIN

	
	IF(@numberTable < 1 OR @numberTable > 3)
		RAISERROR('Tabelele pot fi doar 1, 2, 3', 12, 1)
	ELSE
	BEGIN

	DECLARE @ds DATETIME -- start time test
	DECLARE @di DATETIME -- intermediate time test
	DECLARE @de DATETIME -- end time test

	SET @ds = GETDATE()
	-- delete from table
	DECLARE @position INT
	SELECT @position = Position FROM TestTables WHERE TestID = 1 AND TableID = @numberTable

	EXEC delete_table @position
	-- insert into table
	--iau numarul de inserari
	DECLARE @noOfRows INT
	SELECT TOP 1 @noOfRows = NoOfRows FROM TestTables WHERE TableID = @numberTable AND TestID = 2
	EXEC insert_table @numberTable, @noOfRows

	SET @di=GETDATE()
	-- evaluate (select from) view
	EXEC select_view @numberTable
	SET @de=GETDATE()
	
	DECLARE @description NVARCHAR(50)
	SET @description = 'Test' + CONVERT(NVARCHAR(5), @numberTable)

	INSERT INTO TestRuns (Description, StartAt, EndAt) VALUES (@description, @ds, @de)
	
	--extrag id ul de test 
	DECLARE @idTestRuns INT
	SELECT TOP 1 @idTestRuns = TestRunID FROM TestRuns WHERE Description = @description AND StartAt = @ds AND EndAt = @de 

	INSERT INTO TestRunTables (TestRunID, TableID, StartAt, EndAt) VALUES (@idTestRuns, 1, @ds, @di)
	INSERT INTO TestRunViews (TestRunID, ViewID, StartAt, EndAt) VALUES (@idTestRuns, 1, @di, @de)
	END
END
GO

SELECT * FROM Tests
SELECT * FROM Tables
SELECT * FROM TestTables

GO
CREATE OR ALTER PROCEDURE main
AS
BEGIN
	EXEC test 1
	EXEC test 2
	EXEC test 3
END
GO


SELECT * FROM TestRuns
SELECT * FROM TestRunTables
SELECT * FROM TestRunViews

DELETE FROM TestRuns
DELETE FROM TestRunTables
DELETE FROM TestRunViews

EXEC main