import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
class recentsectionsqllite extends StatefulWidget {
  const recentsectionsqllite({super.key});

  @override
  State<recentsectionsqllite> createState() => _recentsectionsqlliteState();
}

class _recentsectionsqlliteState extends State<recentsectionsqllite> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
class ContentData {
  int id; // auto-generated primary key
  String content;
  int positionX;
  int positionY;
  int widgetWidth;
  int widgetHeight;
  int index;
  int length;
  String barcodeType;
  double textSize;
  bool isBold;
  bool isUnderline;
  String fromWhere;
  String type;
  String address;

  ContentData({
    required this.id,
    required this.content,
    required this.positionX,
    required  this.positionY,
    required  this.widgetWidth,
    required  this.widgetHeight,
    required this.index,
    required this.length,
    required  this.barcodeType,
    required this.textSize,
    required this.isBold,
    required   this.isUnderline,
    required  this.fromWhere,
    required this.type,
    required this.address,
  });

  Map<String, dynamic> toMap() {
    return {
      'content': content,
      'positionX': positionX,
      'positionY': positionY,
      'widgetWidth': widgetWidth,
      'widgetHeight': widgetHeight,
      'index': index,
      'length': length,
      'barcodeType': barcodeType,
      'textSize': textSize,
      'isBold': isBold ? 1 : 0,
      'isUnderline': isUnderline ? 1 : 0,
      'fromWhere': fromWhere,
      'type': type,
      'address': address,
    };
  }

  factory ContentData.fromMap(Map<String, dynamic> map) {
    return ContentData(
      id: map['id'],
      content: map['content'],
      positionX: map['positionX'],
      positionY: map['positionY'],
      widgetWidth: map['widgetWidth'],
      widgetHeight: map['widgetHeight'],
      index: map['index'],
      length: map['length'],
      barcodeType: map['barcodeType'],
      textSize: map['textSize'],
      isBold: map['isBold'] == 1,
      isUnderline: map['isUnderline'] == 1,
      fromWhere: map['fromWhere'],
      type: map['type'],
      address: map['address'],
    );
  }
}

