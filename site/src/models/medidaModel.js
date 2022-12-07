var database = require("../database/config");

function graficoSetor(idEmpresa) {
    instrucaoSql = ''
 
    if (process.env.AMBIENTE_PROCESSO == "producao") {
        instrucaoSql = `
        select top 16 count(captura.chave) as media, momento as dtRegistro from setor join sensor on setor.idsetor = sensor.fkSetor
                                                        left join captura on sensor.idsensor = captura.fkSensor
                                                        where fkEmpresa = ${idEmpresa}
                                                        group by (momento) order by momento desc;
        `;
    } else if (process.env.AMBIENTE_PROCESSO == "desenvolvimento") { 
        instrucaoSql = `
        select count(captura.chave) as media, captura.momento as dtRegistro from setor join sensor on setor.idsetor = sensor.fkSetor
                                                        left join captura on sensor.idsensor = captura.fkSensor
                                                        where fkEmpresa = ${idEmpresa}
                                                        group by day(captura.momento) order by captura.momento desc limit 16;
        `;
    } else {
        console.log("\nO AMBIENTE (produção OU desenvolvimento) NÃO FOI DEFINIDO EM app.js\n");
        return
    }

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

/* --------------------------------------------------------------------------------------------------------- */

function graficoSetor2(idEmpresa) {
    instrucaoSql = ''

    if (process.env.AMBIENTE_PROCESSO == "producao") {
        instrucaoSql = `
        select top 5 count(captura.chave) as media, momento as dtRegistro from setor join sensor on setor.idsetor = sensor.fkSetor
                                                        left join captura on sensor.idsensor = captura.fkSensor
                                                        where fkEmpresa = ${idEmpresa}
                                                        group by (momento) order by momento desc;
        `;
    } else if (process.env.AMBIENTE_PROCESSO == "desenvolvimento") {
        instrucaoSql = `
    select count(captura.chave) as media, captura.momento as dtRegistro from setor join sensor on setor.idsetor = sensor.fkSetor
														left join captura on sensor.idsensor = captura.fkSensor
                                                        where fkEmpresa = ${idEmpresa} and (select avg(captura.chave))
                                                        group by day(captura.momento) order by captura.momento desc limit 5;
        `;
    } else {
        console.log("\nO AMBIENTE (produção OU desenvolvimento) NÃO FOI DEFINIDO EM app.js\n");
        return
    }

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

/* --------------------------------------------------------------------------------------------------------- */

function buscarMedidasEmTempoReal(idEmpresa) {

    instrucaoSql = ''

    if (process.env.AMBIENTE_PROCESSO == "producao") {
        instrucaoSql = `
										
	select top 1 captura.momento as momento from captura join sensor on sensor.idSensor= captura.fkSensor join setor on setor.idSetor = sensor.fkSetor where fkEmpresa = ${idEmpresa} group by(captura.momento) order by captura.momento desc;
        `;

    } else if (process.env.AMBIENTE_PROCESSO == "desenvolvimento") {
        instrucaoSql = `
        select count(captura.chave) as media, captura.momento as dtRegistro from setor join sensor on setor.idsetor = sensor.fkSetor
                                                        left join captura on sensor.idsensor = captura.fkSensor
                                                        where fkEmpresa = ${idEmpresa}
                                                        group by day(captura.momento) order by captura.momento desc limit 1;
        `;
    } else {
        console.log("\nO AMBIENTE (produção OU desenvolvimento) NÃO FOI DEFINIDO EM app.js\n");
        return
    }

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

/* --------------------------------------------------------------------------------------------------------- */

function buscarMedidasEmTempoReal2(idEmpresa) {

    instrucaoSql = ''

    if (process.env.AMBIENTE_PROCESSO == "producao") {
        instrucaoSql = `
        select top 1 count(captura.chave) as media, captura.momento as momento from captura join sensor on sensor.idSensor= captura.fkSensor join setor on setor.idSetor = sensor.fkSetor where fkEmpresa = ${idEmpresa} group by(captura.momento) order by captura.momento desc;
        `;

    } else if (process.env.AMBIENTE_PROCESSO == "desenvolvimento") {
        instrucaoSql = `
    select count(captura.chave) as media, captura.momento as dtRegistro from setor join sensor on setor.idsetor = sensor.fkSetor
														left join captura on sensor.idsensor = captura.fkSensor
                                                        where fkEmpresa = ${idEmpresa} and (select avg(captura.chave))
                                                        group by day(captura.momento) order by captura.momento desc limit 1;
        `;
    } else {
        console.log("\nO AMBIENTE (produção OU desenvolvimento) NÃO FOI DEFINIDO EM app.js\n");
        return
    }

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}
module.exports = {
    graficoSetor,
    graficoSetor2,
    buscarMedidasEmTempoReal,
    buscarMedidasEmTempoReal2
}
