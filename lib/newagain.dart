

import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:chatfeatures/chatModel.dart';
import 'package:stomp_dart_client/stomp.dart';
import 'package:stomp_dart_client/stomp_config.dart';
import 'package:stomp_dart_client/stomp_frame.dart';
import 'package:chatfeatures/chatmain.dart';

void onConnect(StompFrame frame) {
  print("Connected");
  stompClient.subscribe(
    destination: '/topic/2',
    callback: (frame) {
      final Map<String, dynamic> responseBody = json.decode(frame.body!);
      final labelDataListData = responseBody['body'];
      final chatModel = ChatModel.fromJson(labelDataListData);
      print(chatModel);

    },
  );

}
void  sendMessage(String  message){


  String current_date = '';
  DateTime now = DateTime.now();
  final random = Random();
  int randomNumber = random.nextInt(100);
  int currentTimeInMillis = DateTime.now().millisecondsSinceEpoch;
  int year = now.year;
  int  month = now.month;
  int day = now.day;
  int  hour = now.hour;
  int min = now.minute;
  int second = now.second;

  current_date = '$hour:$min:$second ,$day/$month/$year';
  // Convert milliseconds to seconds
  int currentTimeInSeconds = currentTimeInMillis ~/ 1000;
  final Map<String, dynamic> messageData = {
    "chatId": 4,
    "sentBy": "3",
    "sentTo": "2",
    "message": message,
    "msgType": "sender",
    "timestmp": current_date,
  };
  stompClient.send(
    destination: '/app/messages',
    body: json.encode(messageData),
  );
  print("Message  Send");

}
final stompClient = StompClient(
  config: StompConfig(
    url: 'ws://web-api-tht-env.eba-kcaa52ff.us-east-1.elasticbeanstalk.com/websocket',
    onConnect: onConnect,
    beforeConnect: () async {
      print('waiting to connect...');
      await Future.delayed(Duration(milliseconds: 200));
      print('connecting...');
    },
    onWebSocketError: (dynamic error) => print("Closed $error"),
    onStompError: (StompFrame frame)
    {
      print("Stomp Error");
    },
    stompConnectHeaders: {'Authorization': 'Bearer yourToken'},
    webSocketConnectHeaders: {'Authorization': 'Bearer yourToken'},
  ),
);

void main() {
  stompClient.activate();
}