import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(
        title: Text('Instagran'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Text('Instagran'),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.orange,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Row(
              //EIXO Y
              crossAxisAlignment: CrossAxisAlignment.center,
              //EIXO X
              // mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Instagran'),
                Text('Instagran 2'),
              ]),
        ),
      ),
    ),
  ));
}
