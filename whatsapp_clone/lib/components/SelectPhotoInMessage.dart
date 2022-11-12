import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../model/Message.dart';

class SelectPhotoInMessage extends StatefulWidget {
  const SelectPhotoInMessage(
      {super.key, required this.idUser, required this.idContact});
  final String? idUser;
  final String? idContact;
  @override
  State<SelectPhotoInMessage> createState() => _SelectPhotoInMessageState();
}

class _SelectPhotoInMessageState extends State<SelectPhotoInMessage> {
  File? imageFile;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future pickImageCamera() async {
    var image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) return;
    setState(() {
      imageFile = File(image.path);
    });
  }

  Future pickImageGalery() async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    setState(() {
      imageFile = File(image.path);
    });
  }

  Future sendMessage() async {
    print("send ");
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference pack = storage.ref();
    String nameImage = DateTime.now().microsecondsSinceEpoch.toString();
    Reference archive =
        pack.child("mensagens").child(widget.idUser!).child("$nameImage.jpg");
    UploadTask task = archive.putFile(imageFile!);
    task.snapshotEvents.listen((TaskSnapshot event) async {
      if (event.state == TaskState.success) {
        String urlImage = await (await task).ref.getDownloadURL();

        Message newMessage = Message();
        newMessage.idUsuario = widget.idUser;
        newMessage.message = urlImage;
        newMessage.type = "image";
        newMessage.date = DateTime.now();
        saveMessageInApp(widget.idUser, widget.idContact, newMessage);
        saveMessageInApp( widget.idContact, widget.idUser, newMessage);
      }
    });
  }

  saveMessageInApp(
      String? idRecipient, String? idSender, Message message) async {
    await firestore
        .collection('messages')
        .doc(idRecipient!)
        .collection(idSender!)
        .add(message.toJson());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      height: MediaQuery.of(context).size.height * 0.5,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          imageFile != null
              ? Container(
                  width: 220,
                  height: 220,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                          fit: BoxFit.fill, image: FileImage(imageFile!))))
              : Container(
                  width: 220,
                  height: 220,
                  color: Colors.grey,
                ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Cancelar'),
              ),
              TextButton(
                onPressed: pickImageGalery,
                child: Text('Galeria'),
              ),
              TextButton(
                onPressed: pickImageCamera,
                child: Text('Câmera'),
              ),
            ],
          ),
          Center(
            child: TextButton(
              onPressed: sendMessage,
              child: Text('Enviar foto'),
            ),
          )
        ],
      ),
    );
  }
}
