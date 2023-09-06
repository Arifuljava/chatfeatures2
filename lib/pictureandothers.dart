
import 'package:chatfeatures/chatmain.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';

import 'package:chatfeatures/chatModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:chatfeatures/chatCheck.dart';
import 'package:chatfeatures/chatModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class pictureandothers extends StatefulWidget {
  const pictureandothers({super.key});

  @override
  State<pictureandothers> createState() => _pictureandothersState();
}

class _pictureandothersState extends State<pictureandothers> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope( onWillPop: () async{
      return  await settingsImage(context);
    },child: MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Pictures and Videos"),
        ),
      ),
    ));
  }
  Future<dynamic> settingsImage(BuildContext context) async {

    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => chatmain(

          ),
        ));

  }
}


