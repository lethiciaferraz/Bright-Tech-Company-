var express = require("express");
var router = express.Router();

var avisoController = require("../controllers/avisoController");

// router.get("/", function (req, res) {
//   avisoController.testar(req, res);
// });

router.get("/listar/:idEmpresa", function (req, res) {
  avisoController.listarPorEmpresa(req, res);
});

router.post("/publicar/:idUsuario/:idEmpresa", function (req, res) {
  avisoController.publicar(req, res);
});

router.put("/editar/:idAvisos", function (req, res) {
  avisoController.editar(req, res);
});

router.delete("/deletar/:idAvisos", function (req, res) {
  avisoController.deletar(req, res);
});

module.exports = router;
