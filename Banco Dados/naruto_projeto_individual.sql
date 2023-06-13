CREATE DATABASE naruto_projeto_individual;


USE naruto_projeto_individual;


CREATE TABLE Personagem(
idPersonagem INT PRIMARY KEY AUTO_INCREMENT,
nomePersonagem VARCHAR(45)
);

INSERT INTO Personagem VALUES
(NULL,'Uzumaki Naruto'),
(NULL,'Uchiha Sasuke'),
(NULL,'Hatake Kakashi'),
(NULL,'Uchiha Itachi'),
(NULL,'Gaara Deserto'),
(NULL,'Neji Hyugaa'),
(NULL,'Jiraya Sama'),
(NULL,'Rock Lee');

CREATE TABLE Usuario (
	idUsuario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    senha VARCHAR(100) NOT NULL,
   fkpersonagem INT ,
   FOREIGN KEY (fkpersonagem) REFERENCES Personagem (idPersonagem)
);


CREATE TABLE Pontuacao (
	idPontuacao INT PRIMARY KEY AUTO_INCREMENT,
    fkUsuario INT, 
    FOREIGN KEY (fkUsuario) REFERENCES usuario(idUsuario),
	pontuacao INT,
    percentualPontuacao FLOAT
);



SELECT * FROM Usuario;
SELECT * FROM Personagem;
SELECT * FROM  Pontuacao;



-- média do quiz de todo usuarios
SELECT nome, pontuacao,  percentualPontuacao FROM Pontuacao JOIN usuario ON fkUsuario = idUsuario ORDER BY  pontuacao  DESC;

-- QUANTIDADE DE USUARIOS QUE LOGARAM
 SELECT COUNT(idusuario) AS qtdUsu FROM usuario;
 
 
-- PERSONAGEM EXCLUSIVAMENTE MAIS VOTADO
 SELECT COUNT(Usuario.fkPersonagem) as voto, Personagem.* FROM Usuario JOIN Personagem ON  personagem.idPersonagem = usuario.fkPersonagem GROUP BY usuario.fkPersonagem ORDER BY voto DESC LIMIT 1;


-- SELECT (DASHBOARD) PEGAR PERSONAGEM FAVORITOS DE CADA USUARIO
SELECT COUNT(Usuario.fkPersonagem) as voto, Personagem.nomePersonagem AS personagem 
FROM Usuario JOIN Personagem ON  personagem.idPersonagem = usuario.fkPersonagem group by usuario.fkPersonagem;

-- LISTAR PONTOS, WHEN define a condição que deverá ser testada pelo comando,
-- já  a expressão THEN indica o resultado que será obtido caso a condição seja cumprida. Caso nenhuma condição seja atendida, então o resultado será aquele indicado pela cláusula ELSE.
SELECT
usuario.nome ,
Pontuacao.pontuacao,
Pontuacao.percentualPontuacao ,
 CASE
 WHEN percentualPontuacao = 100 THEN 'Excelente'
  WHEN percentualPontuacao = 87.5 THEN 'Otímo'
 WHEN percentualPontuacao =75 THEN 'Foi bem'
  WHEN percentualPontuacao =62.5 THEN 'Foi ok'
 WHEN percentualPontuacao =50 THEN 'Mediano'
  WHEN percentualPontuacao =37.5 THEN 'Foi mal'
WHEN percentualPontuacao =25 THEN 'Péssimo'
WHEN percentualPontuacao =12.5 THEN 'Horrível'
WHEN percentualPontuacao =0 THEN 'Cabeça oca'
 END AS avaliacao
 FROM Pontuacao
 join usuario ON fkUsuario = id Usuario ORDER BY  percentualPontuacao  DESC;