

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
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/io.dart';

import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:stomp_dart_client/stomp.dart';
import 'package:stomp_dart_client/stomp_frame.dart';

import 'dart:async';
import 'dart:convert';

import 'package:stomp_dart_client/stomp.dart';
import 'package:stomp_dart_client/stomp_config.dart';
import 'package:stomp_dart_client/stomp_frame.dart';
import 'package:chatfeatures/newagain.dart';


class erbsocketsecond extends StatefulWidget {
  const erbsocketsecond({super.key});

  @override
  State<erbsocketsecond> createState() => _erbsocketsecondState();
}

class _erbsocketsecondState extends State<erbsocketsecond> {

  TextEditingController _controller = TextEditingController();
  List<String> messages = [];

  @override
  void initState() {
    super.initState();
    stompClient.activate();
    // Initialize STOMP client

  }

/*
 void onConnect(StompFrame frame) {
    stompClient.subscribe(
      destination: '/topic/test/subscription',
      callback: (frame) {
        List<dynamic>? result = json.decode(frame.body!);
        print(result);
      },
    );

    Timer.periodic(Duration(seconds: 10), (_) {
      stompClient.send(
        destination: '/app/test/endpoints',
        body: json.encode({'a': 123}),
      );
    });
  }
  final stompClient = StompClient(
    config: StompConfig(
      url: 'ws://web-api-tht-env.eba-kcaa52ff.us-east-1.elasticbeanstalk.com/gs-guide-websocket',
      onConnect: get1(),
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
 */
void get(){
  print("Connected");
}
  @override
  void dispose() {
    stompClient.deactivate();
    super.dispose();
  }

  void _sendMessage() {
    _controller.text = "huiiiii";
    if (_controller.text.isNotEmpty) {
            // Send a message to the STOMP server
      stompClient.send(
        destination: '/app/hello', // Modify as needed
        body: _controller.text,
      );

      setState(() {
        messages.add('You: ${_controller.text}');
        _controller.text = '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WebSocket with STOMP Demo'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(messages[index]),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _controller,
                    onChanged: (text) {
                      setState(() {});
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter a message...',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: (){
                    if(_controller.text.isEmpty)
                      {
                        print("Enter Message");

                      }
                    else
                      {
                        sendMessage(_controller.text.toString(),"text","1","2");
                      }

                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  static get1() {
    print("Connected");

  }



}

