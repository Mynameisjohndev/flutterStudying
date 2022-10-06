import 'dart:ffi';

import 'package:daily_notes/helper/model/Anotation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class AnotationHelper{

  static final String tableName = "anotacao";
  static final AnotationHelper _anotationHelper = AnotationHelper._internal();
  Database? _db;

  factory AnotationHelper(){
    return _anotationHelper;
  }

  AnotationHelper._internal() {
  }

  get db async{
    if(_db != null){
      return _db;
    }else{
      _db = await initializeDb();
      return _db;
    }
  }

  _onCreateDataBase(Database db, int version)async{
    String sql = "CREATE TABLE $tableName" 
    "(id INTEGER PRIMARY KEY AUTOINCREMENT," 
    "title VARCHAR," 
    "description TEXT," 
    "data DATETIME)";
    await db.execute(sql);
  }

  initializeDb () async{
    final wayDataBase = await getDatabasesPath();
    final localDataBase = join(wayDataBase, "mydata_anotations.db");
    var db = await openDatabase(
      localDataBase,
      version: 1,
      onCreate: _onCreateDataBase
    );
    return db;
  }

  Future<int> saveAnotation(Anotation anotation) async{
    // print({
    //   anotation.id,
    //   anotation.data,
    //   anotation.title,
    //   anotation.description,
    // });
    var dataBase = await db;
    int result = await dataBase.insert(tableName,anotation.toMap());
    return result;
  }

  Future<int> updateAnotation(Anotation anotation) async{
    var dataBase = await db;
    int result = await dataBase.update(
      tableName,
      anotation.toMap(),
      where: "id = ?",
      whereArgs: [anotation.id]
    );
    return result;
  }

  loadAnotation()async{
    var dataBase = await db;
    String sql = "SELECT * FROM  $tableName ORDER BY data DESC";
    List anotations = await dataBase.rawQuery(sql);
    return anotations;
  } 

  Future<int> removeAnotation(int? id) async{
    var dataBase = await db;
    return dataBase.delete(
      tableName,
      where: "id = ?",
      whereArgs: [id]
    );
  }

}