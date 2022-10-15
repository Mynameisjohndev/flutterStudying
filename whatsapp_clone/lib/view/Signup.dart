import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/conponents/AlertDialogSuccessOrError.dart';
import 'package:whatsapp_clone/conponents/InputForm.dart';
import 'package:whatsapp_clone/model/AlertSuccesOrErorr.dart';
import 'package:whatsapp_clone/model/User.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
  String texto = '';

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore db = FirebaseFirestore.instance;

    void createUser(MyUser user) {
      AlertSuccesOrErorr alert = AlertSuccesOrErorr();
      alert.context = context;

      FirebaseAuth auth = FirebaseAuth.instance;
      auth
          .createUserWithEmailAndPassword(
              email: user.email!, password: user.password!)
          .then((UserCredential response) => {
                alert.title = "Parabéns",
                alert.body = "Sua conta foi criada com sucesso!",
                alert.type = "success_signin",
                alertDialogSuccessOrError(alert: alert),
                db.collection('users').doc(response.user?.uid).set(user.toMap())
              })
          .catchError((onError) => {
                alert.title = "Erro :(",
                alert.body = "Houve um erro durante a criação de sua conta"
                    " tente novamente dentro de instantes",
                alertDialogSuccessOrError(alert: alert)
              });
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
                LogoImage(),
                InputForm(
                  controller: _controllerName,
                  hintText: "Nome",
                  message: messageNameError!,
                  typeInput: TextInputType.text,
                  isSecure: false,
                ),
                InputForm(
                  controller: _controllerEmail,
                  hintText: "Email",
                  message: messageEmailError!,
                  typeInput: TextInputType.emailAddress,
                  isSecure: false,
                ),
                InputForm(
                  controller: _controllerPassword,
                  hintText: "Senha",
                  message: messagePasswordError!,
                  typeInput: TextInputType.text,
                  isSecure: true,
                ),
                InputForm(
                  controller: _controllerRepeatPassword,
                  hintText: "Repetir senha",
                  message: messageRepeatPasswordError!,
                  typeInput: TextInputType.text,
                  isSecure: true,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16, bottom: 10),
                  child: ElevatedButton(
                      child: Text(
                        "Cadastrar",
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

class LogoImage extends StatelessWidget {
  const LogoImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 32),
      child: Image.asset(
        "images/usuario.png",
        width: 100,
        height: 50,
      ),
    );
    ;
  }
}
