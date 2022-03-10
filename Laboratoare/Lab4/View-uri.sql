--Creeare View uri
/*
Adresele actorilor din localitatea Cluj-Napoca
*/
CREATE OR ALTER VIEW View_1 AS
	SELECT * FROM Adrese a
	WHERE a.Localitate = 'Cluj-Napoca'
GO

/*
Actorii care locuiesc in orasul Cluj-Napoca
*/
CREATE VIEW View_2 AS
	SELECT a.IDActori, a.Nume, a.Prenume, adr.Localitate FROM Actori a
	INNER JOIN Adrese adr ON adr.IDAdrese = a.IDAdrese
	WHERE adr.Localitate = 'Cluj-Napoca'
GO

/*
Judetele ale caror actori au o medie de experienta mai mare de 5
*/
CREATE VIEW View_3 AS
	SELECT AVG(act.Experienta) AS Experienta_medie, adr.Judet FROM Actori act
	INNER JOIN Adrese adr ON adr.IDAdrese = act.IDAdrese
	GROUP BY adr.Judet
	HAVING AVG(act.Experienta) > 5
GO


SELECT * FROM View_1
SELECT * FROM View_2
SELECT * FROM View_3