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
              child: Text("login"),
              onPressed: create,
            ),
          ],
        ),
      ),
    );
  }
}
