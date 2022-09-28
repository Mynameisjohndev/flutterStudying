import 'package:flutter/material.dart';

class MyList extends StatefulWidget {
  const MyList({super.key});

  @override
  State<MyList> createState() => _MyListState();
}

class _MyListState extends State<MyList> {

  List _itens = [];

  void loadItens(){
    _itens = [];
    for(int i = 0; i <= 10; i++){
      Map<String, dynamic> item = Map();
      item["title"] = "Título ${i}";
      item["description"] = "Descrição ${i}";
      _itens.add(item);
    }
  }

  @override
  Widget build(BuildContext context) {

    loadItens();

    return Scaffold(
      appBar: AppBar(
        title: Text("Lista"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: _itens.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(_itens[index]["title"]),
              subtitle: Text(_itens[index]["description"]),
            );
          }
        ),
      ),
    );
  }
}