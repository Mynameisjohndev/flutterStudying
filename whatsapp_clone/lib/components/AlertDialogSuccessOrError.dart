import 'package:flutter/material.dart';
import '../model/AlertSuccesOrErorr.dart';

Future<void> showMyAlert({required AlertSuccesOrErorr alert}) async {
  return showDialog<void>(
    context: alert.context!,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(alert.title!),
        content: Text(alert.body!),
        actions: <Widget>[
          TextButton(
            child: const Text('Approve'),
            onPressed: () {
              // switch(alert.type){
              //   case "success":
              //   Navigator.of(context).pop();
              //   break;
              //   case "":
              //   Navigator.of(context).pop();
              //   break;
              //   case "success_signup":
              //   Navigator.of(context).pop();
              //   break;
              //   default:
              //   Navigator.of(context).pop();
              //   break;
              // }
                Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
