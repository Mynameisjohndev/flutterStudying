import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Frases do dia',
        home: Container(
          margin: EdgeInsets.only(top: 40),
          decoration: BoxDecoration(
            color: Colors.black,
            border: Border.all(width: 3, color: Colors.white),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text("Ok2"),
                    Text("Ok2"),
                    Text("Ok2"),
                    Text("Ok2"),
                  ],
                ),
              ),
            ],
          ),
        )),
  );
}
