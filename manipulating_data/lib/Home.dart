import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController _selectController = TextEditingController();

  _save(){

  }

  _load(){

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Manipular dados")
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          children: <Widget>[
            Text(
              "Nada salvo",
              style: TextStyle(
                fontSize: 20
              ),
            ),
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "Digite algo"
              ),
              controller: _selectController,
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(15),
                  child: ElevatedButton(
                    onPressed: _save, 
                    child: Text("Salvar"),
                    // style: ElevatedButton.styleFrom(
                    //   backgroundColor: Colors.amber
                    // ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: ElevatedButton(
                    onPressed: _load, 
                    child: Text("Recuperar"),
                  ),
                ),
                
              ],
            )
          ],
        ),
      ),
    );
  }
}