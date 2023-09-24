

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
import 'package:flutter/services.dart';
import 'package:stomp_dart_client/stomp.dart';
import 'package:stomp_dart_client/stomp_config.dart';
import 'package:stomp_dart_client/stomp_frame.dart';
import 'package:chatfeatures/newagain.dart';

/*
class ScrollDownList extends StatefulWidget {
  const ScrollDownList({super.key});

  @override
  State<ScrollDownList> createState() => _ScrollDownListState();
}

class _ScrollDownListState extends State<ScrollDownList> {
  ScrollController _scrollController = ScrollController();
  List<ChatModel> items =[];
  @override
  void initState() {
    super.initState();
    initDatabase();
    // Scroll to the bottom when the ListView is initially loaded
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _scrollToBottom();
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('ListView Scrolling Example'),
        ),
        body: ListView.builder(
          controller: _scrollController,
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(items[index].messageId.toString()),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Simulate adding new data

            // Scroll to the bottom after adding new data
            _scrollToBottom();
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  void _scrollToBottom() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
  Future<void> fetchLabelDataBySubCategory23() async {
    final url =
        'https://grozziie.zjweiting.com:3091/CustomerService-Chat/api/dev/messages';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final List<dynamic> labelDataList = json.decode(response.body);
      print(labelDataList);
      setState(() {
        // Clear existing messages
        for (var item in labelDataList) {


          final messageId = item['messageId'];
          final chatId = item['chatId'];
          final sentBy = item['sentBy'];
          final sentTo = item['sentTo'];
          final message = item['message'];
          final msgType = item['msgType'];
          final timestmp = item['timestmp'];
          final serverTimestmp = item['serverTimestmp'];

          final data = ChatModel(
              messageId: messageId,
              chatId: chatId,
              sentBy: sentBy.toString(),
              sentTo: sentTo.toString(),
              message: message.toString(),
              msgType: msgType.toString(),
              timestmp: timestmp.toString(),
              serverTimestmp: serverTimestmp.toString());
          //print(data);
          items.add(data);

        }
      });
    } else {
      print(" Status code: ${response.statusCode}");
      print("Response body: ${response.body}");
    }
  }

  void initDatabase()  async{
    await fetchLabelDataBySubCategory23();
  }
}
 */
class ScrollDownList extends StatefulWidget {
  const ScrollDownList({super.key});

  @override
  State<ScrollDownList> createState() => _ScrollDownListState();
}

class _ScrollDownListState extends State<ScrollDownList> {
  ScrollController _scrollController = ScrollController();
  List<ChatModel> items = [];

  @override
  void initState() {
    super.initState();
    initDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('ListView Scrolling Example'),
        ),
        body: ListView.builder(
          controller: _scrollController,
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(items[index].message.toString()),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Simulate adding new data

            // Scroll to the bottom after adding new data
            _scrollToBottom();
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  void _scrollToBottom() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  Future<void> fetchLabelDataBySubCategory23() async {
    final url =
        'https://grozziie.zjweiting.com:3091/CustomerService-Chat/api/dev/messages';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final List<dynamic> labelDataList = json.decode(response.body);
      print(labelDataList);
      setState(() {
        // Clear existing messages
        items.clear(); // Clear existing messages
        for (var item in labelDataList) {
          final messageId = item['messageId'];
          final chatId = item['chatId'];
          final sentBy = item['sentBy'];
          final sentTo = item['sentTo'];
          final message = item['message'];
          final msgType = item['msgType'];
          final timestmp = item['timestmp'];
          final serverTimestmp = item['serverTimestmp'];

          final data = ChatModel(
            messageId: messageId,
            chatId: chatId,
            sentBy: sentBy.toString(),
            sentTo: sentTo.toString(),
            message: message.toString(),
            msgType: msgType.toString(),
            timestmp: timestmp.toString(),
            serverTimestmp: serverTimestmp.toString(),
          );
          items.add(data);
        }
        // Scroll to the bottom after adding new data
        _scrollToBottom();
      });
    } else {
      print("Status code: ${response.statusCode}");
      print("Response body: ${response.body}");
    }
  }

  void initDatabase() async {
    await fetchLabelDataBySubCategory23();
  }
}

void main() {
  runApp(MaterialApp(
    home: ScrollDownList(),
  ));
}