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

  List _todoList = ["ir ao mercado", "programar em futter", "treino"];
  
  _saveTodo()async{

    final source = await getApplicationDocumentsDirectory();
    var file = File("${source}/data.json");

    Map<String, dynamic> todo = Map();
    todo["title"] = "Ir ao mercado";
    todo["realizada"] = false;
    _todoList.add(todo);
    
    String data = json.encode(_todoList);
    file.writeAsStringSync(data);
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
                    title: Text(_todoList[index]),
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
                    labelText: "Digite sua tarefas"
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
                      _saveTodo;
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
