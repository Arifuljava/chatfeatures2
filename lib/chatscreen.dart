
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


class chatscreen extends StatefulWidget {
  const chatscreen({super.key});

  @override
  State<chatscreen> createState() => _chatscreenState();
}

class _chatscreenState extends State<chatscreen> {
    late final channel = IOWebSocketChannel.connect('ws://web-api-tht-env.eba-kcaa52ff.us-east-1.elasticbeanstalk.com/gs-guide-websocket');
  //late final channel = IOWebSocketChannel.connect('wss://ws.ifelse.io');

  TextEditingController _controller = TextEditingController();
  List<String> messages = [];
  bool isConnected = false;
    late StompClient stompClient;

  @override
  void initState() {
    super.initState();
   //init();

   init2();
setState(() {

});
    // Listen for connection status changes
   /*
    channel.stream.listen((event) {
      setState(() {
        isConnected = true;
      });
    }, onError: (error) {
      setState(() {
        isConnected = false;  print(error.toString());

      });
    }, onDone: () {
      setState(() {
        isConnected = false;
        print("isConnected");
      });
    });
    */

  }
  Future<void> _connectWebSocket() async {
    try {
      print("Hello");
    //  late final  channel1 = IOWebSocketChannel.connect('ws://web-api-tht-env.eba-kcaa52ff.us-east-1.elasticbeanstalk.com/gs-guide-websocket');

      channel.stream.listen(
            (event) {
          setState(() {
            isConnected = true;
            print("Done");
          });
        },
        onError: (error) {
          print('WebSocket Error: $error');
          setState(() {
            isConnected = false;
          });
        },
        onDone: () {
          setState(() {
            isConnected = false;
            print("Donee");
          });
        },
      );
    } catch (e) {
      print('WebSocket Connection Error: $e');
      setState(() {
        isConnected = false;
      });
    }
  }
  @override
  void dispose() {
    channel.sink.close();
    super.dispose();
  }

  void _sendMessage() {
    if (_controller.text.isNotEmpty && isConnected) {
      channel.sink.add(_controller.text);
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
        title: Text('WebSocket Demo'),
      ),
      body: Column(
        children: <Widget>[
          Text('WebSocket Connection Status: ${isConnected ? 'Connected' : 'Disconnected'}'),
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
                  onPressed: _controller.text.isEmpty ? null : _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  void init() async {
    await  _connectWebSocket();
  }

  void init2() async  {

  }

}

