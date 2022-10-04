import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
 
 _receiveData() async {

    final dataBase = await getDatabasesPath();
    final localDataBase = join(dataBase, "banco.db");

    var bd = await openDatabase(
      localDataBase,
      version: 1,
      onCreate: (db, version){
        String sql = "CREATE TABLE usuarios (id INTEGER PRIMARY KEY AUTOINCREMENT, nome VARCHAR, idade INTEGER) ";
        db.execute(sql);
      }
    );

    // print("aberto: " + bd.isOpen.toString() );
    return bd;
  }

  _save()async{
    Database bd = await _receiveData();
    Map<String, dynamic> dataUser = {
      "nome": "João",
      "idade": 23
    };
    print(dataUser);
    int id = await bd.insert(
      "usuarios", 
      dataUser
    );
    print(id);
  }

  _listUsers()async{
    Database bd = await _receiveData();
    String sql = "SELECT * FROM usuarios";
    List response = await bd.rawQuery(sql);
    print(response);
  }

  @override
  Widget build(BuildContext context) {
    _listUsers();
    return Scaffold(
      appBar: AppBar(
        title: Text("Sqlite"),
      ),
      body: Container(),
    );
  }
}