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

    var bd =
        await openDatabase(localDataBase, version: 1, onCreate: (db, version) {
      String sql =
          "CREATE TABLE usuarios (id INTEGER PRIMARY KEY AUTOINCREMENT, nome VARCHAR, idade INTEGER) ";
      db.execute(sql);
    });

    // print("aberto: " + bd.isOpen.toString() );
    return bd;
  }

  _save() async {
    Database bd = await _receiveData();
    Map<String, dynamic> dataUser = {"nome": "Jamilton", "idade": 23};
    Map<String, dynamic> dataUser1 = {"nome": "Mariana", "idade": 63};
    Map<String, dynamic> dataUser2 = {"nome": "Jamile", "idade": 43};
    Map<String, dynamic> dataUser3 = {"nome": "Ana", "idade": 13};
    await bd.insert(
      "usuarios",
      dataUser1,
    );
    await bd.insert(
      "usuarios",
      dataUser2,
    );
    await bd.insert(
      "usuarios",
      dataUser3,
    );
  }

  _listUsers() async {
    Database bd = await _receiveData();
    //String sql = "SELECT * FROM usuarios WHERE id = 5 ";
    //String sql = "SELECT * FROM usuarios WHERE idade >= 30 AND idade <= 58";
    //String sql = "SELECT * FROM usuarios WHERE idade BETWEEN 18 AND 46 ";
    //String sql = "SELECT * FROM usuarios WHERE idade IN (18,30) ";
    //String filtro = "an";
    //String sql = "SELECT * FROM usuarios WHERE nome LIKE '%" + filtro + "%' ";
    //String sql = "SELECT *, UPPER(nome) as nomeMaiu FROM usuarios WHERE 1=1 ORDER BY UPPER(nome) DESC ";//ASC, DESC
    // String sql = "SELECT *, UPPER(nome) as nomeMaiu FROM usuarios WHERE 1=1 ORDER BY idade DESC LIMIT 3";//ASC, DESC
    //String sql = "SELECT *, UPPER(nome) as nomeMaiu FROM usuarios WHERE 1=1 ORDER BY idade ASC";//ASC, DESC
    String sql =
        "SELECT *, UPPER(nome) as nomeMaiu FROM usuarios WHERE nome LIKE '%ana%' "; //ASC, DESC
    // String sql = "SELECT * FROM usuarios";
    List usuarios = await bd.rawQuery(sql);
    for (var usuario in usuarios) {
      print("item id: " +
          usuario['id'].toString() +
          " nome: " +
          usuario['nome'] +
          " idade: " +
          usuario['idade'].toString());
    }
  }

  _listUserById(int id) async {
    Database bd = await _receiveData();
    //CRUD -> Create, Read, Update and Delete
    List usuarios = await bd.query(
      "usuarios",
      columns: ["id", "nome", "idade"],
      where: "id = ?",
      whereArgs: [id]
    );

    for( var usuario in usuarios ){
      print(
          "item id: " + usuario['id'].toString() +
          " nome: " + usuario['nome'] +
          " idade: " + usuario['idade'].toString()
      );
    }
  }

  _deleteUserById(int id) async {
    String sql = "SELECT * FROM usuarios";
    Database bd = await _receiveData();
    bd.delete(
      "usuarios",
      where: "id = ?",
      whereArgs: [id]
    );
  }

  @override
  Widget build(BuildContext context) {
    // _save();
    // _listUserById(1);
    // _listUsers();
    _deleteUserById(1);
    return Scaffold(
      appBar: AppBar(
        title: Text("Sqlite"),
      ),
      body: Container(),
    );
  }
}
