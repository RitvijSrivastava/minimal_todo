import 'dart:async';
import 'dart:io';
import 'package:minimal_todo/models/task.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class TaskDatabase {
  static final TaskDatabase _instance = TaskDatabase._();
  static Database _database;

  TaskDatabase._();

  factory TaskDatabase() {
    return _instance;
  }

  Future<Database> get db async {
    if (_database != null) {
      return _database;
    }

    _database = await init();

    return _database;
  }

  Future<Database> init() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String dbPath = join(directory.path, 'database.db');
    var database = openDatabase(
      dbPath,
      version: 1,
      onCreate: _onCreate,
    );

    return database;
  }

  void _onCreate(Database db, int version) {
    db.execute('''
      CREATE TABLE tasks(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        task TEXT)
    ''');
    print("Task Database was created!");
  }

  //Insert into a DB
  Future<int> addTask(Task task) async {
    var client = await db;
    return client.insert('tasks', task.toMapForDB(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<Task> fetchTask(int id) async {
    var client = await db;
    final Future<List<Map<String, dynamic>>> futureMaps =
        client.query('Task', where: 'id = ?', whereArgs: [id]);
    var maps = await futureMaps;

    if (maps.length != 0) {
      return Task.fromDB(maps.first);
    }

    return null;
  }

  Future<List<Task>> fetchAll() async {
    var client = await db;
    var res = await client.query('tasks');

    if (res.isNotEmpty) {
      var tasks = res.map((taskMap) => Task.fromDB(taskMap)).toList();
      return tasks;
    }
    return [];
  }

  Future<void> removeTask(int id) async {
    var client = await db;
    return client.delete('tasks', where: 'id = ?', whereArgs: [id]);
  }
}
