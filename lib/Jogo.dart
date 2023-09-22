import 'package:flutter/material.dart';
import 'dart:math';

class Jogo extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Jogo> {

  var _imagemApp = AssetImage("images/padrao.png");
  var _mensagem = "Escolha uma opção abaixo";

  void _opcaoSelecionada(String escolhaUsuario){
      var opcoes = ["pedra", "papel", "tesoura"];
      var num = Random().nextInt(3);
      var escolhaApp = opcoes[num];

      //mostrando as imagens de acordo com o Random:
      
      switch(escolhaApp){
        case "pedra":
          setState(() {
            this._imagemApp = AssetImage("images/pedra.png");
          });
          break;
        case "papel":
          setState(() {
            this._imagemApp = AssetImage("images/papel.png");
          });
          break;
        case "tesoura":
          setState(() {
            this._imagemApp = AssetImage("images/tesoura.png");
          });
          break;
      }

      //validando o ganhador
      if((escolhaUsuario == "pedra" && escolhaApp == "tesoura") ||
          (escolhaUsuario == "tesoura" && escolhaApp == "papel") ||
          (escolhaUsuario == "papel" && escolhaApp == "pedra")
      ){
          setState(() {
            this._mensagem = "Parabéns! Você ganhou :D !";
          });
      }else if(
          (escolhaApp == "pedra" && escolhaUsuario == "tesoura") ||
          (escolhaApp == "tesoura" && escolhaUsuario == "papel") ||
          (escolhaApp == "papel" && escolhaUsuario == "pedra")
      ){
        setState(() {
          this._mensagem = "Poxa, você perdeu :(";
        });
      }else{
        setState(() {
          this._mensagem = "Empatamos!";
        });
      }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Colors.cyan,
        title: Text("JokenPo"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
              padding: EdgeInsets.only(top: 30, bottom: 16),
              child: Text(
                "Escolha do app",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
            ),
          ),
          Image(image: this._imagemApp,),
          Padding(
            padding: EdgeInsets.only(top: 20, bottom: 16),
            child: Text(
              this._mensagem,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: () => _opcaoSelecionada("pedra"),
                child: Image.asset(
                  "images/pedra.png",
                  height: 100,
                ),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("papel"),
                child: Image.asset(
                  "images/papel.png",
                  height: 100,
                ),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("tesoura"),
                child: Image.asset(
                  "images/tesoura.png",
                  height: 100,
                ),
              ),
              /*Image.asset(
                "images/pedra.png",
                height: 100,
              ),
              Image.asset(
                  "images/papel.png",
                height: 100,
              ),
              Image.asset(
                  "images/tesoura.png",
                height: 100,
              )*/
            ],
          )
        ],
      ),
    );
  }
}
