

import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:flutter/material.dart';

class recentsqllite extends StatefulWidget {
  const recentsqllite({super.key});

  @override
  State<recentsqllite> createState() => _recentsqlliteState();
}

class _recentsqlliteState extends State<recentsqllite> {
  final dbHelper = DatabaseHelper("Arif");
  final dbHelper2 = DatabaseHelper("Arif");
  final dbHelper3 = DatabaseHelper2("Arif22");
  Future<void> fetchDataList() async {
    List<MyDataModel> fetchedData = await dbHelper.getAllData();
    setState(() {
      dataList = fetchedData;
    });
    List<String> contentDataList = dataList.map((data) => data.contentData).toList();
    print(contentDataList);
  }
  //

  Future<void> fetchDataList2() async {
    List<Model22> fetchedData1 = await dbHelper3.getAllData();
    setState(() {
      dataList1 = fetchedData1;
    });
    List<String> contentDataList = dataList1.map((data) => data.myid).toList();
    print(contentDataList);
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ini(dbHelper,dbHelper2);
   // ini2(dbHelper3);
    dbHelper3._initDatabase();
 // fetchDataList();
  fetchDataList2();
  }
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

void ini2(DatabaseHelper2 dbHelper3) async{
  await dbHelper3._initDatabase();
  print("INi2");
  final uuid = 'your_uuid_here';
  final date = '2023-08-16';
  final size = 'Large';
  final name = 'Item Name';
  final imageBitmap = 'base64encodedbitmapdata';

  final data = Model22(
    id: 1,
    myid: uuid,
    date: date,
    size: size,
    name: name,
    imagebitmap: imageBitmap,
  );

  await dbHelper3.insertData(data);
}
List<MyDataModel> dataList = [];
List<Model22> dataList1 = [];
void ini(DatabaseHelper dbHelper, DatabaseHelper helper2) async

{
  await dbHelper._initDatabase();
//  await helper2._initDatabase2();
//  final data22 = Model22(myid: "23", date: "3233", size: "size", name: "name", imagebitmap: "imageBitmap");
  //await helper2.insertData2(data22);

  print("init");
  final data = MyDataModel(
    contentData: 'some ',
    positionX: 10.0,
    positionY: 10.3,
    widgetWidth: 50,
    widgetHeight: 0,
    index: 20,
    length: 20,
    barcodeType: '20',
    textSize: 20,
    bold: true,
    underline: true,
    fromWhere: '20',
    type: '20',
    address: '20',

  );

 await dbHelper.insertData(data);
 // await dbHelper.getAllData();


}
//second model

class DatabaseHelper2 {
  static Database? _database;
  late String databasename;

  DatabaseHelper2(this.databasename);

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final String dbPath = await getDatabasesPath();
    final String path = join(dbPath, databasename);

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute('''
          CREATE TABLE $databasename(
            id INTEGER PRIMARY KEY,
            myid TEXT,
            date TEXT,
            size TEXT,
            name TEXT,
            imagebitmap TEXT
          )
        ''');
      },
    );
  }

  Future<void> insertData(Model22 data) async {
    final db = await database;
    await db.insert(databasename, data.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    print("Added" + data.toMap().toString());
  }

  Future<List<Model22>> getAllData() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(databasename);
    return List.generate(maps.length, (i) {
      return Model22.fromMap(maps[i]);
    });
  }
}
class Model22 {
  final int id;
  final String myid;
  final String date;
  final String size;
  final String name;
  final String imagebitmap;

  Model22({
    required this.id,
    required this.myid,
    required this.date,
    required this.size,
    required this.name,
    required this.imagebitmap,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'myid': myid,
      'date': date,
      'size': size,
      'name': name,
      'imagebitmap': imagebitmap,
    };
  }

  factory Model22.fromMap(Map<String, dynamic> map) {
    return Model22(
      id: map['id'],
      myid: map['myid'],
      date: map['date'],
      size: map['size'],
      name: map['name'],
      imagebitmap: map['imagebitmap'],
    );
  }

  @override
  String toString() {
    return 'Model22 {id: $id, myid:'
        ' $myid, date: $date, size: $size,'
        ' name: $name, imagebitmap: $imagebitmap}';
  }

}

/////////
class MyData {
  final String contentdata;
  final double positionX;
  final double positionY;
  final double widgetWidth;
  final double widgetHeight;
  final int index22;
  final int length;
  final String barcodeType;
  final double textSize;
  final bool bold;
  final bool underline;
  final String fromWhere;
  final String type;
  final String address;

