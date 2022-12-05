var express = require("express");
var router = express.Router();
var medidaController = require("../controllers/medidaController");

/* --------------------------------------------------------------------------------------------------------- */
 
router.get("/setores/:idEmpresa", function (req, res) {
    medidaController.graficoSetor(req, res);
});
 
router.get("/setores2/:idEmpresa", function (req, res) {
    medidaController.graficoSetor2(req, res);
});

/* --------------------------------------------------------------------------------------------------------- */

router.get("/tempo-real/:idEmpresa", function (req, res) {
    medidaController.buscarMedidasEmTempoReal(req, res);
});

router.get("/tempo-real2/:idEmpresa", function (req, res) {
    medidaController.buscarMedidasEmTempoReal2(req, res);
});

module.exports = router;