import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
 
 _recuperarBancoDados() async {

    final dataBase = await getDatabasesPath();
    final localDataBase = join(dataBase, "banco.db");

    var retorno = await openDatabase(
      localDataBase,
      version: 1,
      onCreate: (db, version){
        String sql = "CREATE TABLE usuarios (id INTEGER PRIMARY KEY AUTOINCREMENT, nome VARCHAR, idade INTEGER) ";
        db.execute(sql);
      }
    );

    print("aberto: " + retorno.isOpen.toString() );

  }

  @override
  Widget build(BuildContext context) {
    _recuperarBancoDados();
    return Scaffold(
      appBar: AppBar(
        title: Text("Sqlite"),
      ),
      body: Container(),
    );
  }
}