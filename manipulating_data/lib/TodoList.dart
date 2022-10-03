import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:async';
import 'dart:convert';
class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> { 

  List _todoList = [];
  TextEditingController _editingController = TextEditingController();

  _getFile() async{
    final source = await getApplicationDocumentsDirectory();
    return File("${source.path}/data.json");
  }

  _saveTodo(){
    String text = _editingController.text;
    print(text);
    Map<String, dynamic> todo = Map();
    todo["title"] = text;
    todo["realizada"] = false;
    setState(() {
      _todoList.add(todo);
    });
    _saveData();
    _editingController.text = "";
  }

  _saveData()async{
    var file = await _getFile();
    String data = json.encode(_todoList);
    file.writeAsString(data);
  }

  _loadTodos()async{
    try{
      final file = await _getFile();
      return file.readAsString();
    }catch(error){
      return null;
    }
  }

  @override
  void initState() {
    super.initState();
    _loadTodos().then( (dados){
      setState(() {
        _todoList = json.decode(dados);
      });
    } );
  }

  Widget createList(context, index){
    final item = _todoList[index]["title"];
    return Dismissible(
      direction: DismissDirection.endToStart,
      onDismissed: (direction){
        _todoList.removeAt(index);
        _saveData();
      },
      background: Container(
        padding: EdgeInsets.all(16),
        color: Colors.red,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Icon(Icons.delete, color: Colors.white)
          ]
        ),
      ),
      key: Key(item),
      child:  CheckboxListTile(
      title: Text(_todoList[index]["title"]), 
      onChanged: (bool? value) { 
        setState(() {
        _todoList[index]["realizada"] = value;
          _saveData();
        });
      }, 
      value: _todoList[index]["realizada"],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Manipular dados"),
        backgroundColor: Colors.purple,
      ),
      body:
        Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemBuilder: createList,
                itemCount: _todoList.length,
              )
            )
          ]
        ),
      // floatingActionButton: FloatingActionButton(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        elevation: 6,
        onPressed: () {
          showDialog(
            context: context, 
            builder: (context){
              return AlertDialog(
                title: Text("Adicionar tarefa"),
                content: TextField(
                  controller: _editingController,
                  decoration: InputDecoration(
                    labelText: "Digite sua tarefas",
                  ),
                  onChanged: (value){
                  },
                ),
                actions: [
                  ElevatedButton(
                    onPressed: (){
                      Navigator.pop(context);
                    }, 
                    child: Text("Cancelar"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: (){
                      _saveTodo();
                      Navigator.pop(context);
                    }, 
                    child: Text("Salvar"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                    ),
                  ),
                ],
              );
            }
          );
        }, 
        child: Icon(Icons.add),
      ),
    );
  }
}