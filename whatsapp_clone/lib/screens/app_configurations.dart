import 'dart:io';

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

  void saveUserPhoto() {}

  File? imageFile;

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
                // ignore: unnecessary_null_comparison
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
                                    "https://firebasestorage.googleapis.com/v0/b/whatsappflutter-715ad.appspot.com/o/userPhoto%2F297198350_744858636953138_6294962469889980768_n.jpg?alt=media&token=58a0ebb0-d90d-4dff-84ff-d08a7329cddb")))),
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
                        saveUserPhoto();
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
