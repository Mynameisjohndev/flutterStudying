import 'dart:math';

import 'package:flutter/material.dart';
import 'package:head_or_crown/resultGame.dart';

class Game extends StatefulWidget {
  const Game({super.key});

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  String teste = "";

  void _showResult() {
    var options = ["cara", "coroa"];
    var random = Random().nextInt(options.length);
    var result = options[random];
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Result(value: result)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.green,
        // backgroundColor: Color.fromRGBO(255, 204, 128, 0),
        backgroundColor: Color(0xff61bd86),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              // color: Colors.blue,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Image.asset("images/logo.png"),
                  GestureDetector(
                    onTap: _showResult,
                    child: Image.asset("images/botao_jogar.png"),
                  ),
                  Text(this.teste),
                ],
              ),
            ),
          ),
        ));
  }
}
