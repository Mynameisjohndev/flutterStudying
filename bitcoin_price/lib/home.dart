import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as Api;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String _bitCoinPrice = "";

   _request() async {
    var url = Uri.http("blockchain.info", "/ticker");
    Api.Response response;
    response = await Api.get(url);
    Map<String, dynamic> responseRequest = json.decode(response.body);
    setState(() {
      _bitCoinPrice = responseRequest["BRL"]["buy"].toString();
    });
    print(responseRequest["BRL"]["buy"].toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(40),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset("image/bitcoin.png"),
              Padding(
                padding: EdgeInsets.only(top: 30, bottom: 30),
                child: Text(
                  'R\$' + ' $_bitCoinPrice',
                  style: TextStyle(
                    fontSize: 35
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(30,15,30,15),
                child: ElevatedButton(
                child: Text(
                  'Atualizar',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20
                  ),
                ),
                onPressed: _request,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange
                ),
              ),
              )
            ]
          ),
        )
      ),
    );
  }
}