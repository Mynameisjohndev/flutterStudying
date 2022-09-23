import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
        title: 'Frases do dia',
        home: Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Text(
                  'Lorem Ipsum is simply dumm SDADA Sad asdas dsd kjash dksdjaskjd skjah jk hkj hkj hkj hkj hkj hkjhk',
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                    decoration: TextDecoration.none
                  ))
            ],
          ),
        )),
  );
}
