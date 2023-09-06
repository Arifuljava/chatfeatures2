
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
import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/io.dart'; // For WebSocket on non-web platforms (e.g., Android, iOS)
import 'dart:convert';


class chatpage extends StatefulWidget {
  const chatpage({super.key});

  @override
  State<chatpage> createState() => _chatpageState();
}

class _chatpageState extends State<chatpage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WebSocket Chat',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChatPage(),
    );
  }
}

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _textEditingController = TextEditingController();
  final List<String> _messages = [];
  WebSocketChannel? _channel;

  @override
  void initState() {
    super.initState();
    _initWebSocket();
  }

  void _initWebSocket() async {
    // Replace 'ws://your_websocket_server_url' with your WebSocket server URL.
    final channel = IOWebSocketChannel.connect('wss://echo.websocket.events');

    setState(() {
      _channel = channel;
    });

    _channel?.stream.listen((message) {
      setState(() {
        _messages.add(message);
      });
    });

    // Send a welcome message or any initialization message to the server.
    _channel?.sink.add('Hello, WebSocket Server!');
  }

  void _sendMessage(String message) {
    if (_channel != null && message.isNotEmpty) {
      _channel!.sink.add(message);
      _textEditingController.clear();
    }
  }

  @override
  void dispose() {
    _channel?.sink.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WebSocket Chat'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_messages[index]),
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
                    controller: _textEditingController,
                    decoration: InputDecoration(
                      hintText: 'Enter a message',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () => _sendMessage(_textEditingController.text),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
