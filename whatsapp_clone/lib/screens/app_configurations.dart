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
  TextEditingController _controllerName = TextEditingController(text: "");
  String? messageNameError = '';
  File? imageFile;
  bool _statusUpload = false;
  User? userLoged;
  String? loadedImage =
      "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__480.png";
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

  Future uploadStorageFirebase() async {
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference pack = storage.ref();
    Reference archive = pack.child("fotos").child("${userLoged?.uid}.jpg");
    UploadTask task = archive.putFile(imageFile!);
    task.snapshotEvents.listen((TaskSnapshot event) async {
      if (event.state == TaskState.running) {
        setState(() {
          _statusUpload = true;
        });
      } else if (event.state == TaskState.success) {
        setState(() {
          _statusUpload = false;
        });
        String urlImage = await (await task).ref.getDownloadURL();
        firestore
            .collection("users")
            .doc(userLoged?.uid)
            .update({"profile": urlImage});
      }
    });
  }

  loadUserInformation(User user) async {
    DocumentSnapshot doc = await FirebaseFirestore.instance
        .collection("users")
        .doc(user.uid)
        .get();
    dynamic data = doc.data();
    _controllerName.text = data["name"];
    if (data["profile"] != null) {
      setState(() {
        loadedImage = data["profile"];
      });
    }
  }

  updateUserName() async {
    String newName = _controllerName.text;
    if (newName.length < 3) {
      return setState(() {
        messageNameError = "O nome precisa ter no mínimo 3 caracteres.";
      });
    }
    setState(() {
      messageNameError = "";
    });
    firestore.collection("users").doc(userLoged?.uid).update({"name": newName});
  }

  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) async {
      if (user != null) {
        loadUserInformation(user);
        setState(() {
          userLoged = user;
        });
      }
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
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _statusUpload ? CircularProgressIndicator() : Container(),
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
                                image: NetworkImage(loadedImage!)))),
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
                  controller: _controllerName,
                  hintText: "Nome",
                  message: messageNameError!,
                  typeInput: TextInputType.text,
                  isSecure: false,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 16, bottom: 10),
                      child: ElevatedButton(
                          child: Text(
                            "Salvar foto",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            minimumSize: Size(
                                MediaQuery.of(context).size.width * 0.43, 60),
                            padding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32)),
                          ),
                          onPressed: () {
                            uploadStorageFirebase();
                          }),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 16, bottom: 10),
                      child: ElevatedButton(
                          child: Text(
                            "Salvar nome",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            minimumSize: Size(
                                MediaQuery.of(context).size.width * 0.43, 60),
                            padding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32)),
                          ),
                          onPressed: () {
                            updateUserName();
                          }),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
