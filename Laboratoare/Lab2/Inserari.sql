USE TeatruOnline

--Inserare adrese
INSERT INTO Adrese (Judet, Localitate, Strada, Numar, Bloc, Scara, Apartament)
VALUES ('Bistrita-Nasaud', 'Bistrita', 'Ghiocelului', 12, '2B', 'B', 16);
INSERT INTO Adrese (Judet, Localitate, Strada, Numar, Bloc, Scara, Apartament)
VALUES ('Cluj', 'Cluj-Napoca', 'Eminescu', 16, '67A', 'A', 2);
INSERT INTO Adrese (Judet, Localitate, Strada, Numar, Bloc, Scara, Apartament)
VALUES ('Cluj', 'Cluj-Napoca', 'Decebal', 23, '234', 'H', 34);
INSERT INTO Adrese (Judet, Localitate, Strada, Numar, Bloc, Scara, Apartament)
VALUES ('Cluj', 'Cluj-Napoca', 'Constantin', 20, '88C', 'C', 18);
INSERT INTO Adrese (Judet, Localitate, Strada, Numar, Bloc, Scara, Apartament)
VALUES ('Arad', 'Arad', 'Lalelei', 14, '2', 'D', 1);
INSERT INTO Adrese (Judet, Localitate, Strada, Numar, Bloc, Scara, Apartament)
VALUES ('Arad', 'Arad', 'Mrgaritarului', 19, '3', 'B', 2);
INSERT INTO Adrese (Judet, Localitate, Strada, Numar, Bloc, Scara, Apartament)
VALUES ('Alba-Iulia', 'Alba-Iulia', 'Pestelui', 20, '2CC', 'A', 89);
INSERT INTO Adrese (Judet, Localitate, Strada, Numar, Bloc, Scara, Apartament)
VALUES ('Oradea', 'Oradea', 'Pescarului', 14, '9', 'C', 100);

SELECT * FROM Adrese

--Inserare grupe
INSERT INTO Grupe (NumarActori)
VALUES (3);
INSERT INTO Grupe (NumarActori)
VALUES (10);
INSERT INTO Grupe (NumarActori)
VALUES (4);
INSERT INTO Grupe (NumarActori)
VALUES (5);

SELECT * FROM Grupe


--Inserare coordonatori
INSERT INTO Coordonatori (IDCoordonatori, Nume, Prenume, Varsta)
VALUES (1, 'Pop', 'Mircea', 23);
INSERT INTO Coordonatori (IDCoordonatori, Nume, Prenume, Varsta)
VALUES (4, 'Muresan', 'Ionela', 33);
INSERT INTO Coordonatori (IDCoordonatori, Nume, Prenume, Varsta)
VALUES (3, 'Moldovan', 'Maria-Cristina', 27);
INSERT INTO Coordonatori (IDCoordonatori, Nume, Prenume, Varsta)
VALUES (2, 'Anton', 'Gabriela', 30);

SELECT * FROM Coordonatori

