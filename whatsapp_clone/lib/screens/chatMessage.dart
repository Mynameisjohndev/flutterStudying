import 'package:flutter/material.dart';
import 'package:whatsapp_clone/model/User.dart';

class ChatMessage extends StatefulWidget {
  ChatMessage(this.user, {super.key});
  MyUser user;
  @override
  State<ChatMessage> createState() => _ChatMessageState();
}

class _ChatMessageState extends State<ChatMessage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.user.name == "" ? "" : widget.user.name!),
        backgroundColor: Color(0xff075e54),
      ),
      body: SingleChildScrollView(),
    );
  }
}