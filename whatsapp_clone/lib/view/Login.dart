import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/conponents/AlertDialogSuccessOrError.dart';
import 'package:whatsapp_clone/conponents/InputForm.dart';
import 'package:whatsapp_clone/model/AlertSuccesOrErorr.dart';
import 'package:whatsapp_clone/model/User.dart';
import 'package:whatsapp_clone/view/Home.dart';
import 'package:whatsapp_clone/view/Signup.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _controllerEmail =
      TextEditingController(text: "joao@gmail.com");
  TextEditingController _controllerPassword =
      TextEditingController(text: "12121212");
  String? messageEmailError = '';
  String? messagePasswordError = '';
  bool isLoged = false;

  void login(MyUser user) {
    AlertSuccesOrErorr alert = AlertSuccesOrErorr();
    alert.context = context;
    FirebaseAuth auth = FirebaseAuth.instance;
    auth
        .signInWithEmailAndPassword(
            email: user.email!, password: user.password!)
        .then((value) => {
              alert.title = "Parabéns",
              alert.body = "Sua conta foi logada com sucesso!",
              alert.type = "success",
              showMyAlert(alert: alert)
            })
        .catchError((onError) => {
              alert.title = "Erro :(",
              alert.body = "Houve um erro durante o login de sua conta"
                  " tente novamente",
              alert.type = "",
              showMyAlert(alert: alert)
            });
  }

  void validInputs() {
    String email = _controllerEmail.text;
    String password = _controllerPassword.text;
    if (email.isNotEmpty && email.contains("@")) {
      setState(() {
        messageEmailError = "";
      });
      if (password.isNotEmpty) {
        setState(() {
          messagePasswordError = "";
        });
        MyUser user = MyUser();
        user.email = email;
        user.password = password;
        login(user);
      } else {
        setState(() {
          messagePasswordError = "Por favor informe uma senha!";
        });
      }
    } else {
      setState(() {
        messageEmailError = "Por favor informe um e-mail válido!";
      });
    }
  }

  _verificarUsuarioLogado() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
      } else {
        print("A função foi chamada");
        setState(() {
          isLoged = true;
        });
        Navigator.pushNamedAndRemoveUntil(context, "/home", (_)=> false);
      }
    }); 
  }

  @override
  void initState() {
    _verificarUsuarioLogado();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Color(0xff075E54)),
        padding: EdgeInsets.all(16),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 32),
                  child: Image.asset(
                    "images/logo.png",
                    width: 200,
                    height: 150,
                  ),
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
                Padding(
                  padding: EdgeInsets.only(top: 16, bottom: 10),
                  child: ElevatedButton(
                      child: Text(
                        "Entrar",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        minimumSize:
                            Size(MediaQuery.of(context).size.width, 60),
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
                    child: Text("Não tem conta? cadastre-se!",
                        style: TextStyle(color: Colors.white)),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Signup()
                          )
                      );
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