  MyData({
    required this.contentdata,
    required this.positionX,
    required this.positionY,
    required this.widgetWidth,
    required this.widgetHeight,
    required this.index22,
    required this.length,
    required this.barcodeType,
    required this.textSize,
    required this.bold,
    required this.underline,
    required this.fromWhere,
    required this.type,
    required this.address,
  });
}
class MyDataModel {
  final String contentData;
  final double positionX;
  final double positionY;
  final double widgetWidth;
  final double widgetHeight;
  final int index;
  final int length;
  final String barcodeType;
  final double textSize;
  final bool bold;
  final bool underline;
  final String fromWhere;
  final String type;
  final String address;

  MyDataModel({
    required this.contentData,
    required this.positionX,
    required this.positionY,
    required this.widgetWidth,
    required this.widgetHeight,
    required this.index,
    required this.length,
    required this.barcodeType,
    required this.textSize,
    required this.bold,
    required this.underline,
    required this.fromWhere,
    required this.type,
    required this.address,
  });
  Map<String, dynamic> toMap() {
    return {
      'contentData': contentData,
      'positionX': positionX,
      'positionY': positionY,
      'widgetWidth': widgetWidth,
      'widgetHeight': widgetHeight,
      'index22': index,
      'length': length,
      'barcodeType': barcodeType,
      'textSize': textSize,
      'bold': bold ? 1 : 0,
      'underline': underline ? 1 : 0,
      'fromWhere': fromWhere,
      'type': type,
      'address': address,
    };
  }
  factory MyDataModel.fromMap(Map<String, dynamic> map) {
    return MyDataModel(

      contentData: map['contentData'],
      positionX: map['positionX'],
      positionY: map['positionY'],
      widgetWidth: map['widgetWidth'],
      widgetHeight: map['widgetHeight'],
      index: map['index22'],
      length: map['length'],
      barcodeType: map['barcodeType'],
      textSize: map['textSize'],
      bold: map['bold'] == 1,
      underline: map['underline'] == 1,
      fromWhere: map['fromWhere'],
      type: map['type'],
      address: map['address'],
    );
  }
  @override
  String toString() {
    return 'MyDataModel {contentData: $contentData, positionX:'
        ' $positionX, positionY: $positionY, widgetWidth: $widgetWidth,'
        ' widgetHeight: $widgetHeight, index: $index, length: $length, barcodeType: $barcodeType, '
        'textSize: $textSize, bold: $bold, underline: $underline, fromWhere: $fromWhere, type: $type, address: $address}';
  }

}
class DatabaseHelper {
  static Database? _database;
  late String databasename;

  DatabaseHelper(this.databasename);

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }


  Future<Database> _initDatabase() async {
    final String dbPath = await getDatabasesPath();
    final String path = join(dbPath, databasename);

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute('''
          CREATE TABLE $databasename(
            id INTEGER PRIMARY KEY,
            contentData TEXT,
            positionX REAL,
            positionY REAL,
            widgetWidth REAL,
            widgetHeight REAL,
            index22 INTEGER,
            length INTEGER,
            barcodeType TEXT,
            textSize REAL,
            bold INTEGER,
            underline INTEGER,
            fromWhere TEXT,
            type TEXT,
            address TEXT
          )
        ''');
      },
    );
  }

  Future<void> insertData(MyDataModel data) async {
    final db = await database;
    await db.insert(databasename, data.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    print("Added" + data.toMap().toString());
  }

  Future<List<MyDataModel>> getAllData() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(databasename);
    return List.generate(maps.length, (i) {
      return MyDataModel.fromMap(maps[i]);
    });
  }

}

