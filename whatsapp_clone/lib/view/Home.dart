import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/screens/chats.dart';
import 'package:whatsapp_clone/screens/contacts.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController _tabBarController;

  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
      } else {
        print(user);
      }
    });
    _tabBarController = TabController(length: 2, vsync: this);
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
            ]),
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
