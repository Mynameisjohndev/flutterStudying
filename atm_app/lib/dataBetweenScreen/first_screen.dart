import 'package:atm_app/dataBetweenScreen/second_screen.dart';
import 'package:flutter/material.dart';

class FirstScreen extends StatefulWidget {
  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  String name = "João";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FirstScreen"),
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(15),
              child: ElevatedButton(
                  onPressed: () {
                    print("sd");
                    Navigator.push(
                      context, 
                      MaterialPageRoute(
                        builder: (context) => SecondScreen(valor: "sdsd", name: name)
                      )
                    );
                  },
                  child: Text("Clique")),
            ),
            Text(name),
          ],
        ),
      ),
    );
  }
}