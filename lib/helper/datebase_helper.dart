import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqfliteyotubenotaapp/helper/conestant.dart';
import 'package:sqfliteyotubenotaapp/model/user_model.dart';

class DataHelper {
  DataHelper._();

  static final DataHelper db =DataHelper._();
  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await initDb();

    return _database;
  }

  initDb() async {
    String path = join(await getDatabasesPath(), 'UserData.db');
   return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
      CREATE TABLE $tableUser {
      $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
      $columnName TEXT NOT NULL ,
      $columnPhone TEXT NOT NULL ,
      $columnEmail TEXT NOT NULL ,
      }
      ''');
    });
//
  }

 Future<UserModel>insertUser(UserModel user) async {
    var dbClient = await database;

    await dbClient.insert(
        tableUser,
        user.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return user;
  }


  updateUser(UserModel user) async {

    var dbClient = await database;

 await dbClient.update(
     tableUser,
     user.toJson(),
        where: '$columnId = ?',
     whereArgs: [user.id]
 );
  }



  Future<UserModel> getUser(int id) async {
    var dbClient = await database;
    List<Map> maps = await dbClient.query(
      tableUser,
      where: '$columnId = ?',
      whereArgs: [id],
    );
    if (maps.length > 0) {
      return UserModel.fromJson(maps.first);
    } else {
      return null;
    }
  }

  Future<List<UserModel>> getAllUser() async {
    var dbClient = await database;

    List<Map> maps = await dbClient.query(tableUser);

    return maps.isNotEmpty
        ? maps.map((user) => UserModel.fromJson(user)).toList()
        : [];
  }


  Future<void>deleteUser(int id)async{
    var dbClient =await database;

    return await dbClient.delete(tableUser,
      where: '$columnId = ?',
      whereArgs: [id],
    );
  }
}
