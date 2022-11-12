import 'dart:io';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/components/SelectPhotoInMessage.dart';
import 'package:whatsapp_clone/model/SelectPhoto.dart';

Future<void> showModalSelectedImage(
    {required ModalSelectedPhotos alert, required String? idUser, required String? idContact}) async {
  return showDialog<void>(
    context: alert.context!,
    builder: (_) {
      return Dialog(
        // : EdgeInsets.all(0),
        elevation: 3,
        child: ListView(
          shrinkWrap: true,
          children: [
            SelectPhotoInMessage(idUser: idUser, idContact: idContact),
          ],
        ),
      );
    },
  );
}
