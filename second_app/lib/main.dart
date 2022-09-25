import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomeStateful(),
  ));
}

class HomeStateful extends StatefulWidget {
  @override
  _HomeStatefulState createState() => _HomeStatefulState();
}

class _HomeStatefulState extends State<HomeStateful> {
  var _frases = [
    "Sou apenas um pequeno planeta que se perde diariamente em todo o seu universo.",
    "Novas amizades serão sempre bem-vindas para darem cor e alegria ao meu dia a dia.",
    "Gratidão não é pagamento, mas um reconhecimento que se demonstra no dia a dia.",
    "Nem toda mudança importante acontece de repente e faz barulho, algumas são silenciosas e vão se fazendo no dia a dia."
  ];

  var newPhrase = "Clique abaixo para gerar uma frase!";

  void generatePhrase() {
    var newP = Random().nextInt(_frases.length);
    setState(() {
      newPhrase = _frases[newP];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Frases do dia"),
          backgroundColor: Colors.green,
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.all(16),
            // width: double.infinity,
            // decoration: BoxDecoration(
            //     border: Border.all(width: 3, color: Colors.amber),
            //     color: Colors.white
            // ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Image.asset(
                  "images/logo.png",
                ),
                Text(
                  newPhrase,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 25,
                    fontStyle: FontStyle.italic,
                    color: Colors.black,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    generatePhrase();
                    // setState(() {
                    //   newPhrase: random.;
                    // });
                  },
                  child: Text("Nova frase"),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                      // foregroundColor: Colors.black,
                      disabledForegroundColor: Colors.transparent),
                ),
              ],
            ),
          ),
        ));
  }
}