--Inserare actori
INSERT INTO Actori (Nume, Prenume, Varsta, Experienta, IDGrupe, IDAdrese)
VALUES ('Eminescu', 'Ion', 23, 5, 1, 5);
INSERT INTO Actori (Nume, Prenume, Varsta, Experienta, IDGrupe, IDAdrese)
VALUES ('Ateodoreseiei', 'Cristina', 18, 3, 1, 2);
INSERT INTO Actori (Nume, Prenume, Varsta, Experienta, IDGrupe, IDAdrese)
VALUES ('Miholache', 'Marcel', 27, 8, 3, 4);
INSERT INTO Actori (Nume, Prenume, Varsta, Experienta, IDGrupe, IDAdrese)
VALUES ('Papuc', 'Alina', 50, 10, 2, 3);
INSERT INTO Actori (Nume, Prenume, Varsta, Experienta, IDGrupe, IDAdrese)
VALUES ('Stupinian', 'Iosif', 33, 7, 3, 1);
INSERT INTO Actori (Nume, Prenume, Varsta, Experienta, IDGrupe, IDAdrese)
VALUES ('Ardelean', 'Nicolae', 30, 6, 2, 2);
INSERT INTO Actori (Nume, Prenume, Varsta, Experienta, IDGrupe, IDAdrese)
VALUES ('Caienar', 'Beatrice', 20, 5, 2, 4);
INSERT INTO Actori (Nume, Prenume, Varsta, Experienta, IDGrupe, IDAdrese)
VALUES ('Fretean', 'Denisa', 24, 6, 3, 3);
--
INSERT INTO Actori (Nume, Prenume, Varsta, Experienta, IDGrupe, IDAdrese)
VALUES ('Alexia', 'Ioana', 23, 4, 3, 5);
INSERT INTO Actori (Nume, Prenume, Varsta, Experienta, IDGrupe, IDAdrese)
VALUES ('Hadarau', 'Cristian', 35, 7, 2, 6);
INSERT INTO Actori (Nume, Prenume, Varsta, Experienta, IDGrupe, IDAdrese)
VALUES ('Cantor', 'Dan', 29, 6, 4, 7);
INSERT INTO Actori (Nume, Prenume, Varsta, Experienta, IDGrupe, IDAdrese)
VALUES ('Gaina', 'Gabriela', 24, 6, 2, 7);
INSERT INTO Actori (Nume, Prenume, Varsta, Experienta, IDGrupe, IDAdrese)
VALUES ('Apetrei', 'Roxana', 21, 10, 2, 8);
--
INSERT INTO Actori (Nume, Prenume, Varsta, Experienta, IDGrupe, IDAdrese)
VALUES ('Encean', 'Mircea', 21, 7, 1, 8);
INSERT INTO Actori (Nume, Prenume, Varsta, Experienta, IDGrupe, IDAdrese)
VALUES ('Dmacus', 'Luiza', 29, 3, 2, 7);
INSERT INTO Actori (Nume, Prenume, Varsta, Experienta, IDGrupe, IDAdrese)
VALUES ('Arcalean', 'Lorena', 21, 9, 2, 4);
INSERT INTO Actori (Nume, Prenume, Varsta, Experienta, IDGrupe, IDAdrese)
VALUES ('Domsa', 'Cristian', 24, 6, 2, 5);
INSERT INTO Actori (Nume, Prenume, Varsta, Experienta, IDGrupe, IDAdrese)
VALUES ('Anton', 'Lucas', 23, 7, 2, 5);
INSERT INTO Actori (Nume, Prenume, Varsta, Experienta, IDGrupe, IDAdrese)
VALUES ('Zacusca', 'Ionel', 28, 9, 4, 7);
INSERT INTO Actori (Nume, Prenume, Varsta, Experienta, IDGrupe, IDAdrese)
VALUES ('Muresan', 'Daniel', 34, 8, 4, 6);
INSERT INTO Actori (Nume, Prenume, Varsta, Experienta, IDGrupe, IDAdrese)
VALUES ('Encean', 'Dorel', 56, 7, 4, 5);
INSERT INTO Actori (Nume, Prenume, Varsta, Experienta, IDGrupe, IDAdrese)
VALUES ('Modoi', 'Vasile', 45, 6, 4, 4);

SELECT * FROM Actori

--Inserare saliOnline
INSERT INTO SaliOnline (Platforma, Cod, Parola, NumarLocuri)
VALUES ('Zoom', '234123', 'sX67RT9', 50);
INSERT INTO SaliOnline (Platforma, Cod, Parola, NumarLocuri)
VALUES ('Teams', 'X76LOy', '23990Pwe', 30);
INSERT INTO SaliOnline (Platforma, Cod, Parola, NumarLocuri)
VALUES ('GoogleMeet', '345Ggt', 'p23TrQ7', 45);
INSERT INTO SaliOnline (Platforma, Cod, Parola, NumarLocuri)
VALUES ('Jitsi', 'g637Ytr', 'mpoTYWQ45', 25);
INSERT INTO SaliOnline (Platforma, Cod, Parola, NumarLocuri)
VALUES ('Zoom', '3492HYf', '32HKS8', 30);
INSERT INTO SaliOnline (Platforma, Cod, Parola, NumarLocuri)
VALUES ('Zoom', '093928', 'dkHKBD', 40);
INSERT INTO SaliOnline (Platforma, Cod, Parola, NumarLocuri)
VALUES ('Zoom', '43nHhj', 'hdbsGJHS7', 100);

