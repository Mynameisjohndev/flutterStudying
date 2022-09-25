import 'dart:math';
import 'package:flutter/material.dart';

class MyGame extends StatefulWidget {
  const MyGame({super.key});

  @override
  State<MyGame> createState() => _MyGameState();
}

class _MyGameState extends State<MyGame> {
  var _appImage = const AssetImage("images/padrao.png");
  var _message = "Escolha uma opção abaixo";

  void selectOtion(String option) {
    var options = ["pedra", "papel", "tesoura"];
    var randomOption = Random().nextInt(3);
    var selectedRandonOption = options[randomOption];

    setState(() {
      _appImage = AssetImage("images/$selectedRandonOption.png");
    });

    switch (selectedRandonOption) {
      case "pedra":
        setState(() {
          _appImage = AssetImage("images/$selectedRandonOption.png");
        });
        break;
      case "papel":
        setState(() {
          _appImage = AssetImage("images/$selectedRandonOption.png");
        });
        break;
      case "tesoura":
        setState(() {
          _appImage = AssetImage("images/$selectedRandonOption.png");
        });
        break;
    }
    if ((option == "pedra" && selectedRandonOption == "tesoura") ||
        (option == "tesoura" && selectedRandonOption == "papel") ||
        (option == "papel" && selectedRandonOption == "pedra")) {
      setState(() {
        _message = "Parabéns!!! Você ganhou :)";
      });
      //App Ganhador
    } else if ((selectedRandonOption == "pedra" && option == "tesoura") ||
        (selectedRandonOption == "tesoura" && option == "papel") ||
        (selectedRandonOption == "papel" && option == "pedra")) {
      setState(() {
        _message = "Você perdeu :(";
      });
    } else {
      setState(() {
        _message = "Empatamos ;)";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Joken  Po'),
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(top: 32, bottom: 16),
              child: Text(
                'Escolha do app',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Image(image: _appImage),
            Padding(
              padding: EdgeInsets.only(top: 32, bottom: 16),
              child: Text(
                this._message,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: () => selectOtion("pedra"),
                  child: Image.asset("images/pedra.png", height: 100),
                ),
                GestureDetector(
                  onTap: () => selectOtion("papel"),
                  child: Image.asset("images/papel.png", height: 100),
                ),
                GestureDetector(
                  onTap: () => selectOtion("tesoura"),
                  child: Image.asset("images/tesoura.png", height: 100),
                ),
              ],
            ),
          ]),
    );
  }
}
