import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Frases do dia',
      home: Column(
        children: <Widget>[
          Text('Oi amor'),
          Text('Oi amor'),
          Text('Oi amor'),
          Row(
            children: [
              Text('Oi'),
              Text('Oi'),
            ],
          )
        ],
      ),
      // home: Container(color: Colors.white)
    ),
  );
}
