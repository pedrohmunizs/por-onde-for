var express = require("express");
var router = express.Router();

var usuarioController = require("../controllers/usuarioController");

router.get("/ultimas", function (req, res) {
    usuarioController.buscarUltimasMedidas(req, res);
});

router.get("/ultimas2", function (req, res) {
    usuarioController.buscarUltimasMedidas2(req, res);
});

router.get("/ultimas3", function (req, res) {
    usuarioController.buscarUltimasMedidas3(req, res);
});

router.get("/ultimas4", function (req, res) {
    usuarioController.buscarUltimasMedidas4(req, res);
});

router.get("/", function (req, res) {
    usuarioController.testar(req, res);
});

router.get("/listar", function (req, res) {
    usuarioController.listar(req, res);
});

//Recebendo os dados do html e direcionando para a função cadastrar de usuarioController.js
router.post("/cadastrar", function (req, res) {
    usuarioController.cadastrar(req, res);
})

router.post("/autenticar", function (req, res) {
    usuarioController.entrar(req, res);
});

module.exports = router;