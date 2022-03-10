CREATE DATABASE TeatruOnline;  
GO
USE TeatruOnline;
/*
Nu ii place daca executi deodata cele doua comenzi
Daca le executi separat pe rand e ok
Daca vrei sa le executi impreuna deodata trebuie sa fie GO intre ele
*/

CREATE TABLE Adrese(
IDAdrese INT PRIMARY KEY IDENTITY,
Judet VARCHAR(50),
Localitate VARCHAR(50),
Strada VARCHAR(50),
Numar INT,
Bloc VARCHAR(50),
Scara VARCHAR(50),
Apartament INT,
);

CREATE TABLE Grupe(
IDGrupe INT PRIMARY KEY IDENTITY,
NumarActori INT DEFAULT 0 CHECK (NumarActori >= 0)
);

CREATE TABLE Coordonatori(
IDCoordonatori INT FOREIGN KEY REFERENCES Grupe(IDGrupe),
Nume VARCHAR(50),
Prenume VARCHAR(50),
Varsta INT CHECK (Varsta > 18 AND Varsta < 70),
CONSTRAINT pk_Coordonatori PRIMARY KEY(IDCoordonatori)
);

CREATE TABLE Actori(
IDActori INT PRIMARY KEY IDENTITY, --IDENTITY genereaza automat o valoare
Nume VARCHAR(50) NOT NULL,
Prenume VARCHAR(50) NOT NULL,
Varsta INT NOT NULL CHECK (Varsta > 16 AND Varsta < 60),
Experienta INT,
IDGrupe INT FOREIGN KEY REFERENCES Grupe(IDGrupe),
IDAdrese INT FOREIGN KEY REFERENCES Adrese(IDAdrese)
);

CREATE TABLE SaliOnline(
IDSaliOnline INT PRIMARY KEY IDENTITY,
Platforma VARCHAR(50) DEFAULT 'Zoom',
Cod VARCHAR(50) NOT NULL,
Parola VARCHAR(50) NOT NULL,
NumarLocuri INT DEFAULT 0,
);

CREATE TABLE Spectacole(
IDSpectacole INT PRIMARY KEY IDENTITY,
Piesa VARCHAR(50) NOT NULL,
Regizor VARCHAR(50) NOT NULL,
Data DATETIME,
IDSaliOnline INT FOREIGN KEY REFERENCES SaliOnline(IDSaliOnline)
);

CREATE TABLE ActoriSpectacole(
IDActori INT FOREIGN KEY REFERENCES Actori(IDActori),
IDSpectacole INT FOREIGN KEY REFERENCES Spectacole(IDSpectacole),
CONSTRAINT pk_ActoriSpectacole PRIMARY KEY (IDActori, IDSpectacole)
);

CREATE TABLE Bilete(
IDBilete INT PRIMARY KEY IDENTITY,
Pret FLOAT CHECK (Pret > 0),
IDSpectacole INT FOREIGN KEY REFERENCES Spectacole(IDSpectacole)
);

CREATE TABLE Recuzita(
IDRecuzita INT PRIMARY KEY IDENTITY,
Denumire VARCHAR(50),
Greutate FLOAT,
Culoare VARCHAR(50)
);

CREATE TABLE SpectacoleRecuzita(
IDSpectacole INT FOREIGN KEY REFERENCES Spectacole(IDSpectacole),
IDRecuzita INT FOREIGN KEY REFERENCES Recuzita(IDRecuzita),
CONSTRAINT pk_SpectacoleRecuzita PRIMARY KEY (IDSpectacole, IDRecuzita)
);

