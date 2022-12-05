var database = require("../database/config");

/*function listar() {
  console.log(
    "ACESSEI O AVISOS  MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function listar()"
  );
  var instrucao = `
  SELECT 
    a.idAvisos AS idAvisos,
    a.titulo,
    a.descricao,
    a.fkUsuario,
    a.fkEmpresa
        FROM avisos a
        INNER JOIN usuario u
        ON a.fkUsuario = u.idUsuario;

    `;
  console.log("Executando a instrução SQL: \n" + instrucao);
  return database.executar(instrucao);
}
*/

function listarPorEmpresa(idEmpresa) {
  console.log(
    "ACESSEI O AVISOS MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function listarPorEmpresa()"
  );
  var instrucao = `
        
    select 
    * from 
    avisos join 
    empresa on fkEmpresa = idEmpresa where fkEmpresa = ${idEmpresa}; 
    `;

  console.log("Executando a instrução SQL: \n" + instrucao);
  return database.executar(instrucao);
}

function publicar(titulo, descricao, idUsuario, idEmpresa) {
  console.log(
    "ACESSEI O AVISOS MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function publicar(): ",
    titulo,
    descricao,
    idUsuario,
    idEmpresa
  );
  var instrucao = `
        INSERT INTO avisos (titulo, descricao, fkUsuario, fkEmpresa) VALUES ('${titulo}', '${descricao}', ${idUsuario}, '${idEmpresa}');
    `;
  console.log("Executando a instrução SQL: \n" + instrucao);
  return database.executar(instrucao);
}

function editar(novaDescricao, idAvisos) {
  console.log(
    "ACESSEI O AVISOS MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function editar(): ",
    novaDescricao,
    idAvisos
  );
  var instrucao = `
        UPDATE avisos SET descricao = '${novaDescricao}' WHERE idAvisos = ${idAvisos};
    `;
  console.log("Executando a instrução SQL: \n" + instrucao);
  return database.executar(instrucao);
}

function deletar(idAvisos) {
  console.log(
    "ACESSEI O AVISOS MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function deletar():",
    idAvisos
  );
  var instrucao = `
        DELETE FROM avisos WHERE idAvisos = ${idAvisos};
    `;
  console.log("Executando a instrução SQL: \n" + instrucao);
  return database.executar(instrucao);
}

module.exports = {
 
  listarPorEmpresa,
  publicar,
  editar,
  deletar,
};
