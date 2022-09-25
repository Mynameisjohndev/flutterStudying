import 'package:flutter/material.dart';

class MyGame extends StatefulWidget {
  const MyGame({super.key});

  @override
  State<MyGame> createState() => _MyGameState();
}

class _MyGameState extends State<MyGame> {
  var playerOption = "";
  var smartphoneOption = "";

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
          GestureDetector(
            child: Image.asset("images/padrao.png"),
            onTap: () {},
          ),
          const Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              'Escolha uma opção abaixo',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                child: Image.asset("images/pedra.png", height: 100),
                onTap: () {},
              ),
              GestureDetector(
                child: Image.asset("images/papel.png", height: 100),
                onTap: () {},
              ),
              GestureDetector(
                child: Image.asset("images/tesoura.png", height: 100),
                onTap: () {},
              ),
            ],
          ),
          MyWidget("Texto pra")
        ]
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget(@required this.texto);

  final String texto;

  @override
  Widget build(BuildContext context) {
    return Text(texto);
  }
}