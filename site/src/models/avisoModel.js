var database = require("../database/config");

function listarPorEmpresa(idEmpresa) {
  console.log(
    "ACESSEI O AVISOS MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function listarPorEmpresa()"
  );
  var instrucao = `
  select avisos.*,usuario.nome,empresa.idEmpresa from avisos join 
  usuario on avisos.fkUsuario = usuario.idUsuario join empresa on usuario.fkEmpresa = empresa.idEmpresa where idEmpresa = ${idEmpresa};
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
