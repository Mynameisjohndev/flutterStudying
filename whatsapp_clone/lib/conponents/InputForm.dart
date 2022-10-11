import 'package:flutter/material.dart';

class InputForm extends StatefulWidget {
  const InputForm(
      {super.key,
      required this.controller,
      required this.message,
      required this.typeInput,
      required this.hintText});
  final TextEditingController controller;
  final String message;
  final TextInputType typeInput;
  final String hintText;
  @override
  State<InputForm> createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 8, bottom: 8),
          child: TextField(
            controller: widget.controller,
            autofocus: true,
            keyboardType: widget.typeInput,
            style: TextStyle(fontSize: 20),
            decoration: InputDecoration(
              // enabledBorder: OutlineInputBorder(
              //   borderSide: BorderSide(width: 3, color: Colors.greenAccent),
              //   borderRadius: BorderRadius.circular(32)
              // ),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                  borderRadius: BorderRadius.circular(32)),
              contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
              hintText: widget.hintText,
              filled: true,
              fillColor: Colors.white,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(32)),
            ),
          ),
        ),
        widget.message != ""
            ? Text(
                widget.message!,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.red.shade400,
                ),
              )
            : Container(),
      ],
    );
  }
}
