import 'package:flutter/material.dart';
import 'package:whatsapp_clone/model/User.dart';

class ChatMessage extends StatefulWidget {
  ChatMessage( this.user, { super.key});
  MyUser? user;
  @override
  State<ChatMessage> createState() => _ChatMessageState();
}

class _ChatMessageState extends State<ChatMessage> {
  
  final TextEditingController _controllerMensagem = TextEditingController();

  _enviarMensagem(){

  }

  _enviarFoto(){

  }

  


  @override
  Widget build(BuildContext context) {

    var messsageTextField = Container(
      padding: EdgeInsets.all(8),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Padding(
                padding: EdgeInsets.only(right: 8),
              child: TextField(
                controller: _controllerMensagem,
                autofocus: true,
                keyboardType: TextInputType.text,
                style: TextStyle(fontSize: 16),
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(0, 8, 32, 8),
                    hintText: "Digite uma mensagem...",
                    filled: true,
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: Color(0xff075E54)),
                  borderRadius: BorderRadius.circular(32)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32)
                    ),
                    prefixIcon: IconButton(
                        icon: Icon(Icons.camera_alt, color: Color(0xff075E54)),
                        onPressed: _enviarFoto
                    )
                ),
              ),
            ),
          ),
          FloatingActionButton(
            backgroundColor: Color(0xff075E54),
            child: Icon(Icons.send, color: Colors.white, size: 20),
            mini: true,
            onPressed: _enviarMensagem,
          )
        ],
      ),
    );

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
                messsageTextField
              ],
            ),
          )
        ),
      ),
    );
  }
}