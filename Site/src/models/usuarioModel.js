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
function cadastrar(nome, email, senha,fkpersonagem) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function cadastrar():", nome, email, senha,fkpersonagem);
    
    // Insira exatamente a query do banco aqui, lembrando da nomenclatura exata nos valores
    //  e na ordem de inserção dos dados.
    var instrucao = `
        INSERT INTO usuario (nome, email, senha,fkpersonagem) VALUES ('${nome}', '${email}', '${senha}','${fkpersonagem}');
`;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}


function cadastrarPontuacao(idUsuario, pontos, percentual) {
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

function listarPontuacao() {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function listarPontuacao()");
    var instrucao = `SELECT nome, pontuacao,  percentualPontuacao FROM Pontuacao JOIN usuario ON fkUsuario = idUsuario ORDER BY  percentualPontuacao  DESC;;
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

module.exports = {
    listar,
    entrar,
    cadastrar,
    cadastrarPontuacao,
    listarPontuacao
};