import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _alcohol = TextEditingController();
  TextEditingController _gas = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Álcool ou gásolina"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
          
          child: SingleChildScrollView(
            padding: EdgeInsets.all(32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 32),
                  child: Image.asset("images/logo.png"),
                ),
                Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text(
                        "Saiba qual a melhor opção de abastecimento para seu carro",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold))),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration:
                      InputDecoration(labelText: 'Preço Álcool, ex: 1.67'),
                  controller: _alcohol,
                  style: TextStyle(fontSize: 18),
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration:
                      InputDecoration(labelText: 'Preço Gasolina, ex: 3.67'),
                  controller: _gas,
                  style: TextStyle(fontSize: 18),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    child: Text(
                      "Calcular",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    onPressed: () {},
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    "Resultado",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
