var avaliacaoModel = require("../models/avaliacaoModel");
 
function buscarUltimasMedidas(req, res) {

    var idAVALIACAO = req.params.idAVALIACAO;

    console.log(`Recuperando as ultimas medidas`);

    medidaModel.buscarUltimasMedidas(idAVALIACAO).then(function (resultado) {
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado!")
        }
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar as ultimas medidas.", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}


function avaliar(req, res) {
    // Crie uma variável que vá recuperar os valores do arquivo cadastro.html
    var nota = req.body.notaServer;
    var fkusuario = req.body.fkusuario;

    // Faça as validações dos valores
    if (nota == undefined) {
        res.status(400).send(" Nota não definida");
    }else {
        
        // Passe os valores como parâmetro e vá para o arquivo usuarioModel.js
        avaliacaoModel.avaliar(nota, fkusuario)
            .then(
                function (resultado) {
                    res.json(resultado);
                }
            ).catch(
                function (erro) {
                    console.log(erro);
                    console.log(
                        "\nHouve um erro ao realizar o cadastro! Erro: ",
                        erro.sqlMessage
                    );
                    res.status(500).json(erro.sqlMessage);
                }
            );
    }
}


module.exports = {
    buscarUltimasMedidas,
    avaliar
}