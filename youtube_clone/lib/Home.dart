import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
      body: Container(
        child: Column(
          children: <Widget>[

          ],
        ),
      ),
    );
  }
}