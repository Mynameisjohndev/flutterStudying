import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:whatsapp_clone/conponents/InputForm.dart';

class AppConfigurations extends StatefulWidget {
  const AppConfigurations({super.key});

  @override
  State<AppConfigurations> createState() => _AppConfigurationsState();
}

class _AppConfigurationsState extends State<AppConfigurations> {
  TextEditingController _controllerEmail = TextEditingController(text: "");
  String? messageEmailError = '';
  File? imageFile;
  bool _statusUpload = false;
  String _urlImageDowload = "";
  User? userLoged;

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

  Future uploadStorageFirebase() async {
    // print(userLoged);
    String url;
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference  pack = storage.ref();
    Reference  archive = pack
    .child("fotos")
    .child("${userLoged?.uid}.jpg");
    UploadTask task = archive.putFile(imageFile!);
    task.snapshotEvents.listen((TaskSnapshot event) {
      if ( event.state == TaskState.running ){
        setState(() {
          _statusUpload = true;
        });
      }else if( event.state == TaskState.success ) {
        setState(() {
          _statusUpload = false;
        });
        // FirebaseFirestore.instance.collection("").doc()
      }
    });
    // String urlImage = await (await task).ref.getDownloadURL();
  }

  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      setState(() {
        userLoged = user;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Configurações"),
        backgroundColor: Color(0xff075E54),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                _statusUpload
                    ? CircularProgressIndicator()
                    : Container(),
                imageFile != null
                    ? Container(
                        width: 220,
                        height: 220,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: FileImage(imageFile!))))
                    : Container(
                        width: 220,
                        height: 220,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(
                                    "https://firebasestorage.googleapis.com/v0/b/whatsappflutter-715ad.appspot.com/o/userPhoto%2Fperfil4.jpg?alt=media&token=224ef3d7-a98c-4136-84cf-ef11be898d7f")))),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: pickImageCamera, child: Text("Câmera")),
                    TextButton(
                        onPressed: pickImageGalery, child: Text("Galeria")),
                  ],
                ),
                InputForm(
                  controller: _controllerEmail,
                  hintText: "Email",
                  message: messageEmailError!,
                  typeInput: TextInputType.emailAddress,
                  isSecure: false,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16, bottom: 10),
                  child: ElevatedButton(
                      child: Text(
                        "Salvar",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        // minimumSize:
                        //     Size(MediaQuery.of(context).size.width, 60),
                        padding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32)),
                      ),
                      onPressed: () {
                        uploadStorageFirebase();
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
