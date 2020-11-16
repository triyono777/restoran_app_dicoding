import 'package:restoran_app_dicoding/model/detail_restaurant_model.dart';
import 'package:restoran_app_dicoding/model/favorite_model.dart';
import 'package:restoran_app_dicoding/model/restaurant_model.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static DatabaseHelper _databaseHelper;
  static Database _database;

  DatabaseHelper._createObject();
  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._createObject();
    }

    return _databaseHelper;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await _initializeDb();
    }

    return _database;
  }

  static String _tableName = 'favorites';

  Future<Database> _initializeDb() async {
    var path = await getDatabasesPath();
    var db = openDatabase(
      '$path/restaurant_db.db',
      onCreate: (db, version) async {
        await db.execute(
          '''CREATE TABLE $_tableName (       
               id TEXT PRIMARY KEY,
               name TEXT,
               pictureId TEXT,
               city TEXT
             )''',
        );
      },
      version: 1,
    );

    return db;
  }

  Future<void> insertFavorite(FavoriteModel favorite) async {
    final Database db = await database;
    await db.insert(
      _tableName,
      favorite.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    print('Data saved');
  }

  Future<List<FavoriteModel>> getFavorite() async {
    final Database db = await database;
    List<Map<String, dynamic>> results = await db.query(_tableName);
    List<FavoriteModel> listFav = results.map((res) => FavoriteModel.fromMap(res)).toList();
    print(listFav.length);
    return listFav;
  }
}
