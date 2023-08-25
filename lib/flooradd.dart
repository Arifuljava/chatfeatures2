
import 'package:chatfeatures/chatmain.dart';
import 'package:chatfeatures/checkuserexsit.dart';
import 'package:chatfeatures/flooradd.dart';
import 'package:chatfeatures/imagetobinary.dart';
import 'package:chatfeatures/recentsectionsqllite.dart';
import 'package:chatfeatures/recentsqllite.dart';
import 'package:chatfeatures/seconddatabase.dart';
import 'package:chatfeatures/uuidStore.dart';
import 'package:flutter/material.dart';

class flooradd extends StatefulWidget {
  const flooradd({super.key});

  @override
  State<flooradd> createState() => _flooraddState();
}

class _flooraddState extends State<flooradd> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Bottom Sheet Example'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              _showBottomSheet(context);
            },
            child: Text('Show Bottom Sheet'),
          ),
        ),
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.edit),
                title: Text('Edit'),
                onTap: () {
                  Navigator.pop(context); // Close the bottom sheet
                  // Add your edit logic here
                },
              ),
              ListTile(
                leading: Icon(Icons.delete),
                title: Text('Delete'),
                onTap: () {
                  Navigator.pop(context); // Close the bottom sheet
                  // Add your delete logic here
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
