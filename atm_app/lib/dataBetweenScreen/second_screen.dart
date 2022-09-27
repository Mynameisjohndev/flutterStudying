import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  String valor;
  String name;

  SecondScreen({required this.valor, required this.name});
  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SecondScreen"),
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(15),
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      widget.name = "Elevated";
                    });
                  },
                  child: Text(widget.valor)
                  ),
            )
          ],
        ),
      ),
    );
  }
}