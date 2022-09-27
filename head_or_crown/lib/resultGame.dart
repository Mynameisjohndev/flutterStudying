import 'package:flutter/material.dart';
import 'package:head_or_crown/game.dart';

class Result extends StatefulWidget {
  String value;
  Result({super.key, required this.value});
  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    var _resultImage;

    if (widget.value == "cara") {
      setState(() {
        _resultImage = "images/moeda_cara.png";
      });
    }else{
      setState(() {
        _resultImage = "images/moeda_coroa.png";
      });
    }
    
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
                  Image.asset(_resultImage),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Image.asset("images/botao_voltar.png"),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
