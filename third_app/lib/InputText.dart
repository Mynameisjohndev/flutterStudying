import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyTextInput extends StatefulWidget {
  const MyTextInput({super.key});

  @override
  State<MyTextInput> createState() => _MyTextInputState();
}

class _MyTextInputState extends State<MyTextInput> {

  final _textEditingController = TextEditingController();
  String campo = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(

     appBar: AppBar(
      title: Text('Entrada')
     ),
     body: Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(32),
          child: TextField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              labelText: 'Digite um valor',
            ),
            maxLength: 2,
            maxLengthEnforcement: MaxLengthEnforcement.none,
            onSubmitted: (String texto ) => {
              campo = texto,
            },
            controller: _textEditingController,
            obscureText: true,
          )
        ),
        ElevatedButton(onPressed: (){
          print(_textEditingController.text);
        }, child: Text("Clique")),
        Text(campo),
        Text(_textEditingController.text),
      ],
     ), 
    );
  }
}