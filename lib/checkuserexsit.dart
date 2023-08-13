

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class checkuserexsit extends StatefulWidget {
  const checkuserexsit({super.key});

  @override
  State<checkuserexsit> createState() => _checkuserexsitState();
}
Future<bool> checkUserEmailExists(String email) async {
  final apiUrl = 'https://grozziie.zjweiting.com:8033/tht/check-user';

  try {
    final response = await http.post(
      Uri.parse(apiUrl),
      body: {'email': email},
    );

    if (response.statusCode == 200) {
      // Parse the response and determine if the email exists
      // You might need to adjust this based on the actual response from the API
      return response.body == 'exists';
    } else {
      throw Exception('Failed to check user email');
    }
  } catch (e) {
    throw Exception('Failed to connect to the server');
  }
}

class _checkuserexsitState extends State<checkuserexsit> {
  TextEditingController _editingController=new TextEditingController();
  bool _emailExists = false;

  Future<void> _checkEmail() async {
    final email = _editingController.text;

    if (email.isNotEmpty) {
      try {
        final exists = await checkUserEmailExists(email);
        setState(() {
          _emailExists = exists;
        });
      } catch (e) {
        // Handle error
        print('Error: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Check User Email')),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _editingController,
                decoration: InputDecoration(labelText: 'Enter Email'),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _checkEmail,
                child: Text('Check Email'),
              ),
              SizedBox(height: 16.0),
              _emailExists
                  ? Text('Email already exists')
                  : Text('Email does not exist'),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: checkuserexsit(),
  ));
}