//most likely
/*
class DatabaseHelper {
  static Database? _database;
  static const String _dbName = 'my_database.db';
  static const String _tableName = 'my_table';
 late  String databasename;
  DatabaseHelper(this.databasename);



  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final String dbPath = await getDatabasesPath();
    final String path = join(dbPath, _dbName);

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute('''
          CREATE TABLE $_tableName(
            id INTEGER PRIMARY KEY,
            contentData TEXT,
            positionX REAL,
            positionY REAL,
            widgetWidth REAL,
            widgetHeight REAL,
            index22 INTEGER,
            length INTEGER,
            barcodeType TEXT,
            textSize REAL,
            bold INTEGER,
            underline INTEGER,
            fromWhere TEXT,
            type TEXT,
            address TEXT
          )
        ''');
      },
    );
  }

  Future<void> insertData(MyDataModel data) async {
    final db = await database;
    await db.insert(_tableName, data.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    print("Added"+data.toMap().toString());
  }

  Future<List<MyDataModel>> getAllData() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(_tableName);
    return List.generate(maps.length, (i) {
      return MyDataModel(
        contentData: maps[i]['contentData'],
        positionX: maps[i]['positionX'],
        positionY: maps[i]['positionY'],
        widgetWidth: maps[i]['widgetWidth'],
        widgetHeight: maps[i]['widgetHeight'],
        index: maps[i]['index22'],
        length: maps[i]['length'],
        barcodeType: maps[i]['barcodeType'],
        textSize: maps[i]['textSize'],
        bold: maps[i]['bold'] == 1,
        underline: maps[i]['underline'] == 1,
        fromWhere: maps[i]['fromWhere'],
        type: maps[i]['type'],
        address: maps[i]['address'],
      );
    });
    print(maps);
  }
  Future<List<MyDataModel>> getAllData1() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(_tableName);
    return List.generate(maps.length, (i) {
      return MyDataModel(
        contentData: maps[i]['contentData'],
        positionX: maps[i]['positionX'],
        positionY: maps[i]['positionY'],
        widgetWidth: maps[i]['widgetWidth'],
        widgetHeight: maps[i]['widgetHeight'],
        index: maps[i]['index22'],
        length: maps[i]['length'],
        barcodeType: maps[i]['barcodeType'],
        textSize: maps[i]['textSize'],
        bold: maps[i]['bold'] == 1,
        underline: maps[i]['underline'] == 1,
        fromWhere: maps[i]['fromWhere'],
        type: maps[i]['type'],
        address: maps[i]['address'],
      );
    });
  }
  Future<List<MyDataModel>> getAllData3() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(_tableName);
    return List.generate(maps.length, (i) {
      return MyDataModel.fromMap(maps[i]);
    });
  }
}
 */
/*
class MyDataModel {
  final String contentData;
  final String positionX;
  final String positionY;
  final String widgetWidth;
  final String widgetHeight;
  final String index;
  final String length;
  final String barcodeType;
  final String textSize;
  final String bold;
  final String underline;
  final String fromWhere;
  final String type;
  final String address;

  MyDataModel({
    required this.contentData,
    required this.positionX,
    required this.positionY,
    required this.widgetWidth,
    required this.widgetHeight,
    required this.index,
    required this.length,
    required this.barcodeType,
    required this.textSize,
    required this.bold,
    required this.underline,
    required this.fromWhere,
    required this.type,
    required this.address,
  });
}
class DatabaseHelper {
  late Database _database;

  Future<void> initDatabase() async {
    _database = await openDatabase(
      join(await getDatabasesPath(), 'my_database.db'),
      onCreate: (db, version) {
        return db.execute(
          '''
          CREATE TABLE my_table(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            contentData TEXT,
            positionX TEXT,
            positionY TEXT,
            widgetWidth TEXT,
            widgetHeight TEXT,
            index TEXT,
            length TEXT,
            barcodeType TEXT,
            textSize TEXT,
            bold TEXT,
            underline TEXT,
            fromWhere TEXT,
            type TEXT,
            address TEXT
          )
          ''',
        );
      },
      version: 1,
    );
  }

  Future<void> insertData(MyDataModel data) async {
    await _database.insert(
      'my_table',
      {
        'contentData': data.contentData,
        'positionX': data.positionX,
        'positionY': data.positionY,
        'widgetWidth': data.widgetWidth,
        'widgetHeight': data.widgetHeight,
        'index': data.index,
        'length': data.length,
        'barcodeType': data.barcodeType,
        'textSize': data.textSize,
        'bold': data.bold,
        'underline': data.underline,
        'fromWhere': data.fromWhere,
        'type': data.type,
        'address': data.address,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<MyDataModel>> getAllData() async {
    final List<Map<String, dynamic>> maps = await _database.query('my_table');
    return List.generate(maps.length, (i) {
      return MyDataModel(
        contentData: maps[i]['contentData'],
        positionX: maps[i]['positionX'],
        positionY: maps[i]['positionY'],
        widgetWidth: maps[i]['widgetWidth'],
        widgetHeight: maps[i]['widgetHeight'],
        index: maps[i]['index'],
        length: maps[i]['length'],
        barcodeType: maps[i]['barcodeType'],
        textSize: maps[i]['textSize'],
        bold: maps[i]['bold'],
        underline: maps[i]['underline'],
        fromWhere: maps[i]['fromWhere'],
        type: maps[i]['type'],
        address: maps[i]['address'],
      );
    });
  }

}

 */