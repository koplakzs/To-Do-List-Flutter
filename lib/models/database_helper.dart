import 'dart:ffi';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:to_do_list/models/user_model.dart';

class DatabaseHelper {
  // pembuatan nama database
  static const _dbName = 'ToDoList.db';
  static const _dbVersion = 1;

  // pembuatan 2 table, table user untuk login dan table todo untuk list todo
  static const tableUser = 'user';
  static const tableTodo = 'todo';

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _init();
    return _database!;
  }
  // late Database _db;

  // DatabaseHelper() {
  //   init();
  // }

  _init() async {
    final documentDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentDirectory.path, _dbName);
    return await openDatabase(path, version: _dbVersion, onCreate: _onCreate);
  }

  // Pembuatan Table user
  Future _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE $tableUser (id INTEGER PRIMARY KEY, username TEXT NOT NULL, status TEXT NOT NULL)');
  }

  Future<int> insertUser(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(tableUser, row);
  }

  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await instance.database;
    return await db.query(tableUser);
  }

  Future<void> deleteData() async {
    Database db = await instance.database;
    await db.delete(tableUser, where: 'status = ?', whereArgs: ['user']);
  }

  Future<bool> isDatabaseEmpty() async {
    Database db = await instance.database;
    final count = Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) FROM $tableUser'));
    // print(count);
    return count == 0;
  }

  Future<UserModel> getUser(String status) async {
    Database db = await instance.database;

    final result =
        await db.query(tableUser, where: 'status = ?', whereArgs: [status]);

    if (result.isNotEmpty && result.first['username'] != null) {
      return UserModel(username: result.first['username'] as String);
    }
    return UserModel(username: 'NO data');
  }
}
