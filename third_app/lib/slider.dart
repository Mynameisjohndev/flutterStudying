import 'package:flutter/material.dart';

class MySlider extends StatefulWidget {
  @override
  State<MySlider> createState() => _MySliderState();
}

class _MySliderState extends State<MySlider> {

  double selectadValue = 0;
  String label = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Slider"),
      ),
      body: Container(
        padding: EdgeInsets.all(60),
        child: Column(children: <Widget>[
          Slider(
            label: label,
            divisions: 10,
            value: selectadValue,
            min: 0,
            max: 10,
            onChanged: (double? value){
              setState(() {
                selectadValue = value!;
                label = "Valor selecionado" + value.toString();
              });
            },
          )
        ]),
      ),
    );
  }
}
