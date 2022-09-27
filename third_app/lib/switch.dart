import 'package:flutter/material.dart';

class MySwitch extends StatefulWidget {
  const MySwitch({super.key});

  @override
  State<MySwitch> createState() => _MySwitchState();
}

class _MySwitchState extends State<MySwitch> {
  bool _selected = false;

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
            SwitchListTile(
                title: Text("Masculino"),
                value: _selected,
                secondary: Icon(Icons.abc),
                onChanged: (bool value) {
                  setState(() {
                    _selected = value;
                  });
                }),

            // Switch(
            //     value: _selected,
            //     onChanged: (bool value) {
            //       setState(() {
            //         _selected = value;
            //       });
            //     }),
            // Text("Receber notificação"),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
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
