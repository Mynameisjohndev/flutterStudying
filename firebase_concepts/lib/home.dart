import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:flutter/foundation.dart';

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
    // .where("datetime",isEqualTo: "0")
    // .where("date",isEqualTo: "12")
    .where("date", isGreaterThanOrEqualTo: "m")
    .where("date", isLessThanOrEqualTo: "m" + "\uf8ff")
    .get();

    for(DocumentSnapshot item in response.docs){
        var dataItem = item.data();
        print(dataItem);
      }
  }

  void createUser(){
    FirebaseAuth auth = FirebaseAuth.instance;
    auth.createUserWithEmailAndPassword(
      email: "joao@email.com", 
      password: "password"
    ).then((value) => {
      print(value),
    });
  }

  void login(){
    print('value');
    FirebaseAuth auth = FirebaseAuth.instance;
    auth.signInWithEmailAndPassword(
      email: "joao@email.com", 
      password: "password"
    ).then((value) => {
      print(value),
    });
  }

  int numbers = 0;

  void updatev(){
    setState(() {
      numbers++;
    });
  }

  File? imageFile;

  Future pickImageCamera() async {
      var image =  await ImagePicker().pickImage(source: ImageSource.camera);
      if(image == null) return;
      setState(() {
        imageFile = File(image.path);
      });
  }
  Future pickImageGalery() async {
      var image =  await ImagePicker().pickImage(source: ImageSource.gallery);
      if(image == null) return;
      setState(() {
        imageFile = File(image.path);
      });
  }

  Future uploadStorageFirebase() async {
    FirebaseStorage storage = FirebaseStorage.instance;
    final pack = storage.ref();
    final archive = pack
    .child("fotos")
    .child("foto1.jpg");
    archive.putFile(imageFile!);
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
            // ElevatedButton(
            //   child: Text("Click"),
            //   onPressed: create,
            // ),
            // ElevatedButton(
            //   child: Text("Load"),
            //   onPressed: load,
            // ),
            // ElevatedButton(
            //   child: Text("Update"),
            //   onPressed: update,
            // ),
            // ElevatedButton(
            //   child: Text("Remover"),
            //   onPressed: remove,
            // ),
            // ElevatedButton(
            //   child: Text("Tempo real"),
            //   onPressed: realtime,
            // ),
            // ElevatedButton(
            //   child: Text("Filtrar"),
            //   onPressed: filter,
            // ),
            // ElevatedButton(
            //   child: Text("Cadastrar"),
            //   onPressed: createUser,
            // ),
            // ElevatedButton(
            //   child: Text("Login"),
            //   onPressed: login,
            // ),
            // MyCard(onPressed: updatev),
            // Text("${numbers}"),
            ElevatedButton(
              child: Text("Camera"),
              onPressed: pickImageCamera,
            ),
            ElevatedButton(
              child: Text("Galeria"),
              onPressed: pickImageGalery,
            ),
            ElevatedButton(
              child: Text("Upload"),
              onPressed: uploadStorageFirebase,
            ),
            imageFile != null ? Image.file(imageFile!) : Text("Ainda n tem imagem")

          ],
        ),
      ),
    );
  }
}


class MyCard extends StatefulWidget {
  const MyCard({super.key, this.onPressed, this.login});
  final void Function()? onPressed;
  final GestureTapCallback? login;

  @override
  State<MyCard> createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        onPressed: widget.onPressed,
        child: Text("Click"),
      ),
    );
  }
}