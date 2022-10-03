import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> { 

  List todoList = ["ir ao mercado", "programar em futter", "treino"];

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
                    title: Text(todoList[index]),
                  );
                },
                itemCount: todoList.length,
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
