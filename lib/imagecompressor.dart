
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
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';

class ImageCompressor extends StatefulWidget {
  const ImageCompressor({super.key});

  @override
  State<ImageCompressor> createState() => _ImageCompressorState();
}
String base64StringAngenl= '';
class _ImageCompressorState extends State<ImageCompressor> {

  Future<void> pickAndCompressImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      // Get the path of the picked image file
      final imagePath = pickedFile.path;

      // Define the compression quality (0.4 means 40% quality)
      final quality = 40;

      // Compress the image
      final List<int> compressedImage = (await FlutterImageCompress.compressWithFile(
        imagePath,
        quality: quality,
      )) as List<int>;

      // Now, 'compressedImage' contains the compressed image data
      // You can use it as needed, for example, upload it to a server or display it in your app.
      base64StringAngenl = imageToBase64(compressedImage);
      print(base64StringAngenl);

      // Print the size before and after compression for demonstration
      final originalSize = File(imagePath).lengthSync();
      final compressedSize = compressedImage.length;
      print('Original Size: $originalSize bytes');
      print('Compressed Size: $compressedSize bytes');
    }
  }
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
     print(imageBytes);
    }
    //Navigator.of(context).pop();
  }
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     home: Scaffold(
       appBar: AppBar(
         title: Text("Image  Compressor"),
       ),
       body: Column(
         children: [
           ElevatedButton(onPressed: () async{
await pickAndCompressImage();
           }, child: Text("Pick Image"))
         ],
       ),
     ),
   );
  }
}
