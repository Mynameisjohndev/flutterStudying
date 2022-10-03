import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController _selectController = TextEditingController();

  String _saveText = "Nada salvo";

  _save() async{
    String value = _selectController.text;
  
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("@value_", value);
    print(_selectController.text);
  }

  _load() async{
    final prefs = await SharedPreferences.getInstance();
    print(prefs.getString("@value_")!);
    setState((){
      _saveText = prefs.getString("@value_")! ?? "Sem valor!";
    });
  }

  _remove() async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove("@value_");
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
              _saveText,
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
            Padding(
              padding: EdgeInsets.all(15),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child:  Row(
                children: <Widget>[
                  ElevatedButton(
                    onPressed: _save, 
                    child: Text("Salvar"),
                    style: ElevatedButton.styleFrom(
                      
                    ),
                  ),
                  ElevatedButton(
                    onPressed: _load, 
                    child: Text("Recuperar"),
                  ),
                  ElevatedButton(
                    onPressed: _remove, 
                    child: Text("Remover"),
                  ),
                ],
              ) ,
              )   
            ),
          ],
        ),
      ),
    );
  }
}