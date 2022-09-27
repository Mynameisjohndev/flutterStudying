import 'package:flutter/material.dart';

class MyRadioButton extends StatefulWidget {
  @override
  State<MyRadioButton> createState() => _MyRadioButtonState();
}

class _MyRadioButtonState extends State<MyRadioButton> {
  String _selected = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Checkbox"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        width: double.infinity,
        child: Row(
          children: <Widget>[
            Flexible(
              child: RadioListTile(
                title: Text("Masculino"),
                value: "m",
                groupValue: _selected,
                onChanged: (String? value) {
                  setState(() {
                    _selected = value!;
                  });
                },
              ),
            )

            // Text("Masculino"),
            // Radio(
            //   value: "m",
            //   groupValue: _selected,
            //   onChanged: (String? value){
            //     setState(() {
            //       _selected = value!;
            //     });
            //   },
            // ),
            // Text("Feminino"),
            // Radio(
            //   value: "f",
            //   groupValue: _selected,
            //   onChanged: (String? value){
            //     setState(() {
            //       _selected = value!;
            //     });
            //   },
            // )
          ],
        ),
      ),
    );
  }
}
