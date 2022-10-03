import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Manipular dados"),
        backgroundColor: Colors.purple,
      ),
      body: Container(
        child: Text("Manipular dados"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: FloatingActionButton(
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        elevation: 6,
        // mini: true,
        onPressed: () {}, 
        icon: Icon(Icons.add_shopping_cart),
        label: Text("Adicionar"),
        // child: Icon(Icons.add),
        // shape: BeveledRectangleBorder(
        //   borderRadius: BorderRadius.circular(8)
        // ),
      ),
      bottomNavigationBar: BottomAppBar(
        // shape: CircularNotchedRectangle(),
        child: Row(children: [
          IconButton(
            onPressed: (){}, 
            icon: Icon(
              Icons.menu
            )
          )
        ]),
      ),

    );
  }
}
