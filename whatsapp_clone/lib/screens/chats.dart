import 'package:flutter/material.dart';
import 'package:whatsapp_clone/model/Chat.dart';

class Chats extends StatefulWidget {
  const Chats({super.key});

  @override
  State<Chats> createState() => _ChatsState();
} 

class _ChatsState extends State<Chats> {

  List<Chat> chatList = [
    Chat("Test", "Como você vai", "https://firebasestorage.googleapis.com/v0/b/whatsappflutter-715ad.appspot.com/o/userPhoto%2F297198350_744858636953138_6294962469889980768_n.jpg?alt=media&token=58a0ebb0-d90d-4dff-84ff-d08a7329cddb"),
    Chat("Test", "Como você vai", "https://firebasestorage.googleapis.com/v0/b/whatsappflutter-715ad.appspot.com/o/userPhoto%2F297198350_744858636953138_6294962469889980768_n.jpg?alt=media&token=58a0ebb0-d90d-4dff-84ff-d08a7329cddb"),
    Chat("Test", "Como você vai", "https://firebasestorage.googleapis.com/v0/b/whatsappflutter-715ad.appspot.com/o/userPhoto%2F297198350_744858636953138_6294962469889980768_n.jpg?alt=media&token=58a0ebb0-d90d-4dff-84ff-d08a7329cddb"),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: chatList.length,
      itemBuilder: (BuildContext context, int index) { 
        Chat chat = chatList[index];
        return ListTile(
          contentPadding: EdgeInsets.fromLTRB(16, 8, 16, 8),
          leading: CircleAvatar(
            maxRadius: 30,
            backgroundColor: Colors.grey,
            backgroundImage: NetworkImage(chat.pathPhoto!),
          ),
          title: Text(
            chat.name!,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          subtitle: Text(
            chat.message!,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 16,
            ),
          ),
        );
      },
    );
  }
}