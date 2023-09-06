

import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'dart:io';
import 'package:image_picker/image_picker.dart';


class videoconvert extends StatefulWidget {
  const videoconvert({super.key});

  @override
  State<videoconvert> createState() => _videoconvertState();
}

class _videoconvertState extends State<videoconvert> {
  File? _selectedVideo;
  String? _base64Video;

  Future<void> _selectAndConvertVideo() async {
    final videoFile = await selectVideo();
    if (videoFile != null) {
      final base64Video = await convertVideoToBase64(videoFile);
      setState(() {
        _selectedVideo = videoFile;
        _base64Video = base64Video;
        print(_base64Video);
      });
    }
  }

  Future<File?> selectVideo() async {
    final picker = ImagePicker();
   // final pickedFile = await picker.getVideo(source: ImageSource.gallery);
    final pickedFile = await picker.pickVideo(source: ImageSource.gallery);

    //print( File(pickedFile!.path));
    if (pickedFile != null) {
      return File(pickedFile.path);
    } else {
      return null;
    }
  }

  Future<String?> convertVideoToBase64(File videoFile) async {
    if (videoFile != null) {
      final Uint8List videoBytes = await videoFile.readAsBytes();
      final String base64Video = base64Encode(videoBytes);
      return base64Video;
    }
    return null;
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Video To Base64 Converter"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            ElevatedButton(
              onPressed: _selectAndConvertVideo,
              child: Text("Select and Convert Video"),
            ),
            if (_base64Video != null)
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text("Base64 Video:\n$_base64Video"),
              ),
          ],
        ),
      ),
    );
  }
}
