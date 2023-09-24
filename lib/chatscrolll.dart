
import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:chatfeatures/textmodel.dart';
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

import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';
import 'dart:ui';

import 'package:chatfeatures/chatModel.dart';
import 'package:flutter/material.dart';
import 'package:stomp_dart_client/stomp.dart';
import 'package:stomp_dart_client/stomp_config.dart';
import 'package:stomp_dart_client/stomp_frame.dart';
import 'package:chatfeatures/chatmain.dart';
import 'dart:convert';

class ChatScrollll extends StatefulWidget {
  const ChatScrollll({super.key});

  @override
  State<ChatScrollll> createState() => _ChatScrollllState();
}

class _ChatScrollllState extends State<ChatScrollll> {
  final List<ChatModel> messages = [];
  final TextEditingController textController = TextEditingController();
  final ScrollController scrollController = ScrollController();  void int_loadData() async{
    await fetchLabelDataBySubCategory23();
  }

  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      int_loadData();
    });
    super.initState();

  }

  void _sendMessage(ChatModel message) {
    setState(() {
      messages.add(message);
    });

    // Scroll to the bottom of the list after adding a new message
    scrollController.animateTo(
      scrollController.position.maxScrollExtent+1,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );

    // Clear the input field
    textController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Messenger Chat'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              controller: scrollController,
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(messages[index].message.toString()),
                );
              },
            ),
          ),
          Divider(height: 1),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
            ),
            child: _buildTextComposer(),
          ),
        ],
      ),
    );
  }

  Widget _buildTextComposer() {
    return IconTheme(
      data: IconThemeData(color: Colors.blue),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                controller: textController,
               onSubmitted: (value)
                {
                  ChatModel chatmodel = new ChatModel(messageId:555555,chatId: 4,sentBy: "3",sentTo: "2",message: textController.text.toString(),
                      msgType: "sender",timestmp:"current_date",serverTimestmp: "currentTimeInSeconds".toString() );
                  _sendMessage(chatmodel);
                },
                decoration: InputDecoration.collapsed(
                  hintText: 'Send a message',
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.send),
              onPressed: () {
                ChatModel chatmodel = new ChatModel(messageId:555555,chatId: 4,sentBy: "3",sentTo: "2",message: textController.text.toString(),
                    msgType: "sender",timestmp:"current_date",serverTimestmp: "currentTimeInSeconds".toString() );
                if (textController.text.isNotEmpty) {
                  _sendMessage(chatmodel);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
  Future<void> fetchLabelDataBySubCategory23() async {
    final url =
        'https://grozziie.zjweiting.com:3091/CustomerService-Chat/api/dev/messages/25';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final List<dynamic> labelDataList = json.decode(response.body);
      setState(() {
        messages.clear(); // Clear existing messages
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
          messages.add(data);
        }
      });
    } else {
      print(" Status code: ${response.statusCode}");
      print("Response body: ${response.body}");
    }
  }
}