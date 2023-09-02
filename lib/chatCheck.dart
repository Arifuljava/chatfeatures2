
import 'dart:convert';

import 'package:chatfeatures/chatModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class chatCheck extends StatefulWidget {


  const chatCheck({super.key});

  @override
  State<chatCheck> createState() => _chatCheckState();
}
Future<void> postData(int messageId, int  chatId, String sentBy, String sentTo,  String message,  String msgType, String timestmp, String serverTimestmp,
    String whom_id) async {
  final Map<String, dynamic> data = {
    'chatId': chatId,
    'sentBy': sentBy,
    'sentTo': sentTo,
    'message': message,
    'msgType': msgType,
    'timestmp': timestmp,
    'serverTimestmp': serverTimestmp,
  };
print(jsonEncode(data));
  final response = await http.post(
    Uri.parse('http://web-api-tht-env.eba-kcaa52ff.us-east-1.elasticbeanstalk.com/api/dev/messages/$whom_id'),
    body: jsonEncode(data),
    headers: {
      'Content-Type': 'application/json', // Set the content type as JSON
    },
  );

  if (response.statusCode == 200) {
    // Parse the response JSON if needed
    final jsonResponse = json.decode(response.body);
    // Handle the response data here
    print("Done");
  } else {
    // Handle errors

    print("Failed to fetch label data. Status code: ${response.statusCode}");
    print("Response body: ${response.body}");
    print("Failed to fetch label data. Status code: ${response.statusCode}");
    print("Response body: ${response.body}");
  }
}
class _chatCheckState extends State<chatCheck> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sendSMS();
  }
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  void sendSMS() async {
    await postData(4,6,"1","2","Hlw THT","text","2023-08-31T08:11:05.814+00:00","2023-08-31 08:12:37.195","1");
   await sendChatMessage2222();
  }
  Future<void> fetchLabelDataBySubCategory23() async {
    final url = 'http://web-api-tht-env.eba-kcaa52ff.us-east-1.elasticbeanstalk.com/api/dev/messages/1';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final List<dynamic> labelDataList = json.decode(response.body);
      for (var item in labelDataList) {
        final chatModel = ChatModel.fromJson(item);
        chatModelsList.add(chatModel);
      }


      print(chatModelsList);
    } else {
      print(" Status code: ${response.statusCode}");
      print("Response body: ${response.body}");
    }
  }
  final List<ChatModel> chatModelsList = [];


  Future<void> sendChatMessage2222() async {
    final url = 'http://web-api-tht-env.eba-kcaa52ff.us-east-1.elasticbeanstalk.com/api/dev/messages'; // Replace with your API URL

    final Map<String, dynamic> messageData = {
      "chatId": 4,
      "sentBy": "3",
      "sentTo": "2",
      "message": "Tamim  is a good batsman",
      "msgType": "sender",
      "timestmp": "2023-08-31T08:11:05.814+00:00"
    };

    final headers = {
      'Content-Type': 'application/json', // Set the content type to JSON
    };

    final String jsonBody = json.encode(messageData);

    final response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: jsonBody,
    );

    if (response.statusCode == 200) {
      print('Message sent successfully.');
    }
    else if (response.statusCode == 201) {
      print('Message sent successfully.');
    }else {
      print('Failed to send message. Status code: ${response.statusCode}');
      print('Response body: ${response.body}');
    }
  }

}
