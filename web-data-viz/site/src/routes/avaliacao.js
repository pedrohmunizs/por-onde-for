var express = require("express");
var router = express.Router();

var avaliacaoController = require("../controllers/avaliacaoController");

router.get("/ultimas", function (req, res) {
    avaliacaoController.buscarUltimasMedidas(req, res);
});

router.post("/avaliar", function (req, res) {
    avaliacaoController.avaliar(req, res);
})

module.exports = router;