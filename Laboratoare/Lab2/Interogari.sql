USE TeatruOnline
/*
1. Actorii care se afla in grupa 2 si locuiesc in Cluj-Napoca
*/
SELECT * FROM Actori
SELECT * FROM Grupe
SELECT * FROM Adrese

SELECT a.IDActori, a.Nume, a.Prenume, a.IDGrupe, ad.Localitate
FROM Actori a 
INNER JOIN Grupe g ON a.IDGrupe = g.IDGrupe
INNER JOIN Adrese ad ON a.IDAdrese = ad.IDAdrese
WHERE a.IDGrupe = 2 AND ad.Localitate = 'Cluj-Napoca'

/*
2. Pretul total al biletelor vandute pentru fiecare spectacol 
   care se desfasoara pe platforma Zoom
*/
SELECT * FROM Bilete
SELECT * FROM Spectacole
SELECT * FROM SaliOnline

SELECT s.IDSpectacole, s.Piesa, SUM(b.Pret) AS Pret_total
FROM Bilete b
INNER JOIN Spectacole s ON b.IDSpectacole = s.IDSpectacole
INNER JOIN SaliOnline so ON so.IDSaliOnline = s.IDSaliOnline
WHERE so.Platforma = 'Zoom'
GROUP BY s.IDSpectacole, s.Piesa

/*
3. Orasele de provienienta ale actorilor care participa la piesa 'O scrisoare pierduta'
*/
SELECT DISTINCT a.Localitate
FROM Adrese a
INNER JOIN Actori ac ON ac.IDAdrese = a.IDAdrese
INNER JOIN ActoriSpectacole acs ON acs.IDActori = ac.IDActori
INNER JOIN Spectacole s ON s.IDSpectacole = acs.IDSpectacole
WHERE s.Piesa = 'O scrisoare pierduta'

/*
4. Piesele de teatru care folosesc ca recuzita un obiect mai usor de 20.0 kg
*/
SELECT * FROM Spectacole
SELECT * FROM SpectacoleRecuzita
SELECT * FROM Recuzita

SELECT DISTINCT s.Piesa, sr.IDRecuzita, r.Denumire
FROM Spectacole s
INNER JOIN SpectacoleRecuzita sr ON sr.IDSpectacole = s.IDSpectacole
INNER JOIN Recuzita r ON r.IDRecuzita = sr.IDRecuzita
WHERE r.Greutate < 20

/*
5. Varsta medie, maxima si minima a actorilor/piesa
*/
SELECT * FROM Spectacole
SELECT * FROM ActoriSpectacole
SELECT * FROM Actori

SELECT s.Piesa, AVG(a.Varsta) AS Varsta_medie, MAX(a.Varsta) AS Varsta_maxima, MIN(a.Varsta) AS Varsta_minima  
FROM Actori a
INNER JOIN ActoriSpectacole acs ON acs.IDActori = a.IDActori
INNER JOIN Spectacole s ON s.IDSpectacole = acs.IDSpectacole
GROUP BY s.Piesa

/*
6. Grupele al carui nivel mediu de experienta actoriceasca e mai mare decat 5, 
   ordonate descrescator in functie de media experientei
*/
SELECT * FROM Actori
SELECT * FROM Grupe

SELECT g.IDGrupe, AVG(a.Experienta) AS Medie_experienta
FROM Actori a
INNER JOIN Grupe g ON g.IDGrupe = a.IDGrupe
GROUP BY g.IDGrupe
HAVING AVG(a.Experienta) > 5
ORDER BY Medie_experienta DESC

/*
7. Spectacolele care au avut incasari mai mari de 50 de lei si
   care au mai mult de 40 de locuri pe platforma in care se desfasoara
*/
SELECT * FROM Spectacole
SELECT * FROM SaliOnline
SELECT * FROM Bilete

SELECT s.IDSpectacole, s.Piesa, so.NumarLocuri, SUM(b.Pret) AS Incasari
FROM Bilete b
INNER JOIN Spectacole s ON b.IDSpectacole = s.IDSpectacole
INNER JOIN SaliOnline so ON so.IDSaliOnline = s.IDSaliOnline
WHERE so.NumarLocuri > 40
GROUP BY s.IDSpectacole, s.Piesa, so.NumarLocuri
HAVING SUM(b.Pret) > 50

/*
8. Actorii care joaca pe platforma Zoom sau care au o experienta mai 
   mica de 5
*/
SELECT * FROM Spectacole
SELECT * FROM ActoriSpectacole
SELECT * FROM SaliOnline

SELECT DISTINCT a.IDActori, a.Nume, a.Prenume, a.Experienta
FROM Actori a
INNER JOIN ActoriSpectacole acs ON acs.IDActori = a.IDActori
INNER JOIN Spectacole s ON s.IDSpectacole = acs.IDSpectacole
INNER JOIN SaliOnline so ON so.IDSaliOnline = s.IDSaliOnline
WHERE so.Platforma = 'Zoom'
UNION 
SELECT a.IDActori, a.Nume, a.Prenume, a.Experienta
FROM Actori a
WHERE a.Experienta < 5

/*
9. Top 3 actori care joaca in cele mai multe spectacole
*/
SELECT * FROM Actori
SELECT * FROM ActoriSpectacole
SELECT * FROM Spectacole

SELECT TOP 3 acs.IDActori, a.Nume, a.Prenume, COUNT(acs.IDActori) AS Numar_spectacole
FROM Actori a
INNER JOIN ActoriSpectacole acs ON acs.IDActori = a.IDActori
INNER JOIN Spectacole s ON s.IDSpectacole = acs.IDSpectacole
GROUP BY acs.IDActori, a.Nume, a.Prenume
ORDER BY COUNT(acs.IDActori) DESC

/*
10. Coordonatorul care are grupa cu cea mai mare experienta medie
*/
SELECT TOP 1 c.IDCoordonatori, c.Nume, c.Prenume, AVG(a.Experienta) AS Experienta_medie 
FROM Coordonatori c
INNER JOIN Grupe g ON g.IDGrupe = c.IDCoordonatori
INNER JOIN Actori a ON a.IDGrupe = g.IDGrupe
GROUP BY c.IDCoordonatori, c.Nume, c.Prenume
ORDER BY AVG(a.Experienta) DESC
