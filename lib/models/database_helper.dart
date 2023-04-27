import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  // pembuatan nama database
  static const _dbName = 'ToDoList.db';
  static const _dbVersion = 1;

  // pembuatan 2 table, table user untuk login dan table todo untuk list todo
  static const user = 'user';
  static const todo = 'todo';

  late Database _db;

  Future<void> _init() async {
    final documentDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentDirectory.path, _dbName);

    _db = await openDatabase(path, version: _dbVersion, onCreate: _onCreate);
  }

  // Pembuatan Table user
  Future _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE $user (id INTEGER PRIMARY KEY, username TEXT NOT NULL)');
  }

  Future<int> insertUser(Map<String, dynamic> row) async {
    return await _db.insert(user, row);
  }
}
