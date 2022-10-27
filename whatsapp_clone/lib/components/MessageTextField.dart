import 'package:flutter/material.dart';

class MessageTextField extends StatefulWidget {
  const MessageTextField(
      this.controllerMensagem, this.sendMessage, this.sendPhoto,
      {super.key});
  final TextEditingController controllerMensagem;
  final Function() sendPhoto;
  final Function() sendMessage;
  @override
  State<MessageTextField> createState() => _MessageTextFieldState();
}

class _MessageTextFieldState extends State<MessageTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 8),
              child: TextField(
                controller: widget.controllerMensagem,
                autofocus: true,
                keyboardType: TextInputType.text,
                style: TextStyle(fontSize: 16),
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(0, 8, 32, 8),
                    hintText: "Digite uma mensagem...",
                    filled: true,
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 2, color: Color(0xff075E54)),
                        borderRadius: BorderRadius.circular(32)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32)),
                    prefixIcon: IconButton(
                        icon: Icon(Icons.camera_alt, color: Color(0xff075E54)),
                        onPressed: widget.sendPhoto)),
              ),
            ),
          ),
          FloatingActionButton(
              backgroundColor: Color(0xff075E54),
              child: Icon(Icons.send, color: Colors.white, size: 20),
              mini: true,
              onPressed: widget.sendMessage
              
              )
        ],
      ),
    );
  }
}
