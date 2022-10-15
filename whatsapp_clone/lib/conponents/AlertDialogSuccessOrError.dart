import 'package:flutter/material.dart';
import 'package:whatsapp_clone/view/Home.dart';

import '../model/AlertSuccesOrErorr.dart';

alertDialogSuccessOrError({required AlertSuccesOrErorr alert}) {
  return showDialog(
    context: alert.context!,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(alert.title!),
        content: Text(alert.body!),
        actions: [
          TextButton(
            onPressed: () {
              if (alert.type! == "success_signin") {
                Navigator.pushNamedAndRemoveUntil(alert.context!, "/home", (_)=>false);
              }else{ 
                Navigator.of(alert.context!).pop();
              }
            },
            child: Text('Ok'),
          ),
        ],
      );
    },
  );
}
