--Creare View-uri
/*
Actorii a caror varsta e mai mare de 30 de ani
*/
CREATE OR ALTER VIEW ViewActori AS
	SELECT Nume, Prenume, Varsta FROM Actori
	WHERE Varsta > 30
GO

CREATE OR ALTER VIEW ViewActoriSpectacole AS
	SELECT Nume, Prenume FROM Actori a
	INNER JOIN ActoriSpectacole acts ON acts.IDActori = a.IDActori
	INNER JOIN Spectacole s ON s.IDSpectacole = acts.IDSpectacole
GO

--Creare indecsi
IF EXISTS (SELECT name FROM sys.indexes WHERE name = N'N_idx_Actori_Nume_Prenume_Varsta')
 DROP INDEX N_idx_Actori_Nume_Prenume_Varsta  ON Actori;
GO
CREATE NONCLUSTERED INDEX N_idx_Actori_Nume_Prenume_Varsta ON Actori 
(Nume ASC, Prenume ASC, Varsta ASC) WHERE Varsta > 30
GO

IF EXISTS (SELECT name FROM sys.indexes WHERE name = N'N_idx_IdActori')
 DROP INDEX N_idx_IdActori ON ActoriSpectacole;
GO
CREATE NONCLUSTERED INDEX N_idx_IdActori ON ActoriSpectacole
(IdActori ASC, IdSpectacole ASC)
------------------------------------------------------------------------------------------
SELECT * FROM ViewActori ORDER BY Nume, Prenume

SELECT * FROM  ViewActoriSpectacole

SELECT * FROM ActoriSpectacole

DELETE ActoriSpectacole
EXEC CreateActoriSpectacole 1000

