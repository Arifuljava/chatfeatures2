
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

class PollingData extends StatefulWidget {
  const PollingData({super.key});

  @override
  State<PollingData> createState() => _PollingDataState();
}

class _PollingDataState extends State<PollingData> {
  List<ChatModel> messages = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _startPollingAPI();
  }
  void _startPollingAPI() {
    // Create a timer to poll the API every 5 seconds (adjust as needed)
    Timer.periodic(Duration(seconds: 1), (timer) {
      _fetchDataFromAPI();
    });
  }

  Future<void> _fetchDataFromAPI() async {
    final url = 'http://web-api-tht-env.eba-kcaa52ff.us-east-1.elasticbeanstalk.com/api/dev/messages/4';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final List<dynamic> labelDataList = json.decode(response.body);
        setState(() {
          messages.clear();
          for (var item in labelDataList) {
            final chatModel = ChatModel.fromJson(item);
            messages.add(chatModel);
            print(messages);
          }
        });
      } else {
        print("Status code: ${response.statusCode}");
        print("Response body: ${response.body}");
      }
    } catch (e) {
      print("Error fetching data: $e");
    }
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Text SMS"),
        ),
        body: ListView.builder(
          itemCount: messages.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(messages[index].message.toString()),
            );
          },
        ),
      ),
    );
  }
}
