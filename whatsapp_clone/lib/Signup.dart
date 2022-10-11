import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/Login.dart';
import 'package:whatsapp_clone/model/User.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController _controllerName = TextEditingController();
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerPassword = TextEditingController();
  TextEditingController _controllerRepeatPassword = TextEditingController();
  String? messageNameError = '';
  String? messageEmailError = '';
  String? messageRepeatPasswordError = '';
  String? messagePasswordError = '';

  @override
  Widget build(BuildContext context) {
    void createUser(MyUser user) {
      FirebaseAuth auth = FirebaseAuth.instance;
      auth.createUserWithEmailAndPassword(email: user.email!, password: user.password!);
    }

    void validInputs() {
      String name = _controllerName.text;
      String email = _controllerEmail.text;
      String password = _controllerPassword.text;
      String repeatPassword = _controllerRepeatPassword.text;
      if (name.isNotEmpty && name.length > 3) {
        messageNameError = "";
        if (email.isNotEmpty && email.contains("@")) {
          messageEmailError = "";
          print(repeatPassword);
          print(password);
          if ((password.isNotEmpty && repeatPassword.isNotEmpty)) {
            if (password.toString() == repeatPassword.toString()) {
              setState(() {
                messagePasswordError = "";
                messageRepeatPasswordError = "";
              });
              MyUser user = MyUser();
              user.password = password;
              user.name = name;
              user.email = email;
              createUser(user);
            } else {
              setState(() {
                String message = "As senhas informadas nao se conhecidem";
                messagePasswordError = message;
                messageRepeatPasswordError = message;
              });
            }
            setState(() {
              messagePasswordError = "";
              messageRepeatPasswordError = "";
            });
          } else {
            setState(() {
              messagePasswordError = "Preencha o campo de senha corretamente!";
              messageRepeatPasswordError =
                  "Preencha o campo de repetir senha corretamente!";
            });
          }
        } else {
          setState(() {
            messageEmailError = "Preencha o campo de e-mail corretamente!";
          });
        }
      } else {
        setState(() {
          messageNameError = "Preencha o campo de nome corretamente!";
        });
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Siignup"),
        backgroundColor: Color(0xff075E54),
      ),
      body: Container(
        decoration: BoxDecoration(color: Color(0xff075E54)),
        padding: EdgeInsets.all(16),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 32),
                  child: Image.asset(
                    "images/usuario.png",
                    width: 100,
                    height: 50,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: TextField(
                    controller: _controllerName,
                    autofocus: true,
                    keyboardType: TextInputType.text,
                    style: TextStyle(fontSize: 20),
                    decoration: InputDecoration(
                      // enabledBorder: OutlineInputBorder(
                      //   borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                      //   borderRadius: BorderRadius.circular(32)
                      // ),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 3, color: Colors.greenAccent),
                          borderRadius: BorderRadius.circular(32)),
                      contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                      hintText: "Nome",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32)),
                    ),
                  ),
                ),
                messageNameError != ""
                    ? Text(
                        messageNameError!,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.red.shade400,
                        ),
                      )
                    : Container(),
                Padding(
                  padding: EdgeInsets.only(bottom: 8, top: 8),
                  child: TextField(
                    controller: _controllerEmail,
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(fontSize: 20),
                    decoration: InputDecoration(
                      // enabledBorder: OutlineInputBorder(
                      //   borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                      //   borderRadius: BorderRadius.circular(32)
                      // ),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 3, color: Colors.greenAccent),
                          borderRadius: BorderRadius.circular(32)),
                      contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                      hintText: "E-mail",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32)),
                    ),
                  ),
                ),
                messageEmailError != ""
                    ? Text(
                        messageEmailError!,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.red.shade400,
                        ),
                      )
                    : Container(),
                Padding(
                  padding: EdgeInsets.only(bottom: 8, top: 8),
                  child: TextField(
                    controller: _controllerRepeatPassword,
                    keyboardType: TextInputType.text,
                    style: TextStyle(fontSize: 20),
                    decoration: InputDecoration(
                      // enabledBorder: OutlineInputBorder(
                      //   borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                      //   borderRadius: BorderRadius.circular(32)
                      // ),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 3, color: Colors.greenAccent),
                          borderRadius: BorderRadius.circular(32)),
                      contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                      hintText: "Senha",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32)),
                    ),
                  ),
                ),
                messagePasswordError != ""
                    ? Text(
                        messagePasswordError!,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.red.shade400,
                        ),
                      )
                    : Container(),
                Padding(
                  padding: EdgeInsets.only(bottom: 8, top: 8),
                  child: TextField(
                    controller: _controllerPassword,
                    keyboardType: TextInputType.text,
                    style: TextStyle(fontSize: 20),
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 3, color: Colors.greenAccent),
                            borderRadius: BorderRadius.circular(32)),
                        contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                        hintText: "Repetir senha",
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32))),
                  ),
                ),
                messageRepeatPasswordError != ""
                    ? Text(
                        messageRepeatPasswordError!,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.red.shade400,
                        ),
                      )
                    : Container(),
                Padding(
                  padding: EdgeInsets.only(top: 16, bottom: 10),
                  child: ElevatedButton(
                      child: Text(
                        "Entrar",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32)),
                      ),
                      onPressed: () {
                        validInputs();
                      }),
                ),
                Center(
                  child: GestureDetector(
                    child: Text("Já possuo conta",
                        style: TextStyle(color: Colors.white)),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
