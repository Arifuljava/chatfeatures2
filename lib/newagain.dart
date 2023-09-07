

import 'dart:async';
import 'dart:convert';

import 'package:chatfeatures/chatModel.dart';
import 'package:stomp_dart_client/stomp.dart';
import 'package:stomp_dart_client/stomp_config.dart';
import 'package:stomp_dart_client/stomp_frame.dart';

void onConnect(StompFrame frame) {
  print("Connected");
  stompClient.subscribe(
    destination: '/topic/greetings',
    callback: (frame) {
      print("List");
      print(frame);
      final Map<String, dynamic> responseBody = json.decode(frame.body!);
      final chatModel = ChatModel.fromJson(responseBody);

      print(chatModel);
      //List<dynamic>? result = json.decode(frame.body!);

     // print(result);
    },
  );
  final Map<String, dynamic> messageData = {
    "chatId": 4,
    "sentBy": "3",
    "sentTo": "2",
    "message": "sendmessage",
    "msgType": "sender",
    "timestmp": "2023-08-31T08:11:05.814+00:00"
  };
  Timer.periodic(Duration(seconds: 10), (_) {
    stompClient.send(
      destination: '/app/hello',
      body: json.encode(messageData),
    );
  });
}

final stompClient = StompClient(
  config: StompConfig(
    url: 'ws://web-api-tht-env.eba-kcaa52ff.us-east-1.elasticbeanstalk.com/gs-guide-websocket',
    onConnect: onConnect,
    beforeConnect: () async {
      print('waiting to connect...');
      await Future.delayed(Duration(milliseconds: 200));
      print('connecting...');
    },
    onWebSocketError: (dynamic error) => print(error.toString()),
    stompConnectHeaders: {'Authorization': 'Bearer yourToken'},
    webSocketConnectHeaders: {'Authorization': 'Bearer yourToken'},
  ),
);

void main() {
  stompClient.activate();
}