import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/model/Chat.dart';
import 'package:whatsapp_clone/model/User.dart';

class Contacts extends StatefulWidget {
  const Contacts({super.key});

  @override
  State<Contacts> createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  FirebaseFirestore db = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  String? idUser;
  String? emailUser;

  _loadUserData() async {
    var logedUser = FirebaseAuth.instance.currentUser;
    idUser = logedUser!.uid;
    emailUser = logedUser.email;
  }

  Future<List<MyUser>> _loadContacts() async {
    QuerySnapshot response = await db.collection('users').get();
    List<MyUser> users = [];
    for (DocumentSnapshot item in response.docs) {
      var dados = item.data() as Map;
      if (dados["email"] == emailUser) continue;
      MyUser user = MyUser();
      user.email = dados["email"];
      user.name = dados["name"];
      user.profile = dados["profile"];
      users.add(user);
    }
    return users;
  }

  @override
  void initState() {
    _loadUserData();
    _loadContacts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<MyUser>>(
      future: _loadContacts(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Center(
              child: Column(
                children: <Widget>[
                  Text("Carregando contatos"),
                  CircularProgressIndicator()
                ],
              ),
            );
          case ConnectionState.active:
          case ConnectionState.done:
            return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (_, index) {
                  List<MyUser>? listaItens = snapshot.data;
                  MyUser user = listaItens![index];
                  return ListTile(
                    onTap: (){
                      print({user.name, user.email});
                      Navigator.pushNamed(
                        context, 
                        "/chat",
                        arguments: user
                      );
                    },
                    contentPadding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                    leading: CircleAvatar(
                      maxRadius: 30,
                      backgroundColor: Colors.grey,
                      backgroundImage: user.profile != null
                          ? NetworkImage(user.profile!)
                          : null,
                    ),
                    title: Text(
                      user.name!,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  );
                });
        }
      },
    );
  }
}
