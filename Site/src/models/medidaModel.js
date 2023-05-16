var database = require("../database/config");

function buscarUltimasMedidas(idAquario, limite_linhas) {

    instrucaoSql = ''

    if (process.env.AMBIENTE_PROCESSO == "producao") {
        instrucaoSql = `SELECT COUNT(Usuario.fkPersonagem) as voto, Personagem.nomePersonagem AS personagem 
        FR OM Usuario JOIN Personagem ON  personagem.idPersonagem = usuario.fkPersonagem group by usuario.fkPersonagem;`;
    } else if (process.env.AMBIENTE_PROCESSO == "desenvolvimento") {
        instrucaoSql = `SELECT COUNT(Usuario.fkPersonagem) as voto, Personagem.nomePersonagem AS personagem 
        FROM Usuario JOIN Personagem ON  personagem.idPersonagem = usuario.fkPersonagem group by usuario.fkPersonagem;`;

    } else {
        console.log("\nO AMBIENTE (produção OU desenvolvimento) NÃO FOI DEFINIDO EM app.js\n");
        return
    }

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function buscarMedidasEmTempoReal(idAquario) {

    instrucaoSql = ''

    if (process.env.AMBIENTE_PROCESSO == "producao") {
        instrucaoSql = `
        SELECT round(AVG(pontuacao.percentualPontuacao) , 2) AS 'Média do quiz' FROM Pontuacao;`;

    } else if (process.env.AMBIENTE_PROCESSO == "desenvolvimento") {
        instrucaoSql = ` SELECT round(AVG(pontuacao.percentualPontuacao) , 2) AS 'Média do quiz' FROM Pontuacao;`;
    } else {
        console.log("\nO AMBIENTE (produção OU desenvolvimento) NÃO FOI DEFINIDO EM app.js\n");
        return
    }

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}


module.exports = {
    buscarUltimasMedidas,
    buscarMedidasEmTempoReal
}
