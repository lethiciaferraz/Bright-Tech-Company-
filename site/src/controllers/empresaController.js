var empresaModel = require("../models/empresaModel");

var sessoes = [];

function testar(req, res) {
  console.log("ENTRAMOS NA empresaController");
  res.json("ESTAMOS FUNCIONANDO!");
}

function listar(req, res) {
  empresaModel
    .listar()
    .then(function (resultado) {
      if (resultado.length > 0) {
        res.status(200).json(resultado);
      } else {
        res.status(204).send("Nenhum resultado encontrado!");
      }
    })
    .catch(function (erro) {
      console.log(erro);
      console.log(
        "Houve um erro ao realizar a consulta! Erro: ",
        erro.sqlMessage
      );
      res.status(500).json(erro.sqlMessage);
    });
}

function entrar(req, res) {
    var email = req.body.emailServer;
    var senha = req.body.senhaServer;

    if (email == undefined) {
        res.status(400).send("Seu email está undefined!");
    } else if (senha == undefined) {
        res.status(400).send("Sua senha está indefinida!");
    } else {
        
        empresaModel.entrar(email, senha)
            .then(
                function (resultado) {
                    console.log(`\nResultados encontrados: ${resultado.length}`);
                    console.log(`Resultados: ${JSON.stringify(resultado)}`); // transforma JSON em String

                    if (resultado.length == 1) {
                        console.log(resultado);
                        res.json(resultado[0]);
                    } else if (resultado.length == 0) {
                        res.status(403).send("Email e/ou senha inválido(s)");
                    } else {
                        res.status(403).send("Mais de um usuário com o mesmo login e senha!");
                    }
                }
            ).catch(
                function (erro) {
                    console.log(erro);
                    console.log("\nHouve um erro ao realizar o login! Erro: ", erro.sqlMessage);
                    res.status(500).json(erro.sqlMessage);
                }
            );
    }

}

function proximo(req, res) {
  // Crie uma variável que vá recuperar os valores do arquivo cadastro.html
  var nome = req.body.nomeServer;
  var cnpj = req.body.cnpjServer;
  var telefone = req.body.telefoneServer;
  var qtd_Funcionario = req.body.qtd_FuncionarioServer;
  var metros_uteis = req.body.metros_uteisServer;
  var dt_contrato = req.body.dt_contratoServer;

  // Faça as validações dos valores
  if (nome == undefined) {
    res.status(400).send("Seu nome está undefined!");
  } else if (cnpj == undefined) {
    res.status(400).send("Seu cnpj está undefined!");
  } else if (telefone == undefined) {
    res.status(400).send("Seu telefone está undefined!");
  } else if (qtd_Funcionario == undefined) {
    res.status(400).send("Seu qtd_Funcionario está undefined!");
  } else if (metros_uteis == undefined) {
    res.status(400).send("Seu metros_uteis está undefined!");
  } else if (dt_contrato == undefined) {
    res.status(400).send("Seu dt_contrato está undefined!");
  } else {
    // Passe os valores como parâmetro e vá para o arquivo usuarioModel.js
    empresaModel
      .proximo(nome, cnpj, telefone, qtd_Funcionario, metros_uteis, dt_contrato)
      .then(function (resultado) {
        console.log("Meu RESULTADO", resultado);
        res.json(resultado);
      })
      .catch(function (erro) {
        console.log(erro);
        console.log(
          "Houve um erro ao realizar o cadastro! Erro: ",
          erro.sqlMessage
        );
        res.status(500).json(erro.sqlMessage);
      });
  }
}

function buscarPorCnpj(req, res){
  var cnpj = req.params.cnpj;

  if(cnpj == undefined){
    res.status(400).send("Seu cnpj está undefiened!")
  }else{
    empresaModel 
    .buscarPorCnpj(cnpj)
    .then (function(resultado){

      console.log(resultado);
      
      if(resultado.length ==1){
        res.status(200).json(resultado[0]);
      } else {
        res.status(204).send("Nenhum resultado encontrado!")
      }
    })
    .catch(function(erro){
      console.log(
        "Houve um erro ao realizar o cadastro! Erro: ",
        erro.sqlMessage
      );
      res.status(500).json(erro.sqlMessage);
    });
  }
}

module.exports = {
  entrar,
  proximo,
  listar,
  testar,
  buscarPorCnpj
};
