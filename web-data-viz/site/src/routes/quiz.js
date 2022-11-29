var express = require("express");
var router = express.Router();

var quizController = require("../controllers/quizController");

router.post("/pontuacao", function (req, res) {
    quizController.pontuacao(req, res);
})

module.exports = router;