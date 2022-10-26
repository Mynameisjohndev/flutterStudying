import 'package:flutter/material.dart';
import 'package:whatsapp_clone/conponents/ChatMessageList.dart';
import 'package:whatsapp_clone/conponents/MessageTextField.dart';
import 'package:whatsapp_clone/model/User.dart';

import '../model/Chat.dart';

class ChatMessage extends StatefulWidget {
  ChatMessage( this.user, { super.key});
  MyUser? user;
  @override
  State<ChatMessage> createState() => _ChatMessageState();
}

class _ChatMessageState extends State<ChatMessage> {
  
  final TextEditingController controllerMensagem = TextEditingController();
  List<String> messages = [
    "sdsdasadsdsdas dasd asdas dasd sad s as dsad asdsadas asdasd",
    "sdsdasadsd",
    "sdsdasadsd",
    "sdsdasadsd",
    "sdsdasadsd",
    "sdsdasadsd",
    "sdsdasadsd",
    "sdsdasadsd",
    "sdsdasadsd",
    "sdsdasadsd",
    "sdsdasadsd",
    "sdsdasadsd",
  ];

  sendMessage(){
    print("message");
  }

  sendPhoto(){
    print("photo");
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.user == null ? "" : widget.user!.name!),
        backgroundColor: Color(0xff075e54),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/bg.png"),
            fit: BoxFit.cover
          )
        ),
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.all(8),
            child: Column(  
              children: <Widget>[
                ChatMessageList(messages),
                MessageTextField(controllerMensagem, sendMessage, sendPhoto),
              ],
            ),
          )
        ),
      ),
    );
  }
}