SELECT * FROM SaliOnline

--Inserare recuzita
INSERT INTO Recuzita (Denumire, Greutate, Culoare)
VALUES ('Copac', 25.6, 'Verde')
INSERT INTO Recuzita (Denumire, Greutate, Culoare)
VALUES ('Sanie', 30.9, 'Rosu')
INSERT INTO Recuzita (Denumire, Greutate, Culoare)
VALUES ('Oglinda', 5.7, 'Alb')
INSERT INTO Recuzita (Denumire, Greutate, Culoare)
VALUES ('Masa', 10.6, 'Mov')
INSERT INTO Recuzita (Denumire, Greutate, Culoare)
VALUES ('Ceainic', 1.4, 'Roz')

SELECT * FROM Recuzita

--Inserare spectacole
INSERT INTO Spectacole (Piesa, Regizor, Data, IDSaliOnline)
VALUES ('O scrisoare pierduta', 'Popescu Ion', '2022-05-14 19:30', 2)
INSERT INTO Spectacole (Piesa, Regizor, Data, IDSaliOnline)
VALUES ('Chirita in provintie', 'Anton Mirela', '2021-12-22 20:00', 1)
INSERT INTO Spectacole (Piesa, Regizor, Data, IDSaliOnline)
VALUES ('Ghici cine te suna', 'Andronache Mihai', '2021-11-08 18:30', 1)
INSERT INTO Spectacole (Piesa, Regizor, Data, IDSaliOnline)
VALUES ('Hamlet', 'Anton Mirela', '2021-01-30 19:30', 4)
INSERT INTO Spectacole (Piesa, Regizor, Data, IDSaliOnline)
VALUES ('Romeo si Julieta', 'Popescu Ion', '2022-04-24 20:30', 3)
INSERT INTO Spectacole (Piesa, Regizor, Data, IDSaliOnline)
VALUES ('Casanova', 'Andronache Mihai', '2022-02-11 17:00', 2)
INSERT INTO Spectacole (Piesa, Regizor, Data, IDSaliOnline)
VALUES ('Motanul incaltat', 'Andronache Mihai', '2021-12-12 12:00', 5)
INSERT INTO Spectacole (Piesa, Regizor, Data, IDSaliOnline)
VALUES ('Chirita in balon', 'Pop Ionescu', '2022-04-02 18:00', 6)
INSERT INTO Spectacole (Piesa, Regizor, Data, IDSaliOnline)
VALUES ('Demoni', 'Donat Bogdan', '2022-04-23 20:00', 7)
--
INSERT INTO Spectacole (Piesa, Regizor, Data, IDSaliOnline)
VALUES ('Casanova', 'Andronache Mihai', '2022-02-16 19:00', 2)
INSERT INTO Spectacole (Piesa, Regizor, Data, IDSaliOnline)
VALUES ('Hamlet', 'Anton Mirela', '2021-02-02 17:30', 4)
INSERT INTO Spectacole (Piesa, Regizor, Data, IDSaliOnline)
VALUES ('Chirita in provintie', 'Anton Mirela', '2021-12-23 16:00', 1)

SELECT * FROM Spectacole

