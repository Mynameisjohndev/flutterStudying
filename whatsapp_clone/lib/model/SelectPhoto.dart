import 'dart:io';

import 'package:flutter/cupertino.dart';

class ModalSelectedPhotos {
  File? _photo;
  BuildContext? _context;

  ModalSelectedPhotos();

  File? get photo => _photo;

  set photo(File? value) {
    _photo = value;
  }

  BuildContext? get context => _context;

  set context(BuildContext? value) {
    _context = value;
  }
}
