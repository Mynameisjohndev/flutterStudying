import 'package:flutter/cupertino.dart';

class AlertSuccesOrErorr{

  String? _title;
  String? _body;
  String? _type;
  BuildContext? _context;
  
  AlertSuccesOrErorr();

  String? get title => _title;

  set title(String? value) {
    _title = value;
  }

  String? get body => _body;

  set body(String? value) {
    _body = value;
  }

  String? get type => _type;

  set type(String? value) {
    _type = value;
  }

  BuildContext? get context => _context;

  set context(BuildContext? value) {
    _context = value;
  }

}