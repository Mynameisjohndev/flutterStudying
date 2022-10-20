import 'package:flutter/material.dart';
import 'package:whatsapp_clone/model/User.dart';
import 'package:whatsapp_clone/screens/app_configurations.dart';
import 'package:whatsapp_clone/screens/chatMessage.dart';
import 'package:whatsapp_clone/view/Home.dart';
import 'package:whatsapp_clone/view/Login.dart';
import 'package:whatsapp_clone/view/Signup.dart';

class RouteGenerator {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
  
    final args = settings.arguments as MyUser?;

    switch (settings.name) {
      case "/":
        return returnPage(Login());
      case "/login":
        return returnPage(Login());
      case "/signup":
        return returnPage(Signup());
      case "/home":
        return returnPage(Home());
      case "/configs":
        return returnPage(AppConfigurations());
      case "/chat":
        return returnPage(ChatMessage(args));
      default:
        _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute(){  
    return MaterialPageRoute(
      builder: (_){
        return Scaffold(
          appBar: AppBar(title: Text("Tela não encontrada!")),
          body: Center(
            child: Text("Tela não encontrada!"),
          ),
        );
      }
    );
  }

  static returnPage(path) {
    return MaterialPageRoute(
      builder: (_) => path
    );
  }

}
