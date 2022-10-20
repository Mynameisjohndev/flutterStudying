import 'package:flutter/material.dart';
import 'package:whatsapp_clone/model/AlertSuccesOrErorr.dart';

class Alert {
  static showMyDialog(AlertSuccesOrErorr alert) async {
    return showDialog<void>(
      context: alert.context!,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(alert.title!),
          content: Text(alert.body!),
          actions: <Widget>[
            TextButton(
              child: Text('Ok'),
              onPressed: () {
                switch (alert.type!) {
                  case "normal":
                    Navigator.of(context).pop();
                    break;
                  case "success_signin":
                    Navigator.pushNamedAndRemoveUntil(
                        alert.context!, "/home", (_) => false);
                    break;
                }
              },
            ),
          ],
        );
      },
    );
  }
}
