import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DataHelper{

  DataHelper._();

  static Database _database;


  Future<Database> get database async{

    if(_database != null) return _database;

    _database =await initDb();

    return _database;
  }

  initDb() async{

    String path =join(await getDatabasesPath(), "UserData.db");
    await openDatabase(path,version: 1,onCreate: (Database db , int version)async{
      await db.execute('''
      CREATE TABLE user {
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT NOT NULL ,
      phone TEXT NOT NULL ,
      email TEXT NOT NULL ,
      }
      ''');
    });
  }
}
