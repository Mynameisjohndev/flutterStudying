import 'package:flutter/material.dart';
import 'package:whatsapp_clone/model/Chat.dart';

class Contacts extends StatefulWidget {
  const Contacts({super.key});

  @override
  State<Contacts> createState() => _ContactsState();
} 

class _ContactsState extends State<Contacts> {

  List<Chat> chatList = [
    Chat("Lucas", "Como você vai", "https://firebasestorage.googleapis.com/v0/b/whatsappflutter-715ad.appspot.com/o/userPhoto%2Fperfil1.jpg?alt=media&token=642bc8b1-815e-4442-b3b0-a3d9bc8737bb"),
    Chat("Lucas", "Como você vai", "https://firebasestorage.googleapis.com/v0/b/whatsappflutter-715ad.appspot.com/o/userPhoto%2Fperfil1.jpg?alt=media&token=642bc8b1-815e-4442-b3b0-a3d9bc8737bb"),
    Chat("Lucas", "Como você vai", "https://firebasestorage.googleapis.com/v0/b/whatsappflutter-715ad.appspot.com/o/userPhoto%2Fperfil1.jpg?alt=media&token=642bc8b1-815e-4442-b3b0-a3d9bc8737bb"),
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
        );
      },
    );
  }
}