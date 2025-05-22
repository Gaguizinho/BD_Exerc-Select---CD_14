-- Criar o banco de dados
CREATE DATABASE colecao_cds;
USE colecao_cds;

-- Tabela de CDs
CREATE TABLE Cds (
    Codigo INT PRIMARY KEY AUTO_INCREMENT,
    Nome_cd VARCHAR(100) NOT NULL,
    DataCompra DATE,
    ValorPago DECIMAL(10,2),
    LocalCompra VARCHAR(50),
    Album ENUM('Sim', 'Não') DEFAULT 'Não'
);

-- Tabela de Músicas
CREATE TABLE Musicas (
    CodigoCD INT,
    Numero_musica INT,
    Nome_musica VARCHAR(100) NOT NULL,
    Artista VARCHAR(100) NOT NULL,
    Tempo TIME,
    PRIMARY KEY (CodigoCD, Numero_musica),
    FOREIGN KEY (CodigoCD) REFERENCES Cds(Codigo)
);

-- Inserir CDs
INSERT INTO Cds (Nome_cd, DataCompra, ValorPago, LocalCompra, Album) VALUES
('The Queen Is Dead', '2023-01-15', 59.90, 'Submarino', 'Sim'),
('Meat Is Murder', '2023-02-20', 49.90, 'Americanas', 'Sim'),
('Strangeways, Here We Come', '2023-03-10', 54.90, 'Submarino', 'Sim'),
('Loucuras do José Pedro', '2023-04-05', 29.90, 'Lojas Brasileiras', 'Não'),
('The Sound of The Smiths', '2023-05-12', 69.90, 'Amazon', 'Sim');

-- Inserir músicas para o CD 1
INSERT INTO Musicas VALUES
(1, 1, 'The Queen Is Dead', 'The Smiths', '0:6:24'),
(1, 2, 'Frankly, Mr. Shankly', 'The Smiths', '0:2:18'),
(1, 3, 'I Know It''s Over', 'The Smiths', '0:5:48'),
(1, 4, 'Never Had No One Ever', 'The Smiths', '0:3:36'),
(1, 5, 'Cemetry Gates', 'The Smiths', '0:2:39');

-- Inserir músicas para o CD 2
INSERT INTO Musicas VALUES
(2, 1, 'The Headmaster Ritual', 'The Smiths', '0:4:52'),
(2, 2, 'Rusholme Ruffians', 'The Smiths', '0:4:20'),
(2, 3, 'I Want the One I Can''t Have', 'The Smiths', '0:3:14'),
(2, 4, 'What She Said', 'The Smiths', '0:2:42'),
(2, 5, 'That Joke Isn''t Funny Anymore', 'The Smiths', '0:4:59');

-- Inserir músicas para o CD 3
INSERT INTO Musicas VALUES
(3, 1, 'A Rush and a Push and the Land Is Ours', 'The Smiths', '0:3:00'),
(3, 2, 'I Started Something I Couldn''t Finish', 'The Smiths', '0:3:47'),
(3, 3, 'Death of a Disco Dancer', 'The Smiths', '0:5:26'),
(3, 4, 'Girlfriend in a Coma', 'The Smiths', '0:2:03'),
(3, 5, 'Stop Me If You Think You''ve Heard This One Before', 'The Smiths', '0:3:34');

-- Inserir músicas para o CD 4
INSERT INTO Musicas VALUES
(4, 1, 'Saudades do Interior', 'José Pedro', '0:3:45'),
(4, 2, 'Cavalo Manco', 'José Pedro', '0:4:12'),
(4, 3, 'Festa na Roça', 'José Pedro', '0:2:58');

-- Inserir músicas para o CD 5
INSERT INTO Musicas VALUES
(5, 1, 'How Soon Is Now?', 'The Smiths', '0:6:46'),
(5, 2, 'This Charming Man', 'The Smiths', '0:2:42'),
(5, 3, 'There Is a Light That Never Goes Out', 'The Smiths', '0:4:04');


-- 1. 
SELECT * FROM Cds;

-- 2. 
SELECT Nome_cd, DataCompra FROM Cds ORDER BY Nome_cd;

-- 3. 
SELECT Nome_cd, DataCompra FROM Cds ORDER BY DataCompra DESC;

-- 4. 
SELECT Nome_cd, DataCompra, ValorPago FROM Cds ORDER BY ValorPago DESC;

-- 5. 
SELECT SUM(ValorPago) AS TotalGasto FROM Cds;

-- 6. 
SELECT * FROM Musicas WHERE CodigoCD = 1;

-- 7. 
SELECT Nome_musica, Artista FROM Musicas;

-- 8. 
SELECT Numero_musica, Nome_musica, Tempo 
FROM Musicas 
WHERE CodigoCD = 5 
ORDER BY Numero_musica;

-- 9. 
SELECT COUNT(*) AS TotalMusicas FROM Musicas;

-- 10.
SELECT Nome_musica FROM Musicas WHERE Artista = 'José Pedro';

-- 11.
SELECT Nome_cd FROM Cds WHERE LocalCompra = 'Submarino';

-- 12.
SELECT * FROM Musicas ORDER BY Nome_musica;

-- 13.
SELECT * FROM Cds WHERE Album = 'Sim';

-- 14.
SELECT AVG(ValorPago) AS MediaPrecos FROM Cds;

