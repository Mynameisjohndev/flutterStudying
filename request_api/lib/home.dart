import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as Api;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  TextEditingController _cepcontroller = TextEditingController();

  String _responseRequest = "";

  _request() async {
    String cepParser = _cepcontroller.text;
    var url = Uri.http("viacep.com.br", "ws/${cepParser}/json/");
    Api.Response response;
    response = await Api.get(url);
    Map<String, dynamic> responseRequest = json.decode(response.body);
    String logradouro = responseRequest["logradouro"];
    String bairro = responseRequest["bairro"];
    String localidade = responseRequest["localidade"];

    setState(() {
      _responseRequest = "Resposta logradouro: " 
      "${logradouro}, Bairro: ${bairro}, Localidade: ${localidade}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      body: Container(
        padding: EdgeInsets.all(40),
        child: Column(children: <Widget>[
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "Digite seu cep, ex: 36860000"
            ),
            style: TextStyle(
              fontSize: 20
            ),
            controller: _cepcontroller,
          ),
          Text(_responseRequest),
          ElevatedButton(onPressed: _request, child: Text("Cique"))
        ]),
      ),
    );
  }
}
