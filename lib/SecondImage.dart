import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';



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
        image BLOB
      )
    ''');
  }

  Future<void> insertImage(Uint8List imageBytes) async {
    final db = await instance.database;

    await db.insert(
      'images',
      {'image': imageBytes},
    );
  }

  Future<List<Map<String, dynamic>>> getImages() async {
    final db = await instance.database;

    return db.query('images');
  }
}

Future<Uint8List> loadImageBytes(String imagePath) async {
  ByteData data = await rootBundle.load(imagePath);
  return data.buffer.asUint8List();
}

class SecondImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image Database Example',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Database Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: loadImageAndInsert,
              child: Text('Load Image and Insert'),
            ),
            ElevatedButton(
              onPressed: retrieveImages,
              child: Text('Retrieve Images'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> loadImageAndInsert() async {
    Uint8List imageBytes = await loadImageBytes('assets/images/businessman.png');

    await DatabaseHelper.instance.insertImage(imageBytes);

    print("Image inserted into the database.");
  }

  Future<void> retrieveImages() async {
    List<Map<String, dynamic>> imageMaps = await DatabaseHelper.instance.getImages();

    List<Uint8List> images = [];
    for (var imageMap in imageMaps) {
      Uint8List imageBytes = imageMap['image'];
      images.add(imageBytes);
    }
    print(images);

    // Use the retrieved images as needed
    // For example, you could display them in a ListView
  }
}
