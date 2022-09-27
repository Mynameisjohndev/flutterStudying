import 'package:flutter/material.dart';
import 'package:head_or_crown/game.dart';
import 'package:head_or_crown/routes/first_screen.dart';
import 'package:head_or_crown/routes/second_screen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: FirstScreen(),
    initialRoute: "/",
    routes: {
      "/segunda" : (context) => SecondScreen(),
    },
  ));
}