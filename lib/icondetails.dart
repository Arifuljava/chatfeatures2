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

class Icontest extends StatefulWidget {
  const Icontest({super.key});

  @override
  State<Icontest> createState() => _IcontestState();
}

class _IcontestState extends State<Icontest> {
  //String detas = "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";
  String detas = "";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Base64 Image Example'),
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(4), // Added margin around the icon
            child: Container(
              width: 35, // Set the desired width (same as height for a circle)
              height: 35, // Set the desired height (same as width for a circle)
              decoration: BoxDecoration(
                shape: BoxShape.circle, // Make it a circle
                color: Colors.blue, // Set the background color to blue
              ),
              child: Center(
                child: Base64ImageWidget(base64String: detas,selection: "1",),
              ),
            ),
          ),
        ),
      ),

    );
  }
}
class Base64ImageWidget extends StatelessWidget {
  final String? base64String;
  final String? selection;

  Base64ImageWidget({
    required this.base64String,
    required this.selection
  });

  @override
  Widget build(BuildContext context) {
    print(base64String);

    if (base64String!.isEmpty) {
      print("based");
      if(selection=="1")
        {
          return Icon(Icons.person, size: 25.0, color: Colors.white);
        }
      else{
        return Icon(Icons.person, size: 25.0, color: Colors.black);
      }




    } else {
      // Return an icon (e.g., a placeholder icon) when base64String is null
      final imageBytes = base64Decode(base64String!);
      return Image.memory(Uint8List.fromList(imageBytes));
    }
  }
}

/*
class Base64ImageWidget extends StatelessWidget {
  final String base64String;

  Base64ImageWidget({
    required this.base64String,
  });

  @override
  Widget build(BuildContext context) {
    final imageBytes = base64Decode(base64String);

    return Image.memory(Uint8List.fromList(imageBytes));
  }
}
 */