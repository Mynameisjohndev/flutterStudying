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
  var _texto = "Jamilton Damasceno";

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
                  "Nome: $_texto ",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontSize: 25,
                      fontStyle: FontStyle.italic,
                      color: Colors.black,
                      ),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _texto = "Curso Flutter";
                    });
                  },
                  child: Text("Clique aqui"),
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
