import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(
    MaterialApp(
        title: 'Frases do dia',
        home: Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              TextButton(
                onPressed: () {
                  print('Button pressed');
                },
                child: Text('FlatButton To TextButton Migration'),
              )
            ],
          ),
        )),
  );
}
