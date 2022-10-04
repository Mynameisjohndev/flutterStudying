import 'package:daily_notes/helper/AnotationHelper.dart';
import 'package:daily_notes/helper/model/Anotation.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  var _db = AnotationHelper();

  _saveAnotation()async{
    String title = _titleController.text;
    String description= _descriptionController.text;
    String data = DateTime.now().toString();
    Anotation anotation = Anotation(title, description, data);
    int result = await _db.saveAnotation(anotation);
    print(result.toString());
  }

  _exibirTelaCadastro() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Adicionar anotação"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextField(
                  controller: _titleController,
                  autofocus: true,
                  decoration: InputDecoration(
                      labelText: "Título", hintText: "Digite título..."),
                ),
                TextField(
                  controller: _descriptionController,
                  decoration: InputDecoration(
                      labelText: "Descrição", hintText: "Digite descrição..."),
                )
              ],
            ),
            actions: <Widget>[
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Cancelar")),
              TextButton(
                  onPressed: () {
                    _saveAnotation();
                    Navigator.pop(context);
                  },
                  child: Text("Salvar"))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Minhas anotações"),
        backgroundColor: Colors.lightGreen,
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
          child: Icon(Icons.add),
          onPressed: () {
            _exibirTelaCadastro();
          }),
    );
  }
}
