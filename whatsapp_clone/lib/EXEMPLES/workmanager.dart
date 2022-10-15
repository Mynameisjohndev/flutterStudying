import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:whatsapp_clone/firebase_options.dart';
import 'package:whatsapp_clone/view/Login.dart';
import 'package:workmanager/workmanager.dart';
import 'package:cron/cron.dart';

const taskName = "firstTask";

void lol(){
  print("sdasdasdas");
}

void calbackFunc(){
  Workmanager().executeTask((taskName, inputData) {
    
    switch (taskName){
      case 'firstTask':
        lol();
         break;
      default:
    }

    return Future.value(false);
  });
}

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Workmanager().initialize(
    calbackFunc,
    isInDebugMode: true 
  );
  final cron = Cron();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
    home: TestHork(),
    theme: ThemeData(
      primaryColor: Color(0xff075e54),
      accentColor: Color(0xff25d366)
    ),
    
    debugShowCheckedModeBanner: false,
  ));
}

class TestHork extends StatefulWidget {
  const TestHork({super.key});

  @override
  State<TestHork> createState() => _TestHorkState();
}

class _TestHorkState extends State<TestHork> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Workamanager"),
      ),
      body: ElevatedButton(
        child: Text("Click"),
        onPressed: () async {
          execute();
        },
      ),
    );
  }
}



void execute(){
  var id = DateTime.now().second.toString();
  Workmanager().registerPeriodicTask(
    id, 
    taskName,
    frequency: Duration(seconds: 15),
    inputData: {
    'int': 1,
    'bool': true,
    'double': 1.0,
    'string': 'string',
    'array': [1, 2, 3],
    },
  );
}