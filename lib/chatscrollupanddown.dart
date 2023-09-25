
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

class ScrollUpAndDown extends StatefulWidget {
  const ScrollUpAndDown({super.key});

  @override
  State<ScrollUpAndDown> createState() => _ScrollUpAndDownState();
}

class _ScrollUpAndDownState extends State<ScrollUpAndDown> {
  final List<ChatModel> messages = [];
  final List<ChatModel> messages22 = [];
  final TextEditingController textController = TextEditingController();
  final ScrollController scrollController = ScrollController();
  bool shouldScrollToBottom = true;

  void int_loadData() async {
    await fetchLabelDataBySubCategory23();
  }

  @override
  void initState() {
    super.initState();
    int_loadData();
  }

  void _sendMessage(ChatModel message) {
    setState(() {
      messages22.add(message);
    });

    if (shouldScrollToBottom) {
      // Scroll to the bottom of the list after adding a new message
      scrollController.animateTo(
        scrollController.position.maxScrollExtent + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }

    textController.clear();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.lightBlue,
          flexibleSpace: SafeArea(
            child: Container(
              padding: EdgeInsets.only(right: 16),
              child: Row(
                children: <Widget>[
                  IconButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back,color: Colors.white,),
                  ),
                  SizedBox(width: 2,),
                  CircularImage(source: 'https://senzary.com/wp-content/uploads/2019/01/person2.jpg',radius: 20,),
                  SizedBox(width: 12,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Kriss Benwat",style: TextStyle( fontSize: 16 ,fontWeight: FontWeight.w600),),
                        SizedBox(height: 6,),
                        Text("Online",style: TextStyle(color: Colors.grey.shade600, fontSize: 13),),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () async{
                      await settingsImage(context);
                    },
                    child: Icon(Icons.settings,color: Colors.black54,),
                  ),
                ],
              ),
            ),
          ),
        ),
          body: Stack(
            children: <Widget>[
              ListView.builder(
                key: UniqueKey(),
                controller: scrollController, // Replace _scrollController with your ScrollController
                itemCount: messages22.length + messages.length, // Combine both message lists
                shrinkWrap: true,
                padding: EdgeInsets.only(top: 10, bottom: 60), // Adjust the padding as needed
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  if (index < messages22.length) {
                    // Render your sent and received messages (messages22) here
                    return Container(
                      padding: EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 10),
                      child: Align(
                        alignment: (messages22[index].sentBy == "1"
                            ? Alignment.topLeft
                            : Alignment.topRight),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: (messages22[index].sentBy == "1"
                                ? Colors.grey.shade200
                                : Colors.blue[200]),
                          ),
                          padding: EdgeInsets.all(16),
                          child: Text(
                            messages22[index].message.toString(),
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ),
                    );
                  } else {
                    // Render messages fetched from API (messages) here
                    final apiMessageIndex = index - messages22.length;
                    return Container(
                      padding: EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 10),
                      child: Align(
                        alignment: (messages[apiMessageIndex].sentBy == "1"
                            ? Alignment.topLeft
                            : Alignment.topRight),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: (messages[apiMessageIndex].sentBy == "1"
                                ? Colors.grey.shade200
                                : Colors.blue[200]),
                          ),
                          padding: EdgeInsets.all(16),
                          child: Text(
                            messages[apiMessageIndex].message.toString(),
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ),
                    );
                  }
                },
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
                  height: 60,
                  width: double.infinity,
                  color: Colors.white,
                  child: Row(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          print("getFiles");
                          // Show file picker or attachment options here
                        },
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            color: Colors.lightBlue,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                      SizedBox(width: 15),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Write message...",
                            hintStyle: TextStyle(color: Colors.black54),
                            border: InputBorder.none,
                          ),
                          controller: textController,
                        ),
                      ),
                      SizedBox(width: 15),
                      FloatingActionButton(
                        onPressed: () async {
                          String message_tobesend =
                          textController.text.toString();
                          print(message_tobesend);

                          if (message_tobesend.toString().isEmpty) {
                            print("Empty");
                            // Handle empty message
                          } else {
                            setState(() {
                              print("NON Empty");

                              // Send message and add to messages22
                              sendMessage(
                                  message_tobesend.toString(),
                                  "text",
                                  "1",
                                  "2"); // Replace with your actual message sending function
                              FocusScope.of(context).unfocus();
                              final random = Random();
                              int randomNumber = random.nextInt(100);
                              int currentTimeInMillis =
                                  DateTime.now().millisecondsSinceEpoch;
                              int currentTimeInSeconds =
                                  currentTimeInMillis ~/ 1000;
                              ChatModel chatmodel = new ChatModel(
                                messageId: randomNumber,
                                chatId: 4,
                                sentBy: "3",
                                sentTo: "2",
                                message: message_tobesend.toString(),
                                msgType: "text",
                                timestmp: "current_date",
                                serverTimestmp:
                                currentTimeInSeconds.toString(),
                              );
                              _sendMessage(chatmodel);

                              textController.text = "";
                              showMyToast("Message Send");
                            });
                          }
                        },
                        child: Icon(
                          Icons.send,
                          color: Colors.white,
                          size: 18,
                        ),
                        backgroundColor: Colors.blue,
                        elevation: 0,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )

      ),
    );
  }
  void showMyToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT, // Duration of the toast
      gravity: ToastGravity.BOTTOM,    // Position of the toast
      timeInSecForIosWeb: 1,           // Time to show on iOS
      backgroundColor: Colors.grey,    // Background color of the toast
      textColor: Colors.white,         // Text color of the toast
      fontSize: 16.0,                  // Font size of the message
    );
  }
  Future<dynamic> settingsImage(BuildContext context) async {

    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => pictureandothers(

          ),
        ));

  }
  Future<void> fetchLabelDataBySubCategory23() async {
    // Fetch your API data for messages and populate the 'messages' list here
    // Replace this with your actual API call
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
         // messages.add(data);
        }
      });
    } else {
      print(" Status code: ${response.statusCode}");
      print("Response body: ${response.body}");
    }
  }
}




