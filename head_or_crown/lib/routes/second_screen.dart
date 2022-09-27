import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  SecondScreen({super.key});
  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text("Segunda"),
        ),
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
                  ElevatedButton(onPressed: () {}, child: Text("Voltar"))
                ],
              ),
            ),
          ),
        ));
  }
}
