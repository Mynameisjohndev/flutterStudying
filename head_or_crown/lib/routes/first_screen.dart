import 'package:flutter/material.dart';

class FirstScreen extends StatefulWidget {
  FirstScreen({super.key});
  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text("Primeira"),
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
                  ElevatedButton(onPressed: () {
                    Navigator.pushNamed(context, "/segunda");
                  }, child: Text("Voltar"))
                ],
              ),
            ),
          ),
        ));
  }
}
