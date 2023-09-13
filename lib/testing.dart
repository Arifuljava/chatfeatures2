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




class Testing extends StatefulWidget {
  const Testing({super.key});

  @override
  State<Testing> createState() => _TestingState();
}
late Uint8List uint8List;
class _TestingState extends State<Testing> {
  Uint8List? imageBytes;
  bool FlagAngenl=false;
  late Uint8List bytesAngenl;
 // String based = "/9j/4RYLRXhpZgAASUkqAAgAAAARAA4BAgAgAAAA2gAAAA8BAgAgAAAA+gAAABABAgAgAAAAGgEAABIBAwABAAAAAQAAABoBBQABAAAAOgEAABsBBQABAAAAQgEAACgBAwABAAAAAgAAADEBAgAgAAAASgEAADIBAgAUAAAAagEAABMCAwABAAAAAgAAACACBAABAAAAAAAAACECBAABAAAAAAAAACICBAABAAAAAAAAACMCBAABAAAAAAAAACQCBAABAAAAAQAAACUCAgAgAAAAfgEAAGmHBAABAAAAngEAACADAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADVHAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAANUcAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABIAAAAAQAAAEgAAAABAAAATWVkaWFUZWsgQ2FtZXJhIEFwcGxpY2F0aW9uAAAAAAAyMDIzOjA4OjI3IDA1OjM1OjE0AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAGQCaggUAAQAAANACAACdggUAAQAAANgCAAAiiAMAAQAAAAAAAAAniAMAAQAAALYCAAAAkAcABAAAADAyMjADkAIAFAAAAOACAAAEkAIAFAAAAPQCAAABkQcABAAAAAECAwAEkgoAAQAAAAgDAAAHkgMAAQAAAAIAAAAIkgMAAQAAAP8AAAAJkgMAAQAAAAEAAAAKkgUAAQAAABADAACQkgIAAgAAADUyAACRkgIAAgAAADUyAACSkgIAAgAAADUyAAAAoAcABAAAADAxMDABoAMAAQAAAAEAAAACoAQAAQAAAJAHAAADoAQAAQAAACAKAAAFoAQAAQAAAJYDAAACpAMAAQAAAAAAAAADpAMAAQAAAAAAAAAEpAUAAQAAABgDAAAGpAMAAQAAAAAAAAAAAAAA0AEBAEBCDwAYAAAACgAAADIwMjM6MDg6";
String based = "/9j/4RG/RXhpZgAASUkqAAgAAAARAA4BAgAgAAAA2gAAAA8BAgAgAAAA+gAAABABAgAgAAAAGgEAABIBAwABAAAAAQAAABoBBQABAAAAOgEAABsBBQABAAAAQgEAACgBAwABAAAAAgAAADEBAgAgAAAASgEAADIBAgAUAAAAagEAABMCAwABAAAAAgAAACACBAABAAAAAAAAACECBAABAAAAAAAAACICBAABAAAAAAAAACMCBAABAAAAAAAAACQCBAABAAAAAQAAACUCAgAgAAAAfgEAAGmHBAABAAAAngEAACADAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADVHAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAANUcAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABIAAAAAQAAAEgAAAABAAAATWVkaWFUZWsgQ2FtZXJhIEFwcGxpY2F0aW9uAAAAAAAyMDIzOjA4OjAzIDE5OjAwOjU5AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAGQCaggUAAQAAANACAACdggUAAQAAANgCAAAiiAMAAQAAAAAAAAAniAMAAQAAAEwAAAAAkAcABAAAADAyMjADkAIAFAAAAOACAAAEkAIAFAAAAPQCAAABkQcABAAAAAECAwAEkgoAAQAAAAgDAAAHkgMAAQAAAAIAAAAIkgMAAQAAAP8AAAAJkgMAAQAAAAEAAAAKkgUAAQAAABADAACQkgIAAgAAADg2AACRkgIAAgAAADg2AACSkgIAAgAAADg2AAAAoAcABAAAADAxMDABoAMAAQAAAAEAAAACoAQAAQAAAJAHAAADoAQAAQAAACAKAAAFoAQAAQAAAJYDAAACpAMAAQAAAAAAAAADpAMAAQAAAAAAAAAEpAUAAQAAABgDAAAGpAMAAQAAAAAAAAAAAAAAVuoAAEBCDwAYAAAACgAAADIwMjM6MDg6";
String base64StringAngenl="";

  Future<void> loadImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final imageBytes = await pickedFile.readAsBytes();

      setState(() {
        this.imageBytes = imageBytes;

      });
    }
  }

  String convertImageToBase64(Uint8List imageBytes) {
    String base64String = base64Encode(imageBytes);
    return base64String;
  }
  String imageToBase64(imageBytes){
    // Read the image file as bytes
    String base64String = base64Encode(imageBytes);

    return base64String;
  }

 /*
  Uint8List? convertBase64ToUint8List(String base64String) {
    List<int> decodedBytes = base64Decode(base64String);
    print(Uint8List.fromList(decodedBytes));
    return Uint8List.fromList(decodedBytes);
  }
  */
  Uint8List? convertBase64ToUint8List(String base64String) {
    try {
      List<int> decodedBytes = base64Decode(base64String);
      return Uint8List.fromList(decodedBytes);
    } catch (e) {
      // Handle the exception, e.g., log an error message
      print('Error decoding base64 string: $e');
      return null; // Return null or handle the error as needed
    }
  }
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(based.length);
    convertBase64ToUint8List(based);
    setState(() {
      this.imageBytes = convertBase64ToUint8List(based);
      stompClient.activate();
    });


  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Image to Base64'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              if(FlagAngenl)
                  Image.memory(
                    bytesAngenl,
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                  ),



              SizedBox(height: 20),
              ElevatedButton(
                onPressed: loadImage,
                child: Text('Load Image'),
              ),
              SizedBox(height: 20),
              if (imageBytes != null)
                ElevatedButton(
                  onPressed: () {
                    base64StringAngenl = imageToBase64(imageBytes);//convertImageToBase64(imageBytes!);
                    FlagAngenl=false;

                    print('Ariful5555555: $imageBytes');
                   // print('Base64 String: $base64String');
                    print('Ariful66666666: $base64StringAngenl');


                  },
                  child: Text('Convert to Base64'),

                ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Convert the base64 string to Uint8List

                  setState(() {
                    bytesAngenl = base64Decode(jubayer);
                    FlagAngenl=true;
                  });

                  //Image imageII = Image.memory(bytesII);


                },
                child: Text('Convert Base64 to Uint8List'),
              ),
              SizedBox(height: 20,),
              ElevatedButton(onPressed: (){
                sendMessage(base64StringAngenl.toString(),"text","1","2");
              }, child: Text(
                "Send Message"
              ))
            ],
          ),
        ),
      ),
    );
  }
}