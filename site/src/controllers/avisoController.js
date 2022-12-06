var avisoModel = require("../models/avisoModel");

// function testar(req, res) {
//   console.log("ENTRAMOS NO avisoController");
//   res.send("ENTRAMOS NO AVISO CONTROLLER");
// }

function listarPorEmpresa(req, res) {
  var idEmpresa = req.params.idEmpresa;

  avisoModel
    .listarPorEmpresa(idEmpresa)
    .then(function (resultado) {
      if (resultado.length > 0) {
        res.status(200).json(resultado);
      } else {
        res.status(204).send("Nenhum resultado encontrado!");
      }
    })
    .catch(function (erro) {
      console.log(erro);
      console.log("Houve um erro ao buscar os avisos: ", erro.sqlMessage);
      res.status(500).json(erro.sqlMessage);
    });
}

function publicar(req, res) {
  var titulo = req.body.titulo;
  var descricao = req.body.descricao;
  var idUsuario = req.params.idUsuario;
  var idEmpresa = req.params.idEmpresa;

  if (titulo == undefined) {
    res.status(400).send("O título está indefinido!");
  } else if (descricao == undefined) {
    res.status(400).send("A descrição está indefinido!");
  } else if (idUsuario == undefined) {
    res.status(403).send("O id do usuário está indefinido!");
  } else if (idEmpresa == undefined) {
    res.status(403).send("O id do usuário está indefinido!");
  } else {
    avisoModel
      .publicar(titulo, descricao, idUsuario, idEmpresa)
      .then(function (resultado) {
        res.json(resultado);
      })
      .catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao realizar o post: ", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
      });
  }
}

function editar(req, res) {
  var novaDescricao = req.body.descricao;
  var idAvisos = req.params.idAvisos;

  avisoModel
    .editar(novaDescricao, idAvisos)
    .then(function (resultado) {
      res.json(resultado);

      console.log('cheguei editarControllerr')

    })
    .catch(function (erro) {
      console.log(erro);
      console.log("Houve um erro ao realizar o post: ", erro.sqlMessage);
      res.status(500).json(erro.sqlMessage);
    });
}

function deletar(req, res) {
  var idAvisos = req.params.idAvisos;

  avisoModel
    .deletar(idAvisos)
    .then(function (resultado) {
      res.json(resultado);
    })
    .catch(function (erro) {
      console.log(erro);
      console.log("Houve um erro ao deletar o post: ", erro.sqlMessage);
      res.status(500).json(erro.sqlMessage);
    });
}

module.exports = {
  listarPorEmpresa,
  publicar,
  editar,
  deletar,
};
