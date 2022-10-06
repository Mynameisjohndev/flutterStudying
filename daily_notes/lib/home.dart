import 'package:daily_notes/helper/AnotationHelper.dart';
import 'package:daily_notes/helper/model/Anotation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  var _db = AnotationHelper();
  List<Anotation> _anotations = <Anotation>[];

  _saveAndUpdateAnotation({Anotation? selectedAnotation}) async {
    String title = _titleController.text;
    String description = _descriptionController.text;
    String data = DateTime.now().toString();
    if(selectedAnotation == null){
      Anotation anotation = Anotation(title, description, data);
      int result = await _db.saveAnotation(anotation);
    }else{
      selectedAnotation.title = title;
      selectedAnotation.description = description;
      selectedAnotation.data = data;
      int result = await _db.updateAnotation(selectedAnotation);
    }

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

  _removeAnotation(int? id) async{
    await _db.removeAnotation(id);
     _loadAnotation();
  }

  _formatDate(String? data){
    initializeDateFormatting('pt_BR');
    var formater = DateFormat("d/M/y 'ás' H:m:s");
    DateTime convertedDate = DateTime.parse(data!);
    String formatedDate = formater.format(convertedDate);
    return formatedDate;
  }

  _showCreateNewAnotation({Anotation? anotation}) {

    String title = "";
    if(anotation == null){
      _titleController.text = "";
      _descriptionController.text = "";
      title = "Salvar";
    }else{
      _titleController.text = anotation.title!;
      _descriptionController.text = anotation.description!;
      title = "Atualizar";
    }

    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("$title anotação"),
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
                    _saveAndUpdateAnotation(selectedAnotation: anotation);
                    Navigator.pop(context);
                  },
                  child: Text(title))
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
                    subtitle: Text("${_formatDate(item.data)} - ${item.description!}"),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        IconButton(
                          onPressed: (){
                            _showCreateNewAnotation(anotation: item);
                          },
                          icon: Icon(Icons.edit, color: Colors.green)
                        ),
                        IconButton(
                          onPressed: (){
                            _removeAnotation(item.id);
                          },
                          icon: Icon(Icons.delete, color: Colors.red)
                        ),
                      ],
                    ),
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
            _showCreateNewAnotation();
          }),
    );
  }
}
