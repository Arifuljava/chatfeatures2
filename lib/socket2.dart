

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class sockett2 extends StatefulWidget {
  const sockett2({super.key});

  @override
  State<sockett2> createState() => _sockett2State();
}

class _sockett2State extends State<sockett2> {
  bool isWebSocketConnected = false;

  Future<void> checkWebSocketConnection() async {
    final response = await http.get(Uri.parse('wss://ws.ifelse.io'));
    print(response.headers['Connection']);

    if (response.headers['Connection'] == 'websocket') {
      setState(() {
        isWebSocketConnected = true;
      });
    } else {
      setState(() {
        isWebSocketConnected = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    checkWebSocketConnection();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WebSocket Connection Status'),
      ),
      body: Center(
        child: Text(
          isWebSocketConnected ? 'WebSocket Connected' : 'WebSocket Not Connected',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
