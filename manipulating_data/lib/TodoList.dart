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

  List _todoList = [
    // {"title": "TESTE"}
  ];
  
  _getFile() async{
    final source = await getApplicationDocumentsDirectory();
    return File("${source.path}/data.json");
  }

  _saveTodo()async{
    var file = await _getFile();
    Map<String, dynamic> todo = Map();
    todo["title"] = "Ir ao mercado";
    todo["realizada"] = false;
    _todoList.add(todo);
    
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
                itemBuilder: (context, index){
                  return ListTile(
                    title: Text(_todoList[index]["title"]),
                  );
                },
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
                      // Navigator.pop(context);
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