--Inserare actoriSpectacole
SELECT * FROM Actori
SELECT * FROM Spectacole
INSERT INTO ActoriSpectacole (IDActori, IDSpectacole)
VALUES (2, 12)
INSERT INTO ActoriSpectacole (IDActori, IDSpectacole)
VALUES (3, 13)
INSERT INTO ActoriSpectacole (IDActori, IDSpectacole)
VALUES (4, 13)
INSERT INTO ActoriSpectacole (IDActori, IDSpectacole)
VALUES (5, 17)
INSERT INTO ActoriSpectacole (IDActori, IDSpectacole)
VALUES (6, 16)
INSERT INTO ActoriSpectacole (IDActori, IDSpectacole)
VALUES (8, 15)
--
INSERT INTO ActoriSpectacole (IDActori, IDSpectacole)
VALUES (9, 12)
INSERT INTO ActoriSpectacole (IDActori, IDSpectacole)
VALUES (10, 12)
INSERT INTO ActoriSpectacole (IDActori, IDSpectacole)
VALUES (11, 12)
INSERT INTO ActoriSpectacole (IDActori, IDSpectacole)
VALUES (12, 12)
INSERT INTO ActoriSpectacole (IDActori, IDSpectacole)
VALUES (13, 12)
--
INSERT INTO ActoriSpectacole (IDActori, IDSpectacole)
VALUES (11, 16)
INSERT INTO ActoriSpectacole (IDActori, IDSpectacole)
VALUES (10, 16)
INSERT INTO ActoriSpectacole (IDActori, IDSpectacole)
VALUES (9, 16)
INSERT INTO ActoriSpectacole (IDActori, IDSpectacole)
VALUES (8, 16)
INSERT INTO ActoriSpectacole (IDActori, IDSpectacole)
VALUES (7, 16)
--
INSERT INTO ActoriSpectacole (IDActori, IDSpectacole)
VALUES (3, 23)
INSERT INTO ActoriSpectacole (IDActori, IDSpectacole)
VALUES (4, 23)
INSERT INTO ActoriSpectacole (IDActori, IDSpectacole)
VALUES (8, 22)
INSERT INTO ActoriSpectacole (IDActori, IDSpectacole)
VALUES (5, 21)
--
INSERT INTO ActoriSpectacole (IDActori, IDSpectacole)
VALUES (20, 19)
INSERT INTO ActoriSpectacole (IDActori, IDSpectacole)
VALUES (21, 23)



SELECT * FROM ActoriSpectacole


--Inserare spectacoleRecuzita
SELECT * FROM Spectacole
SELECT * FROM Recuzita
INSERT INTO SpectacoleRecuzita (IDSpectacole, IDRecuzita)
VALUES (14, 2)
INSERT INTO SpectacoleRecuzita (IDSpectacole, IDRecuzita)
VALUES (15, 2)
INSERT INTO SpectacoleRecuzita (IDSpectacole, IDRecuzita)
VALUES (17, 1)
INSERT INTO SpectacoleRecuzita (IDSpectacole, IDRecuzita)
VALUES (13, 4)
INSERT INTO SpectacoleRecuzita (IDSpectacole, IDRecuzita)
VALUES (15, 1)
INSERT INTO SpectacoleRecuzita (IDSpectacole, IDRecuzita)
VALUES (16, 5)
--
INSERT INTO SpectacoleRecuzita (IDSpectacole, IDRecuzita)
VALUES (22, 2)
INSERT INTO SpectacoleRecuzita (IDSpectacole, IDRecuzita)
VALUES (21, 1)
INSERT INTO SpectacoleRecuzita (IDSpectacole, IDRecuzita)
VALUES (23, 4)
INSERT INTO SpectacoleRecuzita (IDSpectacole, IDRecuzita)
VALUES (22, 1)
--
INSERT INTO SpectacoleRecuzita (IDSpectacole, IDRecuzita)
VALUES (20, 3)
INSERT INTO SpectacoleRecuzita (IDSpectacole, IDRecuzita)
VALUES (12, 3)
INSERT INTO SpectacoleRecuzita (IDSpectacole, IDRecuzita)
VALUES (18, 4)


SELECT * FROM SpectacoleRecuzita

--Inserare bilete
INSERT INTO Bilete (Pret, IDSpectacole)
VALUES (12.5, 15)
INSERT INTO Bilete (Pret, IDSpectacole)
VALUES (20, 14)
INSERT INTO Bilete (Pret, IDSpectacole)
VALUES (20, 14)
INSERT INTO Bilete (Pret, IDSpectacole)
VALUES (90, 17)
INSERT INTO Bilete (Pret, IDSpectacole)
VALUES (90, 17)
INSERT INTO Bilete (Pret, IDSpectacole)
VALUES (30, 16)
INSERT INTO Bilete (Pret, IDSpectacole)
VALUES (40, 18)
INSERT INTO Bilete (Pret, IDSpectacole)
VALUES (40, 18)
INSERT INTO Bilete (Pret, IDSpectacole)
VALUES (100, 20)
INSERT INTO Bilete (Pret, IDSpectacole)
VALUES (100, 20)
INSERT INTO Bilete (Pret, IDSpectacole)
VALUES (100, 20)
INSERT INTO Bilete (Pret, IDSpectacole)
VALUES (50, 19)

SELECT * FROM Bilete