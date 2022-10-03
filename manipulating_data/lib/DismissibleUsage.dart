import 'package:flutter/material.dart';

class DismissibleUsage extends StatefulWidget {
  const DismissibleUsage({super.key});

  @override
  State<DismissibleUsage> createState() => _DismissibleUsageState();
}

class _DismissibleUsageState extends State<DismissibleUsage> {
  List _todoList = ["teste", "test"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dismissible Usage"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: ListView.builder(
            itemCount: _todoList.length,
            itemBuilder: (BuildContext context, int index) {
              final item = _todoList[index];
              return Dismissible(
                direction: DismissDirection.horizontal,
                background: Container(
                  color: Colors.green,
                  padding: EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Icon(Icons.edit, color: Colors.white),
                    ],
                  ),
                ),
                secondaryBackground: Container(
                  color: Colors.red,
                  padding: EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Icon(Icons.delete, color: Colors.white),
                    ],
                  ),
                ),
                key: Key(item),
                child: ListTile(
                  title: Text(item),
                ),
                onDismissed: (direction) {},
              );
            },
          ))
        ],
      ),
    );
  }
}
