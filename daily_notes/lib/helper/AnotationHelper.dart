import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class AnotationHelper{

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
    String sql = "CREATE TABLE anotacao (id INTEGER PRIMARY KEY AUTOINCREMENT, titulo VARCHAR, description TEXT, data DATETIME)";
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

}