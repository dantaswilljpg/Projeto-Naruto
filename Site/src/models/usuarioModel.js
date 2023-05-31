var database = require("../database/config")

function listar() {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function listar()");
    var instrucao = `
        SELECT * FROM usuario;
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

function entrar(email, senha) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function entrar(): ", email, senha)
    var instrucao = `
        SELECT * FROM usuario WHERE email = '${email}' AND senha = '${senha}';
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

// Coloque os mesmos parâmetros aqui. Vá para a var instrucao
function cadastrar(nome, email, senha, fkpersonagem) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function cadastrar():", nome, email, senha, fkpersonagem);

    // Insira exatamente a query do banco aqui, lembrando da nomenclatura exata nos valores
    //  e na ordem de inserção dos dados.
    var instrucao = `
        INSERT INTO usuario (nome, email, senha,fkpersonagem) VALUES ('${nome}', '${email}', '${senha}','${fkpersonagem}');
`;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}


function Pontuacao(idUsuario, pontos, percentual) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n cadastrarPontuacao()", idUsuario, pontos, percentual);

    // Insira exatamente a query do banco aqui, lembrando da nomenclatura exata nos valores
    //  e na ordem de inserção dos dados.  +9*
    console.log(idUsuario);
    var instrucao = `
        INSERT INTO Pontuacao (fkUsuario, pontuacao,  percentualPontuacao) VALUES (${idUsuario}, ${pontos}, ${percentual});
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

function listarPontos() {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function listarPontuacao()");
    var instrucao = `
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
 join usuario ON fkUsuario = idUsuario ORDER BY  percentualPontuacao  DESC;




;
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);


}


function votos() {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function listar()");
    var instrucao = `
    SELECT COUNT(Usuario.fkPersonagem) as voto, Personagem.* FROM Usuario JOIN Personagem ON  personagem.idPersonagem = usuario.fkPersonagem GROUP BY usuario.fkPersonagem ORDER BY voto DESC LIMIT 1;
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}


function  quantidade_usuarios() {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function listar()");
    var instrucao = `
        SELECT COUNT(idusuario) AS qtdUsu FROM usuario;
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}


module.exports = {
    listar,
    entrar,
    cadastrar,
    Pontuacao,
     quantidade_usuarios,
    votos,
    listarPontos
};