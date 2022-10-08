import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

FirebaseFirestore db = FirebaseFirestore.instance;
  void create(){
    db.collection('counter')
    .add({'datetime': DateTime.now().toString()});
  }

  void load() async{
    QuerySnapshot response = await db.collection('counter')
    .get();
    for(DocumentSnapshot item in response.docs){
      var dataItem = item.data();
      print(dataItem);
    }
  }

  void update() async{
    db.collection('counter').doc("3KI76sUfFpoC1L3btEGS")
    .set({
      "counter": 2
    });
  }

  void remove() async{
    db.collection('counter').doc("3KI76sUfFpoC1L3btEGS")
    .delete();
  }

  void realtime() async{
    db.collection('counter').snapshots().listen((response) {
      for(DocumentSnapshot item in response.docs){
        var dataItem = item.data();
        print(dataItem);
      }
    });
  }
  void filter() async{
    QuerySnapshot response = await db.collection('counter')
    .where("datetime",isEqualTo: "0")
    .where("date",isEqualTo: "12")
    .get();

    for(DocumentSnapshot item in response.docs){
        var dataItem = item.data();
        print(dataItem);
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Firebase"),
      ),
      body: Container(
        child: Column(
          children: [
            ElevatedButton(
              child: Text("Click"),
              onPressed: create,
            ),
            ElevatedButton(
              child: Text("Load"),
              onPressed: load,
            ),
            ElevatedButton(
              child: Text("Update"),
              onPressed: update,
            ),
            ElevatedButton(
              child: Text("Remover"),
              onPressed: remove,
            ),
            ElevatedButton(
              child: Text("Tempo real"),
              onPressed: realtime,
            ),
            ElevatedButton(
              child: Text("Filtrar"),
              onPressed: filter,
            ),
          ],
        ),
      ),
    );
  }
}
