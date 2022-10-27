import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/components/ChatMessageList.dart';
import 'package:whatsapp_clone/components/MessageTextField.dart';
import 'package:whatsapp_clone/model/Message.dart';
import 'package:whatsapp_clone/model/User.dart';

import '../model/Chat.dart';

class ChatMessage extends StatefulWidget {
  ChatMessage(this.user, {super.key});
  MyUser? user;
  @override
  State<ChatMessage> createState() => _ChatMessageState();
}

class _ChatMessageState extends State<ChatMessage> {
  FirebaseFirestore db = FirebaseFirestore.instance;
  final TextEditingController controllerMensagem = TextEditingController();
  String? idUser;
  late String idUserRecipient;
  String? emailUser;
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

  _loadUserData() async {
    var logedUser = FirebaseAuth.instance.currentUser;
    idUser = logedUser!.uid;
    emailUser = logedUser.email;
    idUserRecipient = widget.user!.idUsuario!;
  }

  sendMessage() {
    String messageText = controllerMensagem.text;
    if (messageText.isNotEmpty) {
      Message newMessage = Message();
      newMessage.idUsuario = idUser;
      newMessage.message = messageText;
      newMessage.type = "text";
      newMessage.date = DateTime.now();
      saveMessageInApp(idUser, idUserRecipient, newMessage);
      saveMessageInApp(idUserRecipient, idUser, newMessage);
    }
  }

  saveMessageInApp(
      String? idRecipient, String? idSender, Message message) async {
    await db
        .collection('messages')
        .doc(idRecipient!)
        .collection(idSender!)
        .add(message.toJson());
    controllerMensagem.clear();
  }

  sendPhoto() {
    // print("photo");
  }

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Stream<Object?>? getMessages() {
    // print("cuuuuuuuuuu");
    // print(idUser);
    // print(idUserRecipient);
    var response = db
        .collection("messages")
        .doc(idUser)
        .collection(idUserRecipient)
        .snapshots();
    return response;
  }

  @override
  Widget build(BuildContext context) {
    var stream = StreamBuilder(
      stream: db
        .collection("messages")
        .doc(idUser)
        .collection(idUserRecipient)
        .snapshots(),
      builder: (context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Center(
              child: Column(
                children: <Widget>[
                  Text("Carregando menssagens"),
                  CircularProgressIndicator()
                ],
              ),
            );
          case ConnectionState.active:
          case ConnectionState.done:
            QuerySnapshot querySnapshot = snapshot.data;
            print(querySnapshot.docs.length);
            if (snapshot.hasError) {
              return Expanded(
                child: Text("Erro ao carregar os dados!"),
              );
            } else {
              List<DocumentSnapshot> querySnapshotMessages = querySnapshot.docs.toList();
              return ChatMessageList(querySnapshotMessages, idUser!);
            }
        }
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              maxRadius: 20,
              backgroundColor: Colors.grey,
              backgroundImage: widget.user!.profile != null
                  ? NetworkImage(widget.user!.profile!)
                  : null,
            ),
            Padding(
              padding: EdgeInsets.only(left: 8),
              child: Text(widget.user == null ? "" : widget.user!.name!),
            ),
          ],
        ),
        backgroundColor: Color(0xff075e54),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/bg.png"), fit: BoxFit.cover)),
        child: SafeArea(
            child: Container(
          padding: EdgeInsets.all(8),
          child: Column(
            children: <Widget>[
              stream,
              MessageTextField(controllerMensagem, sendMessage, sendPhoto),
            ],
          ),
        )),
      ),
    );
  }
}
