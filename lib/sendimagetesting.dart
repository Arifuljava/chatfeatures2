
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
class SendImageToServer extends StatefulWidget {
  const SendImageToServer({super.key});

  @override
  State<SendImageToServer> createState() => _SendImageToServerState();
}
String base64StringAngenl = '';

class _SendImageToServerState extends State<SendImageToServer> {
  String imageToBase64(imageBytes){
    // Read the image file as bytes
    String base64String = base64Encode(imageBytes);

    return base64String;
  }
  Future<void> loadImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final imageBytes = await pickedFile.readAsBytes();
      base64StringAngenl = imageToBase64(imageBytes);
      print(base64StringAngenl);
      setState(() {

      });
      sendMessage(base64StringAngenl,"image","1","2");
    }
    //Navigator.of(context).pop();
  }
  @override
  void initState() {
    // TODO: implement initState
    stompClient.activate();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Send Image"),
        ),
        body: Column(
          children: [
            ElevatedButton(onPressed: () async{
              await loadImage();
            }, child: Text("Select and upload image"))
          ],
        ),
      ),
    );
  }
}
