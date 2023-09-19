
import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:stomp_dart_client/stomp.dart';
import 'package:stomp_dart_client/stomp_config.dart';
import 'package:stomp_dart_client/stomp_frame.dart';
import 'package:chatfeatures/newagain.dart';

import 'package:chatfeatures/pictureandothers.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:chatfeatures/chatModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:chatfeatures/chatCheck.dart';
import 'package:chatfeatures/chatModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:circular_image/circular_image.dart';
import 'package:image/image.dart' as img;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//base 64
import 'dart:convert';
import 'dart:typed_data';


class FontSolved extends StatefulWidget {
  const FontSolved({super.key});

  @override
  State<FontSolved> createState() => _FontSolvedState();
}

class _FontSolvedState extends State<FontSolved> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
    //  String encodedString = "ç³æ¶";
      String encodedString = "Arif";
      List<int> bytes = encodedString.codeUnits;

// Decode the bytes using UTF-8 encoding to get the Chinese string
      String chineseString = utf8.decode(bytes);

      print(chineseString); // This should print the Chinese string

      int_loadData();
    });
  }
  @override
  Widget build(BuildContext context) {

    List<String> messages2222 = [
      "Hello, ç³æ¶, হ্যালো", // Example text with Chinese and Bengali characters
      "This is a test message",
    ];


    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Multi-Language Text Example'),
        ),
        body: ListView.builder(
          itemCount: messages22.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.all(8.0),
              child: Card(
                child: ListTile(
                  title: Padding(
                    padding: EdgeInsets.all(4),
                    child: Text(
                      String.fromCharCodes(
                        messages22[index].message.toString().codeUnits,
                      ),
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
  final StreamController<List<ChatModel>> _listStreamController =
  StreamController<List<ChatModel>>.broadcast();
  List<ChatModel> messages22 = [];
  late Uint8List uint8List;
  late List<Uint8List> bytesAngelList = [];
  late List<Uint8List> bytesAngelList_sender = [];
  late int angenl_index=0;
  void int_loadData() async{
    await fetchLabelDataBySubCategory23();
  }
  //late List<int> decodedBytes;
  List<Uint8List> uint8ListList = [];
  List<String> textMessageList = [];
  late   Uint8List uint8List22  ;
  Future<void> fetchLabelDataBySubCategory23() async {
    final url =
        'http://web-api-tht-env.eba-kcaa52ff.us-east-1.elasticbeanstalk.com/api/dev/messages/890';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final List<dynamic> labelDataList = json.decode(response.body);
      setState(() {
        messages22.clear(); // Clear existing messages
        for (var item in labelDataList) {
          final chatModel = ChatModel.fromJson(item);
          final messageId = item['messageId'];
          final chatId = item['chatId'];
          final sentBy = item['sentBy'];
          final sentTo = item['sentTo'];
          final message = item['message'];
          final msgType = item['msgType'];
          final timestmp = item['timestmp'];
          final serverTimestmp = item['serverTimestmp'];
          String encodedString = message;
          List<int> bytes = encodedString.codeUnits;
          String chineseString = utf8.decode(bytes);
          final data = ChatModel(

              messageId: messageId,
              chatId: chatId,
              sentBy: sentBy,
              sentTo: sentTo,
              message: chineseString,
              msgType: msgType,
              timestmp: timestmp,
              serverTimestmp: serverTimestmp

          );
          print(data);
          messages22.add(data);
         // textMessageList.add(chineseString);
        }

      });
    } else {
      print(" Status code: ${response.statusCode}");
      print("Response body: ${response.body}");
    }
  }
}