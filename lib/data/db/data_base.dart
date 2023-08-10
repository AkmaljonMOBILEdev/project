import 'package:e_commerce/data/models/news_fields.dart';
import 'package:e_commerce/data/models/news_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class LocalDatabase {
  static final LocalDatabase getInstance = LocalDatabase._init();

  LocalDatabase._init();

  factory LocalDatabase() {
    return getInstance;
  }

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await _initDB("contacts.db");
      return _database!;
    }
  }

  Future<Database> _initDB(String dbName) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, dbName);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = "INTEGER PRIMARY KEY AUTOINCREMENT";
    const textType = "TEXT NOT NULL";

    await db.execute('''
    CREATE TABLE ${NewsFields.newsTable} (
    ${NewsFields.id} $idType,
    ${NewsFields.title} $textType,
    ${NewsFields.desc} $textType,
    ${NewsFields.imageUrl} $textType,
    ${NewsFields.source} $textType
    )
    ''');

    debugPrint("-------DB----------CREATED---------");
  }

  static Future<NewsModel> insertNews(
      NewsModel newsModel) async {
    debugPrint("Asserting: ${newsModel.title}");
    final db = await getInstance.database;
    final int id = await db.insert(
        NewsFields.newsTable, newsModel.toJson());
    return newsModel.copyWith(id: id);
  }

  static Future<List<NewsModel>> getAllNews() async {
    List<NewsModel> allNews = [];
    final db = await getInstance.database;
    allNews = (await db.query(NewsFields.newsTable))
        .map((e) => NewsModel.fromJson(e))
        .toList();
    return allNews;
  }


}
