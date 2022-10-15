import 'package:flutter/material.dart';

class TextFielExamples extends StatefulWidget {
  const TextFielExamples({super.key});

  @override
  State<TextFielExamples> createState() => _TextFielExamplesState();
}

class _TextFielExamplesState extends State<TextFielExamples> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          // margin: EdgeInsets.all(12),
          height: 80,
          width: MediaQuery.of(context).size.width,
          child: TextField(
            maxLines: 5,
            decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(32)),
                hintText: "Enter a message",
                hintTextDirection: TextDirection.ltr,
                fillColor: Colors.grey[300],
                filled: true,
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                    borderRadius: BorderRadius.circular(32))),
          ),
        ),
        SizedBox(
          width: 200,
          child: TextField(
            decoration: InputDecoration(
              labelText: 'Enter Name',
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }
}
