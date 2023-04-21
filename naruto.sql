 -- DROP DATABASE naruto;
CREATE DATABASE naruto;
USE naruto;

CREATE TABLE usuario (
	idUsuario INT PRIMARY KEY AUTO_INCREMENT,
    nomeUsuario VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    senha VARCHAR(100) NOT NULL
);

CREATE TABLE pontuacao (
	idPontuacao INT PRIMARY KEY AUTO_INCREMENT,
    fkUsuario INT, 
    FOREIGN KEY (fkUsuario) REFERENCES usuario(idUsuario),
	pontuacao INT,
    perPont FLOAT
);

CREATE TABLE Quiz(
idQuiz INT PRIMARY KEY AUTO_INCREMENT,
fkUsuario INT,
FOREIGN KEY (fkUsuario) REFERENCES usuario(idUsuario)
);

CREATE TABLE Resposta(
idResposta INT PRIMARY KEY AUTO_INCREMENT,
nomeRespostas FLOAT,
fkQuiz INT,
FOREIGN KEY(fkQuiz) REFERENCES Resposta (idResposta)
);



select * from Usuario;
SELECT * FROM  Pontuacao;
SELECT * FROM Quiz;
SELECT * FROM Resposta;