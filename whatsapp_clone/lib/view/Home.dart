import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/screens/chats.dart';
import 'package:whatsapp_clone/screens/contacts.dart';
import 'package:whatsapp_clone/view/Login.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController _tabBarController;
  List<String> menuOptions = [
    "Configurações", "Deslogar"
  ];
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    auth.authStateChanges().listen((User? user) {
      if (user == null) {
      } else {
        print(user);
      }
    });
    _tabBarController = TabController(length: 2, vsync: this);
  }

  _selecetMenuOption(String option){
    switch(option){
      case "Configurações":
      Navigator.pushNamed(context, "/configs");
      break;
      case "Deslogar":
      _signoutUser();
      break;
      default: 
    }
  }

  _signoutUser()async{
    await auth.signOut();
    Navigator.pushReplacementNamed(context, "/");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WhatsApp"),
        backgroundColor: Color(0xff075E54),
        bottom: TabBar(
          // isScrollable: true,
            indicatorWeight: 4,
            labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            controller: _tabBarController,
            indicatorColor: Colors.white,
            tabs: <Widget>[
              Tab(
                text: "Conversas",
              ),
              Tab(
                text: "Contatos",
              ),
            ]
            ),
            actions: [
              PopupMenuButton<String>(

                onSelected: _selecetMenuOption,
                itemBuilder: (context){
                  return menuOptions.map((item){
                    return PopupMenuItem<String>(
                      value: item,
                      child: Text(item)
                    );
                  }).toList();
                },
              )
            ],
      ),
      body: TabBarView(
        controller: _tabBarController,
        children: <Widget>[
          Chats(),
          Contacts(),
        ],
      ),
    );
  }
}
