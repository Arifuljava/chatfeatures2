import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:flutter/material.dart';

class seconddatabase extends StatefulWidget {
  const seconddatabase({super.key});

  @override
  State<seconddatabase> createState() => _seconddatabaseState();
}

class _seconddatabaseState extends State<seconddatabase> {
  final dbHelper = DatabaseHelper();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ini();
  }
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

void ini()  async{
  final dbHelper = DatabaseHelper();
  await dbHelper.insertData({
    'date': '2023-08-16',
    'size': '10 MB',
    'name': 'File Name',
    'myfull_jname': 'My Full J Name',
  });
  print("Added");


}

class DatabaseHelper {
  static Database? _database;
  static const String _dbName = 'my_database.db';

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, _dbName);

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE my_table (
            id INTEGER PRIMARY KEY,
            date TEXT,
            size TEXT,
            name TEXT,
            myfull_jname TEXT
          )
        ''');
      },
    );
  }

  Future<void> insertData(Map<String, dynamic> data) async {
    final db = await database;
    await db.insert('my_table', data);
  }

  Future<List<Map<String, dynamic>>> fetchData() async {
    final db = await database;
    return await db.query('my_table');
  }
}