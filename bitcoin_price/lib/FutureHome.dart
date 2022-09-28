import 'package:flutter/material.dart';
import 'package:http/http.dart' as Api;
import 'dart:convert';

class FutureHome extends StatefulWidget {
  const FutureHome({super.key});

  @override
  State<FutureHome> createState() => _FutureHomeState();
}

class _FutureHomeState extends State<FutureHome> {
  Future<Map> _request() async {
    var url = Uri.http("blockchain.info", "/ticker");
    Api.Response response;
    response = await Api.get(url);
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map>(
      future: _request(),
      builder: (context, snapshot){
        String result = "";
        switch(snapshot.connectionState){
            case ConnectionState.waiting: 
            result = "waiting";
            print("waiting");
            break;
          case ConnectionState.done:
            if(snapshot.hasError){
              result = "Erro ao carregar os dados";
            }else{
              double value = snapshot.data!["BRL"]["buy"];
              result = "Preço do bitcoin: ${value}";
            }
            break;
        }
        return Center(
          child: Text(result),
        );
      },
    );
  }
}