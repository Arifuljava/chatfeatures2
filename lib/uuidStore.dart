
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:flutter/material.dart';
class uuidStore extends StatefulWidget {
  const uuidStore({super.key});

  @override
  State<uuidStore> createState() => _uuidStoreState();
}
List<UUID_Model> dataList1 = [];

class _uuidStoreState extends State<uuidStore> {
  Future<void> fetchDataList2() async {
    /*
    List<UUID_Model> fetchedData1 =  await DatabaseHelper.instance.getAllData();
    setState(() {
      dataList1 = fetchedData1;
    });
    List<String> contentDataList = dataList1.map((data) => data.myid).toList();
print(dataList1);
     */

    List<UUID_Model> fetchedData = await DatabaseHelper.instance.getAllData();
    setState(() {
      dataList1 = fetchedData;
    });

    List<String> nameList = dataList1.map((data) => data.name).toList();
    print(nameList[0]);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
 // ini();
 fetchDataList2();

  }
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  void ini() async{
    await DatabaseHelper.instance.insertData("01018106033", "Ariful");
    await DatabaseHelper.instance.getData();
  }
}
class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._();
  static Database? _database;

  DatabaseHelper._();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    final path = join(await getDatabasesPath(), 'your_database.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE UUID_TABLE (
            id TEXT PRIMARY KEY,
            name TEXT
          )
        ''');
      },
    );
  }

  Future<void> insertData(String uuid, String name) async {
    final db = await database;
    await db.insert(
      'UUID_TABLE',
      {'id': uuid, 'name': name},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    print("Added");
  }
  Future<List<UUID_Model>> getAllData() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query("UUID_TABLE");
    return List.generate(maps.length, (i) {
      return UUID_Model.fromMap(maps[i]);
    });
  }

  Future<Map<String, dynamic>?> getData() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('UUID_TABLE');
    if (maps.isNotEmpty) {
      return maps.first;
    }
    return null;
  }
}

class UUID_Model {

  final String id;
  final String name;

  UUID_Model({
    required this.id,
    required this.name,
  });


  factory UUID_Model.fromMap(Map<String, dynamic> map) {
    return UUID_Model(
      id: map['id'],

      name: map['name']

    );
  }

  @override
  String toString() {

    return 'UUID_Model {id: $id, name:'
        ' $name}';
  }

}