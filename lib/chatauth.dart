
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class chatauth extends StatefulWidget {
  const chatauth({super.key});

  @override
  State<chatauth> createState() => _chatauthState();
}
Future<void> signUpUser() async {
  final apiUrl = 'http://web-api-tht-env.eba-kcaa52ff.us-east-1.elasticbeanstalk.com/api/dev/user/signUp';

  final userCredentials = {
    'userName': 'arif',
    'userEmail': 'user22@gmail.com',
    'userPassword': '123456',
    'role':'user'
  };

  final response = await http.post(Uri.parse(apiUrl), body: userCredentials);

  if (response.statusCode == 200) {
    print('User signed up successfully');
    // You can handle further actions here, like navigating to a new screen
  } else {
    print('Error signing up user');
    print('Response status code: ${response.statusCode}');
    print('Response body: ${response.body}');
  }
}
Future<void> signUpUser22() async {
  final apiUrl = 'http://web-api-tht-env.eba-kcaa52ff.us-east-1.elasticbeanstalk.com/api/dev/user/signUp';

  final userCredentials = {
    'userName': 'arif02',
    'userEmail': 'user022@gmail.com',
    'userPassword': '123456',
    'role': 'user',
  };

  final headers = {'Content-Type': 'application/json'};  // Set the Content-Type header

  final response = await http.post(Uri.parse(apiUrl),
      headers: headers,
      body: jsonEncode(userCredentials));  // Encode data as JSON

  if (response.statusCode == 200) {
    print('User signed up successfully');
    // You can handle further actions here, like navigating to a new screen
  } else {
    print('Error signing up user');
    print('Response status code: ${response.statusCode}');
    print('Response body: ${response.body}');
  }
}
class _chatauthState extends State<chatauth> {
  @override
  void initState() {
    // TODO: implement initState
    signUpUser22();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
