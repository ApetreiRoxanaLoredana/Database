INSERT INTO Spectacole (Piesa, Regizor, Data, IDSaliOnline) 
VALUES ('O scrisoare pierduta', 'Popescu Ion', '2021-12-03 17:00', '2'),
('O scrisoare pierduta', 'Popescu Ion', '2021-12-03 20:00', '2')

INSERT INTO SpectacoleRecuzita(IDSpectacole, IDRecuzita) VALUES
(24, 3), (25, 3)

SELECT * FROM Recuzita
SELECT* FROM Spectacole
