var express = require("express");
var router = express.Router();

var quizController = require("../controllers/quizController");

router.get("/ultimas", function (req, res) {
    quizController.buscarUltimasMedidas2(req, res);
});

router.post("/pontuacao", function (req, res) {
    quizController.pontuacao(req, res);
})

module.exports = router;