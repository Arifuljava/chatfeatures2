

import 'dart:convert';

import 'package:chatfeatures/chatModel.dart';
import 'package:http/http.dart' as http;

class Chat_Network {
  // server ip

  String url = 'http://web-api-tht-env.eba-kcaa52ff.us-east-1.elasticbeanstalk.com/api/dev/';

  Future<void> postData(String messageId, String  chatId, String sentBy, String sentTo,  String message,  String msgType, String timestmp, String serverTimestmp,
      String whom_id) async {
    final Map<String, dynamic> data = {
      'messageId': messageId,
      'chatId': chatId,
      'sentBy': sentBy,
      'sentTo': sentTo,
      'message': message,
      'msgType': msgType,
      'timestmp': timestmp,
      'serverTimestmp': serverTimestmp,
    };

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
      throw Exception('Failed to post data');
    }
  }
  final List<ChatModel> chatModelsList = [];

}