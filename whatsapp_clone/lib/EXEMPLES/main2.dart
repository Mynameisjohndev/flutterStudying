import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:whatsapp_clone/firebase_options.dart';
import 'package:whatsapp_clone/view/Login.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
    home: Login(),
    theme: ThemeData(
      primaryColor: Color(0xff075e54),
      accentColor: Color(0xff25d366)
    ),
    
    debugShowCheckedModeBanner: false,
  ));
}

class TestHork extends StatefulWidget {
  const TestHork({super.key});

  @override
  State<TestHork> createState() => _TestHorkState();
}

class _TestHorkState extends State<TestHork> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Workamanager"),
      ),
    );
  }
}
