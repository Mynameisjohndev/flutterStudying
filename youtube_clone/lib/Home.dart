import 'package:flutter/material.dart';
import 'package:youtube_clone/Screens/first_screen.dart';
import 'package:youtube_clone/Screens/fourth_screen.dart';
import 'package:youtube_clone/Screens/second_screen.dart';
import 'package:youtube_clone/Screens/third_screen.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int indexNow = 0;

  List<Widget> screens = [
    FirstScreen(),
    SecondScreen(),
    ThirdScreen(),
    FourthScreen()
  ];

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.grey),
        title: Image.asset(
          "images/youtube.png",
          width: 98,
          height: 22
        ),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: (){}, 
            icon: Icon(Icons.videocam),
            
          ),
          IconButton(
            onPressed: (){}, 
            icon: Icon(Icons.search)
          ),
          IconButton(
            onPressed: (){}, 
            icon: Icon(Icons.account_circle)
          ),
        ],
      ),
      body: screens[indexNow],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: indexNow,
        onTap: (index){
          setState(() { 
            indexNow = index;
          });
        },
        fixedColor: Colors.red,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Início",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.whatshot_outlined),
            label: "Em alta"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.subscriptions),
            label: "Inscrições"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.folder),
            label: "Biblioteca"
          ),
        ],
      ),
    );
  }
}