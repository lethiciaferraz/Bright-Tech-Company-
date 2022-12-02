var express = require("express");
var router = express.Router();

var medidaController = require("../controllers/medidaController");

router.post("/ultimas/:id", function (req, res) {
    medidaController.buscarUltimasMedidas(req, res);
});

router.get("/tempo-real/:idAquario", function (req, res) {
    medidaController.buscarMedidasEmTempoReal(req, res);
});

router.get("/setores/:idEmpresa/:idSetor", function (req, res) {
    medidaController.graficoSetor(req, res);
});

module.exports = router;