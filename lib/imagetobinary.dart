

import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
class imagetobinary extends StatefulWidget {
  const imagetobinary({super.key});

  @override
  State<imagetobinary> createState() => _imagetobinaryState();
}

class _imagetobinaryState extends State<imagetobinary> {
  late Uint8List _imageBytes = Uint8List(0);
  late DatabaseHelper databaseHelper;
  List<Map<String, dynamic>> _imageList = [];
  @override
  void initState() {
    super.initState();
databaseHelper=DatabaseHelper.instance;
//getAllImage();
print("INI");
  }
  Future<void> loadImageAndConvert() async {
    Uint8List imageBytes = await loadImageBytes('assets/images/birthday.png');
    setState(() {
      _imageBytes = imageBytes;
    });
    print(_imageBytes);
    await DatabaseHelper.instance.insertImage(imageBytes);

    // Print binary representation of image bytes
    printImageBinary();
  }

  Future<Uint8List> loadImageBytes(String imagePath) async {
    ByteData data = await rootBundle.load(imagePath);
    return data.buffer.asUint8List();
  }

  void printImageBinary() {
    if (_imageBytes != null) {
      for (int byte in _imageBytes) {
     //   print(byte.toRadixString(2).padLeft(8, '0'));
      }
      print("Done>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
    }
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Image To Binary"),
        ),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.all(50),
              alignment: Alignment.center,
              height: 250,
              width: 250,
              child: Image.asset(
                'assets/images/birthday.png',
              ),

            ),
            ElevatedButton(onPressed: ()async{
          await loadImageAndConvert();

              List<Map<String, dynamic>> imageList =
              await DatabaseHelper.instance.getImages();
              setState(() {
                _imageList = imageList;

              });

              print(_imageList);



            }, child: Text("Convert")),
            Container(
                height: 250,
              width: 250,
              child: _imageBytes != null
                ? Image.memory(_imageBytes)
            : CircularProgressIndicator(),
            )
          ],
        ),
      ),
    );
  }

  void getAllImage() async{
    List<Map<String, dynamic>> imageList =
    await DatabaseHelper.instance.getImages();
    setState(() {
      _imageList = imageList;

    });
print("Arif");
    print(_imageList);
  }
}
class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('images.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE images(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        image BLOB,
        binaryString TEXT
      )
    ''');
  }

  Future<void> insertImage(Uint8List imageBytes) async {
    print("Contine");
    final db = await instance.database;

    String binaryString = '';
    for (int byte in imageBytes) {
     binaryString += byte.toRadixString(2).padLeft(8, '0');
       //binaryString = imageBytes.map((byte) => byte.toRadixString(16)).join('');
    }

    await db.insert(
      'images',
      {'image': imageBytes, 'binaryString': binaryString},
    );

    print("Added$imageBytes");
  }

  Future<List<Map<String, dynamic>>> getImages() async {
    final db = await instance.database;

    return db.query('images');
  }
}