

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:chatfeatures/newagain.dart';
import 'package:chatfeatures/chatsection22.dart';

class PickUpTesting extends StatefulWidget {
  const PickUpTesting({super.key});

  @override
  State<PickUpTesting> createState() => _PickUpTestingState();
}

class _PickUpTestingState extends State<PickUpTesting> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    intqqq();
    stompClient.activate();
  }
  void intqqq() async
  {
    await fetchAndDisplayImageFromApi();
  }
  Future<void> fetchAndDisplayImageFromApi() async {
    final apiUrl =
        'http://web-api-tht-env.eba-kcaa52ff.us-east-1.elasticbeanstalk.com/api/dev/messages/78';

    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final List<dynamic> responseData = jsonDecode(response.body);

      if (responseData.isNotEmpty) {
        // Assuming the first item in the list contains the base64 image
        final Map<String, dynamic> firstItem = responseData[0];
        final String base64Image = firstItem['message']; // Assuming 'image' key exists
        print(base64Image);
        setState(() {
         // imageUrl = base64Image;
        });
      } else {
        // Handle empty response
        print('API response is empty.');
      }
      /*
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      final String base64Image = responseData['message']; // Assuming the API response contains the base64 image
      setState(() {

      });
       */
    } else {
      // Handle error
      print('Error fetching image from API: ${response.statusCode}');
    }
  }
  String base64Image = '';

  Future<void> pickAndUploadImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      List<int> imageBytes = await pickedFile.readAsBytes();
      String base64String = base64Encode(imageBytes);
      final StringBuffer buffer = StringBuffer();
      for (int byte in imageBytes) {
        buffer.write(byte.toRadixString(16).padLeft(2, '0'));
      }
      print(buffer);
      setState(() {
        base64Image = base64String;
       // jubayer = base64String;
      });

      // Send the base64 image to the server
     // await send(base64Image);
      await sendChatMessage2222(buffer.toString());
    }
  }

  Future<void> uploadImageToServer(String base64Image) async {
    final apiUrl =
        'http://web-api-tht-env.eba-kcaa52ff.us-east-1.elasticbeanstalk.com/api/dev/upload';

    final response = await http.post(
      Uri.parse(apiUrl),
      body: jsonEncode({'message': base64Image}),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200||response.statusCode == 201) {
      // Handle success
      print('Image uploaded successfully.');
    } else {
      // Handle error
      print('Error uploading image: ${response.statusCode}');
    }
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Image Upload to Server Example'),
        ),
        body: Column(
          children: [
            ElevatedButton(
              onPressed: pickAndUploadImage,
              child: Text('Pick and Upload Image'),
            ),
            SizedBox(height: 20.0),
            base64Image.isNotEmpty
                ? Image.memory(
              base64Decode(base64Image),
              width: 200,
              height: 200,
            )
                : Container(),
          ],
        ),
      ),
    );
  }
  //
  Future<void> sendChatMessage2222(String sendmessage) async {
    final url = 'http://web-api-tht-env.eba-kcaa52ff.us-east-1.elasticbeanstalk.com/api/dev/messages'; // Replace with your API URL

    final Map<String, dynamic> messageData = {
      "chatId": 4,
      "sentBy": "3",
      "sentTo": "2",
      "message":sendmessage,
      "msgType": "sender",
      "timestmp": "2023-08-31T08:11:05.814+00:00"
    };


    final headers = {
      'Content-Type': 'application/json', // Set the content type to JSON
    };

    final String jsonBody = json.encode(messageData);
    print(jsonBody);

    final response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: jsonBody,
    );



    if (response.statusCode == 200) {
      final Map<String, dynamic> responseBody = json.decode(response.body);
      print('Message sent successfully.');


      // Add the sent message to the list and update the UI

    }
    else if (response.statusCode == 201) {
      final Map<String, dynamic> responseBody = json.decode(response.body);

      print('Message sent successfully.');

    }else {
      print('Failed to send message. Status code: ${response.statusCode}');
      print('Response body: ${response.body}');
    }
  }
}
