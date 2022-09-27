import 'package:atm_app/client_screen.dart';
import 'package:atm_app/company_screen.dart';
import 'package:atm_app/contact_screen.dart';
import 'package:atm_app/service_screen.dart';
import 'package:flutter/material.dart';

class FirstScreen extends StatefulWidget {
  @override
  State<FirstScreen> createState() => _FirstScreenState();
}


class _FirstScreenState extends State<FirstScreen> {

  void _openCompany() {
    Navigator.push(
      context, 
      MaterialPageRoute(
        builder: (context) => CompanyScreen(),
      )
    );
  }
  void _openClient() {
    Navigator.push(
      context, 
      MaterialPageRoute(
        builder: (context) => ClientScreen(),
      )
    );
  }
  void _openService() {
    Navigator.push(
      context, 
      MaterialPageRoute(
        builder: (context) => ServiceScreen(),
      )
    );
  }
  void _openContact() {
    Navigator.push(
      context, 
      MaterialPageRoute(
        builder: (context) => ContactScreen(),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Atm consultoria"),
        backgroundColor: Colors.green,
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset("images/logo.png"),
            Padding(
              padding: EdgeInsets.only(top: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  GestureDetector(
                    onTap: _openCompany,
                    child: Image.asset("images/menu_empresa.png"),
                  ),
                  GestureDetector(
                    onTap: _openService,
                    child: Image.asset("images/menu_servico.png"),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  GestureDetector(
                    onTap: _openClient,
                    child: Image.asset("images/menu_cliente.png"),
                  ),
                  GestureDetector(
                    onTap: _openContact,
                    child: Image.asset("images/menu_contato.png"),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
