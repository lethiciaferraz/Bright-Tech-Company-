var express = require("express");
var router = express.Router();

var empresaController = require("../controllers/empresaController");

router.get("/", function (req, res) {
    empresaController.testar(req, res);
});

router.get("/listar", function (req, res) {
    empresaController.listar(req, res);
});

//Recebendo os dados do html e direcionando para a função cadastrar de usuarioController.js
router.post("/proximo", function (req, res) {
    empresaController.proximo(req, res);
})

router.post("/autenticar", function (req, res) {
    empresaController.entrar(req, res);
});

router.get("/buscar-por-cnpj/:cnpj", function (req, res) {
    empresaController.buscarPorCnpj(req, res);
});
module.exports = router;