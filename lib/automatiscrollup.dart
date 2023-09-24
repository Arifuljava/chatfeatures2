
import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:chatfeatures/textmodel.dart';
import 'package:flutter/services.dart';
import 'package:stomp_dart_client/stomp.dart';
import 'package:stomp_dart_client/stomp_config.dart';
import 'package:stomp_dart_client/stomp_frame.dart';
import 'package:chatfeatures/newagain.dart';

import 'package:chatfeatures/pictureandothers.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:chatfeatures/chatModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:chatfeatures/chatCheck.dart';
import 'package:chatfeatures/chatModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:circular_image/circular_image.dart';
import 'package:image/image.dart' as img;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//base 64
import 'dart:convert';
import 'dart:typed_data';

import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';
import 'dart:ui';

import 'package:chatfeatures/chatModel.dart';
import 'package:flutter/material.dart';
import 'package:stomp_dart_client/stomp.dart';
import 'package:stomp_dart_client/stomp_config.dart';
import 'package:stomp_dart_client/stomp_frame.dart';
import 'package:chatfeatures/chatmain.dart';
import 'dart:convert';



class Automatic extends StatefulWidget {
  const Automatic({super.key});

  @override
  State<Automatic> createState() => _AutomaticState();
}

class _AutomaticState extends State<Automatic> {

  // Create a ScrollController to control the ListView scrolling
  final ScrollController _controller = ScrollController();

  // Set the duration for each scroll movement
  final Duration _scrollDuration = Duration(seconds: 1);

  // Create a Timer to trigger automatic scrolling
  late Timer _scrollTimer;

  // The current position of the ListView
  double _scrollPosition = 0.0;

  // The total number of items in the ListView
  int _itemCount = 50; // Change this to your desired number of items

  @override
  void initState() {
    super.initState();
    //_controller.jumpTo(_itemCount * 50.0);
    _startAutoScroll();
  }
  bool _shouldAutoScroll = true; // Flag to control automatic scrolling
  void _startAutoScroll() {
    _scrollTimer = Timer.periodic(_scrollDuration, (_) {
      if (_shouldAutoScroll) {
        if (_scrollPosition < _itemCount - 1) {
          _scrollPosition += 1.0;
          _controller.animateTo(
            _scrollPosition * 50.0,
            duration: _scrollDuration,
            curve: Curves.linear,
          );
        } else {
          // Cancel the timer when it reaches the end
          _scrollTimer.cancel();
        }
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Auto-Scrolling ListView'),
      ),
      body: ListView.builder(
        controller: _controller,
        itemCount: _itemCount,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Item $index'),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    // Dispose of the Timer and ScrollController when the widget is disposed
    _scrollTimer.cancel();
    _controller.dispose();
    super.dispose();
  }
}