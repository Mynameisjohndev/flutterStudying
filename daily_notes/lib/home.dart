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
  List<Anotation> _anotations = <Anotation>[];

  _saveAnotation() async {
    String title = _titleController.text;
    String description = _descriptionController.text;
    String data = DateTime.now().toString();
    Anotation anotation = Anotation(title, description, data);
    int result = await _db.saveAnotation(anotation);
    _titleController.clear();
    _descriptionController.clear();
    _loadAnotation();
  }

  _loadAnotation() async {
    List anotations = await _db.loadAnotation();
    List<Anotation>? tempList = <Anotation>[];
    for (var item in anotations) {
      Anotation anotation = Anotation.fromMap(item);
      tempList.add(anotation);
    }
    setState(() {
      _anotations = tempList!;
    });
    tempList = null;
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
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadAnotation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Minhas anotações"),
        backgroundColor: Colors.lightGreen,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _anotations.length,
              itemBuilder: (context, index){

                final item = _anotations[index];
    
                return Card(
                  margin: EdgeInsets.only(top: 16, right: 26, left: 26),
                  elevation: 2,
                  child: ListTile(
                    style: ListTileStyle.drawer,
                    contentPadding: EdgeInsets.all(10),
                    title: Text(item.title!),
                    subtitle: Text("${item.data} - ${item.description!}"),
                  ),
                );
              } ,
            ),
          )
        ],
      ),
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
