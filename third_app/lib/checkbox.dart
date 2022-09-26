import 'package:flutter/material.dart';

class MyCheckBox extends StatefulWidget {
  @override
  State<MyCheckBox> createState() => _MyCheckBoxState();
}

class _MyCheckBoxState extends State<MyCheckBox> {
  bool _selectedCheckboxBrasil = false;
  bool _selectedCheckboxMexico = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Checkbox"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            // Checkbox(
            //   value: _selectedCheckbox,
            //   onChanged: (bool? value){
            //     setState(() {
            //       _selectedCheckbox = value!;
            //     });
            //   }
            // )
            
            CheckboxListTile(
              title: Text("Comida brasileira"),
              subtitle: Text("A melhor comida do mundo!"),
              // activeColor: Colors.red,
              // selected: true,
              // secondary: Icon(Icons.add_box),
              value: _selectedCheckboxBrasil,
              onChanged: (bool? value) {
                setState(() {
                  _selectedCheckboxBrasil = value!;
                });
              },
            ),

            CheckboxListTile(
              title: Text("Comida mexicanas"),
              subtitle: Text("A melhor comida do mundo!"),
              // activeColor: Colors.red,
              // selected: true,
              // secondary: Icon(Icons.add_box),
              value: _selectedCheckboxMexico,
              onChanged: (bool? value) {
                setState(() {
                  _selectedCheckboxMexico = value!;
                });
              },
            ),

            ElevatedButton(
              onPressed: () { 

              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue
              ),
              child: Text(
                "Salvar",
              ),
            )
          ],
        ),
      ),
    );
  }
}
