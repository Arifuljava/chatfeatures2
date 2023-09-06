
import 'dart:convert';
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

class imagetobyteconvert extends StatefulWidget {
  const imagetobyteconvert({super.key});

  @override
  State<imagetobyteconvert> createState() => _imagetobyteconvertState();
}
Future<Uint8List> loadImageAsUint8List(String imagePath) async {
  final ByteData data = await rootBundle.load(imagePath);
  return data.buffer.asUint8List();
}
Future<String> convertUint8ListToBase64(Uint8List uint8List) async {
  return base64Encode(uint8List);
}
void convertImageToBase64() async {
  try {
    final Uint8List imageUint8List = await loadImageAsUint8List('assets/images/businessman.png'); // Replace with your image path
    final String base64String = await convertUint8ListToBase64(imageUint8List);
    print(base64String);

    // Do something with the base64String, like sending it to a server or displaying it.
  } catch (e) {
    print('Error: $e');
  }
}

class _imagetobyteconvertState extends State<imagetobyteconvert> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Binary 64 Convert"),
        ),
        body: Center(
          child: ElevatedButton(onPressed: () async{
             convertImageToBase64();
          },
            child: Text("Convert To Binary"),

          ),
        ),
      ),
    );
  }
}
