/*



import 'dart:convert';

import 'package:chatfeatures/chatModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:chatfeatures/chatCheck.dart';
import 'package:chatfeatures/chatModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class chatmain extends StatefulWidget {
  const chatmain({super.key});

  @override
  State<chatmain> createState() => _chatmainState();
}

String itemmm = "A203";
class _chatmainState extends State<chatmain> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadMessage();
  }
  void showCustomBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildRow(context, "Select Image", Icons.image, "Select Video", Icons.video_library),
              _buildRow(context, "Voice", Icons.mic, "Select Document", Icons.file_copy),
            ],
          ),
        );
      },
    );
  }
  Widget _buildRow(BuildContext context, String text1, IconData icon1, String text2, IconData icon2) {
    return Row(
      children: [
        _buildOption(context, text1, icon1),
        _buildOption(context, text2, icon2),
      ],
    );
  }
  Widget _buildOption(BuildContext context, String text, IconData icon) {
    return Expanded(
      child: InkWell(
        onTap: () {
          // Handle option selection here
          if(text=="Select Image")
            {
              print(text);
            }
          else if(text=="Select Video")
          {
            print(text);
          }
          else if(text=="Voice")
          {
            print(text);
          }
          else if(text=="Select Document")
          {
            print(text);
          }

          Navigator.pop(context); // Close the BottomSheetDialog
        },
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Icon(icon, size: 48),
              SizedBox(height: 8),
              Text(text, textAlign: TextAlign.center),
            ],
          ),
        ),
      ),
    );
  }
TextEditingController textMessage= new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            elevation: 0,
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            flexibleSpace: SafeArea(
              child: Container(
                padding: EdgeInsets.only(right: 16),
                child: Row(
                  children: <Widget>[
                    IconButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back,color: Colors.black,),
                    ),
                    SizedBox(width: 2,),
                    CircleAvatar(
                      backgroundImage: NetworkImage("<https://randomuser.me/api/portraits/men/5.jpg>"),
                      maxRadius: 20,
                    ),
                    SizedBox(width: 12,),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Kriss Benwat",style: TextStyle( fontSize: 16 ,fontWeight: FontWeight.w600),),
                          SizedBox(height: 6,),
                          Text("Online",style: TextStyle(color: Colors.grey.shade600, fontSize: 13),),
                        ],
                      ),
                    ),
                    Icon(Icons.settings,color: Colors.black54,),
                  ],
                ),
              ),
            ),
          ),
       body: Stack(
      children: <Widget>[
        ListView.builder(
          itemCount: messages.length,
          shrinkWrap: true,
          padding: EdgeInsets.only(top: 10,bottom: 10),
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index){
            return Container(
              padding: EdgeInsets.only(left: 14,right: 14,top: 10,bottom: 10),
              child: Align(
                alignment: (messages[index].msgType == "receiver"?Alignment.topLeft:Alignment.topRight),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: (messages[index].msgType  == "sender"?Colors.grey.shade200:Colors.blue[200]),
                  ),
                  padding: EdgeInsets.all(16),
                  child: Text(messages[index].message.toString(), style: TextStyle(fontSize: 15),),
                ),
              ),
            );
          },
        ),
        Align(
        alignment: Alignment.bottomLeft,
        child: Container(
          padding: EdgeInsets.only(left: 10,bottom: 10,top: 10),
          height: 60,
          width: double.infinity,
          color: Colors.white,
          child: Row(
            children: <Widget>[
              GestureDetector(
                onTap: (){
                  print("getFiles");
                  showCustomBottomSheet(context);
                },
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    color: Colors.lightBlue,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Icon(Icons.add, color: Colors.white, size: 20, ),
                ),
              ),
              SizedBox(width: 15,),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                      hintText: "Write message...",
                      hintStyle: TextStyle(color: Colors.black54),
                      border: InputBorder.none
                  ),
                  controller: textMessage,
                ),
              ),
              SizedBox(width: 15,),
              FloatingActionButton(
                onPressed: ()async{
                  String message_tobesend= textMessage.toString();
                  if(message_tobesend.toString().isEmpty)
                    {
                      print("Empty");
                    }
                  else
                    {
                      print("NON Empty");
                    }
                },
                child: Icon(Icons.send,color: Colors.white,size: 18,),
                backgroundColor: Colors.blue,
                elevation: 0,
              ),
            ],

          ),
        ),
      ),
      ],
    ),
      ),
    );

  }

  void loadMessage() async{
   await fetchLabelDataBySubCategory23();
  }
}
/*
List<ChatModel> messages22 = chatCheck().chatModelsList;
List<ChatModel> messages = chatModelsList;
 */


/*
List<ChatMessage> messages = [
  ChatMessage(messageContent: "Hello, Will", messageType: "receiver",servertime: "122"),
  ChatMessage(messageContent: "How have you been?", messageType: "receiver",servertime: "122"),
  ChatMessage(messageContent: "Hey Kriss, I am doing fine dude. wbu?", messageType: "sender",servertime: "122"),
  ChatMessage(messageContent: "ehhhh, doing OK.", messageType: "receiver",servertime: "122"),
  ChatMessage(messageContent: "Is there any thing wrong?", messageType: "sender",servertime: "122"),
];


class ChatMessage{
  String messageContent;
  String messageType;
  String servertime;
  ChatMessage({required this.messageContent, required this.messageType, required this.servertime});
}


 */
List<ChatModel> messages = [];
Future<void> fetchLabelDataBySubCategory23() async {
  final url = 'http://web-api-tht-env.eba-kcaa52ff.us-east-1.elasticbeanstalk.com/api/dev/messages/4';

  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    final List<dynamic> labelDataList = json.decode(response.body);
    for (var item in labelDataList) {
      final chatModel = ChatModel.fromJson(item);
      messages.add(chatModel);
    }


    print(messages);
  } else {
    print(" Status code: ${response.statusCode}");
    print("Response body: ${response.body}");
  }
}
 */
//updated
/*

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

class chatmain extends StatefulWidget {
  const chatmain({super.key});

  @override
  State<chatmain> createState() => _chatmainState();
}

String itemmm = "A203";
class _chatmainState extends State<chatmain> {
  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      int_loadData();
    });
    super.initState();
  }
  void showCustomBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildRow(context, "Select Image", Icons.image, "Select Video", Icons.video_library),
              _buildRow(context, "Voice", Icons.mic, "Select Document", Icons.file_copy),
            ],
          ),
        );
      },
    );
  }
  Widget _buildRow(BuildContext context, String text1, IconData icon1, String text2, IconData icon2) {
    return Row(
      children: [
        _buildOption(context, text1, icon1),
        _buildOption(context, text2, icon2),
      ],
    );
  }
  Widget _buildOption(BuildContext context, String text, IconData icon) {
    return Expanded(
      child: InkWell(
        onTap: () {
          // Handle option selection here
          if(text=="Select Image")
          {
            print(text);
          }
          else if(text=="Select Video")
          {
            print(text);
          }
          else if(text=="Voice")
          {
            print(text);
          }
          else if(text=="Select Document")
          {
            print(text);
          }

          Navigator.pop(context); // Close the BottomSheetDialog
        },
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Icon(icon, size: 48),
              SizedBox(height: 8),
              Text(text, textAlign: TextAlign.center),
            ],
          ),
        ),
      ),
    );
  }
  TextEditingController textMessage= new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          flexibleSpace: SafeArea(
            child: Container(
              padding: EdgeInsets.only(right: 16),
              child: Row(
                children: <Widget>[
                  IconButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back,color: Colors.black,),
                  ),
                  SizedBox(width: 2,),
                  CircleAvatar(
                    backgroundImage: NetworkImage("<https://randomuser.me/api/portraits/men/5.jpg>"),
                    maxRadius: 20,
                  ),
                  SizedBox(width: 12,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Kriss Benwat",style: TextStyle( fontSize: 16 ,fontWeight: FontWeight.w600),),
                        SizedBox(height: 6,),
                        Text("Online",style: TextStyle(color: Colors.grey.shade600, fontSize: 13),),
                      ],
                    ),
                  ),
                  Icon(Icons.settings,color: Colors.black54,),
                ],
              ),
            ),
          ),
        ),
        body: Stack(
          children: <Widget>[
            ListView.builder(
              itemCount: messages.length,
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 10,bottom: 10),
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index){
                return Container(
                  padding: EdgeInsets.only(left: 14,right: 14,top: 10,bottom: 10),
                  child: Align(
                    alignment: (messages[index].messageType == "receiver"?Alignment.topLeft:Alignment.topRight),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: (messages[index].messageType  == "receiver"?Colors.grey.shade200:Colors.blue[200]),
                      ),
                      padding: EdgeInsets.all(16),
                      child: Text(messages[index].messageContent, style: TextStyle(fontSize: 15),),
                    ),
                  ),
                );
              },
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                padding: EdgeInsets.only(left: 10,bottom: 10,top: 10),
                height: 60,
                width: double.infinity,
                color: Colors.white,
                child: Row(
                  children: <Widget>[
                    GestureDetector(
                      onTap: (){
                        print("getFiles");
                        showCustomBottomSheet(context);
                      },
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          color: Colors.lightBlue,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Icon(Icons.add, color: Colors.white, size: 20, ),
                      ),
                    ),
                    SizedBox(width: 15,),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: "Write message...",
                            hintStyle: TextStyle(color: Colors.black54),
                            border: InputBorder.none
                        ),
                        controller: textMessage,
                      ),
                    ),
                    SizedBox(width: 15,),
                    FloatingActionButton(
                      onPressed: ()async{
                        String message_tobesend= textMessage.toString();
                        if(message_tobesend.toString().isEmpty)
                        {
                          print("Empty");
                        }
                        else
                        {
                          print("NON Empty");
                        }
                      },
                      child: Icon(Icons.send,color: Colors.white,size: 18,),
                      backgroundColor: Colors.blue,
                      elevation: 0,
                    ),
                  ],

                ),
              ),
            ),
          ],
        ),
      ),
    );

  }

  void int_loadData() async{
     await fetchLabelDataBySubCategory23();
  }
}
List<ChatMessage> messages = [
  ChatMessage(messageContent: "Hello, Will", messageType: "receiver",servertime: "122"),
  ChatMessage(messageContent: "How have you been?", messageType: "receiver",servertime: "122"),
  ChatMessage(messageContent: "Hey Kriss, I am doing fine dude. wbu?", messageType: "sender",servertime: "122"),
  ChatMessage(messageContent: "ehhhh, doing OK.", messageType: "receiver",servertime: "122"),
  ChatMessage(messageContent: "Is there any thing wrong?", messageType: "sender",servertime: "122"),
];

class ChatMessage{
  String messageContent;
  String messageType;
  String servertime;
  ChatMessage({required this.messageContent, required this.messageType, required this.servertime});
}
List<ChatModel> messages22 = [];
Future<void> fetchLabelDataBySubCategory23() async {
  final url = 'http://web-api-tht-env.eba-kcaa52ff.us-east-1.elasticbeanstalk.com/api/dev/messages/4';

  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    final List<dynamic> labelDataList = json.decode(response.body);
    for (var item in labelDataList) {
      final chatModel = ChatModel.fromJson(item);
      messages22.add(chatModel);
    }


    print(messages22);
  } else {
    print(" Status code: ${response.statusCode}");
    print("Response body: ${response.body}");
  }
}
 */

import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

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

class chatmain extends StatefulWidget {
  const chatmain({super.key});

  @override
  State<chatmain> createState() => _chatmainState();
}

String itemmm = "A203";
class _chatmainState extends State<chatmain> {
  List<ChatModel> messages22 = [];
 // final ScrollController _scrollController = ScrollController();
  ScrollController _scrollController = ScrollController();

  bool _isLoading = false; // Flag to prevent multiple load requests
  ScrollController scrollController = ScrollController();

  Future<void> scrollAnimation() async {
    return await Future.delayed(
        const Duration(milliseconds: 100),
            () => scrollController.animateTo(
            scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 300),
            curve: Curves.linear));
  }

  void _scrollToBottom() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }
  String current_date = '';
  DateTime now = DateTime.now();
  void _startPollingAPI() {
    // Create a timer to poll the API every 5 seconds (adjust as needed)
    Timer.periodic(Duration(seconds: 1), (timer) {
      fetchLabelDataBySubCategory23();
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    _startPollingAPI();
    int year = now.year;
    int  month = now.month;
    int day = now.day;
    int  hour = now.hour;
    int min = now.minute;
    int second = now.second;

    current_date = '$hour:$min:$second,$day/$month/$year';
    print(current_date);
    print(now);
    setState(() {

      int_loadData();
      inSro();


    });
    stompClient.activate();
   // WidgetsBinding.instance?.addPostFrameCallback((_) => _scrollToBottom());
    // Scroll to the last message when the widget is initialized
    //_scrollController.addListener(_scrollListener);
    super.initState();
  }
  void inSro() async{
  await  scrollAnimation();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _scrollController.dispose();
    super.dispose();
  }
  void _scrollListener() {
    if (_scrollController.position.atEdge && !_isLoading) {
      // User has reached the top of the list
      if (_scrollController.position.pixels == 0) {
        setState(() {
          _isLoading = true;
        });

        // Fetch older messages from the server here
        // Update your messages22 list with the new messages

        // After updating the list, you can scroll to the last message
        _scrollController.jumpTo(_scrollController.position.maxScrollExtent);

        setState(() {
          _isLoading = false;
        });
      }
    }
  }
  void _scrollToLastMessage() {
    if (messages22.isNotEmpty) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    }
  }
  //for image
  File? _imageFile;
  Uint8List? _imagebit; 

  Future<void> _pickImageFromGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    final imageBytes = await pickedFile?.readAsBytes();

    print(imageBytes);
    setState(() {
      if (pickedFile != null)  {
        _imageFile = File(pickedFile.path);


        get_binary(_imageFile.toString());

      } else {
        print('No image selected.');
      }
    });
  }
  Future<Uint8List?> loadImageBytes(String imagePath) async {
    try {
      // Create a File object from the image path
      File imageFile = File(imagePath);

      // Check if the file exists
      if (await imageFile.exists()) {
        // Read the image file as bytes
        Uint8List imageBytes = await imageFile.readAsBytes();
        return imageBytes;
      } else {
        // Handle the case where the file doesn't exist
        print('Image file does not exist: $imagePath');
        return null; // or throw an exception
      }
    } catch (e) {
      // Handle any errors that may occur during file reading
      print('Error loading image: $e');
      return null; // or throw an exception
    }
  }
  void showCustomBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildRow(context, "Select Image", Icons.image, "Select Video", Icons.video_library),
              _buildRow(context, "Voice", Icons.mic, "Select Document", Icons.file_copy),
            ],
          ),
        );
      },
    );
  }
  Widget _buildRow(BuildContext context, String text1, IconData icon1, String text2, IconData icon2) {
    return Row(
      children: [
        _buildOption(context, text1, icon1),
        _buildOption(context, text2, icon2),
      ],
    );
  }
  Future<File?> pickVideoFromGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickVideo(source: ImageSource.gallery);
    if (pickedFile != null) {
      print(File(pickedFile.path));
      return File(pickedFile.path);
    } else {
      return null;
    }
  }
  Widget _buildOption(BuildContext context, String text, IconData icon) {
    return Expanded(
      child: InkWell(
        onTap: () async {
          // Handle option selection here
          if(text=="Select Image")
          {
            print(text);
           await _pickImageFromGallery();
          }
          else if(text=="Select Video")
          {
            await  pickVideoFromGallery();
            print(text);

          }
          else if(text=="Voice")
          {
            print(text);
          }
          else if(text=="Select Document")
          {
            print(text);
          }

          Navigator.pop(context); // Close the BottomSheetDialog
        },
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Icon(icon, size: 48),
              SizedBox(height: 8),
              Text(text, textAlign: TextAlign.center),
            ],
          ),
        ),
      ),
    );
  }
  TextEditingController textMessage= new TextEditingController();
  void showMyToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT, // Duration of the toast
      gravity: ToastGravity.BOTTOM,    // Position of the toast
      timeInSecForIosWeb: 1,           // Time to show on iOS
      backgroundColor: Colors.grey,    // Background color of the toast
      textColor: Colors.white,         // Text color of the toast
      fontSize: 16.0,                  // Font size of the message
    );
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope( onWillPop: () async{
return  await backgooo(context);
    },
    child: MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.lightBlue,
          flexibleSpace: SafeArea(
            child: Container(
              padding: EdgeInsets.only(right: 16),
              child: Row(
                children: <Widget>[
                  IconButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back,color: Colors.white,),
                  ),
                  SizedBox(width: 2,),
                  CircularImage(source: 'https://senzary.com/wp-content/uploads/2019/01/person2.jpg',radius: 20,),
                  SizedBox(width: 12,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Kriss Benwat",style: TextStyle( fontSize: 16 ,fontWeight: FontWeight.w600),),
                        SizedBox(height: 6,),
                        Text("Online",style: TextStyle(color: Colors.grey.shade600, fontSize: 13),),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () async{
                      await settingsImage(context);
                    },
                    child: Icon(Icons.settings,color: Colors.black54,),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: Stack(
          children: <Widget>[

            SingleChildScrollView(
              child: ListView.builder(
                key: UniqueKey(),
                controller: _scrollController,
                itemCount: messages22.length,
                shrinkWrap: true,
                padding: EdgeInsets.only(top: 10, bottom: 50),
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 10),
                    child: Align(
                      alignment: (messages22[index].sentBy == "1"
                          ? Alignment.topLeft
                          : Alignment.topRight),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: (messages22[index].sentBy == "1"
                              ? Colors.grey.shade200
                              : Colors.blue[200]),
                        ),
                        padding: EdgeInsets.all(16),
                        child: Text(
                          messages22[index].message.toString(),
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
            ,
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                padding: EdgeInsets.only(left: 10,bottom: 10,top: 10),
                height: 60,
                width: double.infinity,
                color: Colors.white,
                child: Row(
                  children: <Widget>[
                    GestureDetector(
                      onTap: (){
                        print("getFiles");
                        showCustomBottomSheet(context);
                      },
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          color: Colors.lightBlue,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Icon(Icons.add, color: Colors.white, size: 20, ),
                      ),
                    ),
                    SizedBox(width: 15,),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: "Write message...",
                            hintStyle: TextStyle(color: Colors.black54),
                            border: InputBorder.none
                        ),
                        controller: textMessage,
                      ),
                    ),
                    SizedBox(width: 15,),
                    FloatingActionButton(
                      onPressed: ()async{
                        String message_tobesend= textMessage.text.toString();
                        print(message_tobesend);

                        if(message_tobesend.toString().isEmpty)
                        {
                          print("Empty");
                          // await sendChatMessage2222(message_tobesend.toString());
                        }
                        else
                        {
                          setState(() {
                            print("NON Empty");

                   //await sendChatMessage2222(message_tobesend.toString());
                        sendMessage(message_tobesend.toString(),"text","1","2");
                        //_scrollToBottom();
                            FocusScope.of(context).unfocus();
                            final random = Random();
                            int randomNumber = random.nextInt(100);
                            int currentTimeInMillis = DateTime.now().millisecondsSinceEpoch;

                            // Convert milliseconds to seconds
                            int currentTimeInSeconds = currentTimeInMillis ~/ 1000;
                            ChatModel chatmodel = new ChatModel(messageId:randomNumber,chatId: 4,sentBy: "3",sentTo: "2",message: message_tobesend.toString(),
                            msgType: "sender",timestmp:current_date,serverTimestmp: currentTimeInSeconds.toString() );

                            setState(() {
                              messages22.add(chatmodel);
                            });
                            textMessage.text = "";
                            showMyToast("Message Send");

                          });
                        }

                      },
                      child: Icon(Icons.send,color: Colors.white,size: 18,),
                      backgroundColor: Colors.blue,
                      elevation: 0,
                    ),
                  ],

                ),
              ),
            ),
          ],

        ),
      ),
    ),
    );

  }
  Future<dynamic> backgooo(BuildContext context) async {
   /*
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => BottomNavBar(

          ),
        ));
    */
    showMyToast("PLease press again.");
  }
  Future<dynamic> settingsImage(BuildContext context) async {

    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => pictureandothers(

          ),
        ));

  }
  Future<void> sendChatMessage2222(String sendmessage) async {
    final url = 'http://web-api-tht-env.eba-kcaa52ff.us-east-1.elasticbeanstalk.com/api/dev/messages'; // Replace with your API URL

    final Map<String, dynamic> messageData = {
      "chatId": 4,
      "sentBy": "3",
      "sentTo": "2",
      "message": sendmessage,
      "msgType": "sender",
      "timestmp": "2023-08-31T08:11:05.814+00:00"
    };

    final headers = {
      'Content-Type': 'application/json', // Set the content type to JSON
    };

    final String jsonBody = json.encode(messageData);

    final response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: jsonBody,
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseBody = json.decode(response.body);
      print('Message sent successfully.');
      final chatModel = ChatModel.fromJson(responseBody);
      showMyToast("Message sent");

      // Add the sent message to the list and update the UI
      setState(() {
        messages22.add(chatModel);
      });
    }
    else if (response.statusCode == 201) {
      final Map<String, dynamic> responseBody = json.decode(response.body);

      print('Message sent successfully.');
      final chatModel = ChatModel.fromJson(responseBody);

      // Add the sent message to the list and update the UI
      setState(() {
        messages22.add(chatModel);
      });
    }else {
      print('Failed to send message. Status code: ${response.statusCode}');
      print('Response body: ${response.body}');
    }
  }
  void int_loadData() async{
    await fetchLabelDataBySubCategory23();
  }

  Future<void> fetchLabelDataBySubCategory23() async {
    final url =
        'http://web-api-tht-env.eba-kcaa52ff.us-east-1.elasticbeanstalk.com/api/dev/messages/2';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final List<dynamic> labelDataList = json.decode(response.body);
      setState(() {
        messages22.clear(); // Clear existing messages
        for (var item in labelDataList) {
          final chatModel = ChatModel.fromJson(item);
          messages22.add(chatModel);
        }
      });
      //print(messages22);
    } else {
      print(" Status code: ${response.statusCode}");
      print("Response body: ${response.body}");
    }
  }
  Future<Uint8List?> loadImageByteaas(String imagePath) async {
    try {
      ByteData data = await rootBundle.load(imagePath);
      return data.buffer.asUint8List();
    } catch (e) {
      print('Error loading image: $e');
      return null; // or throw an exception
    }
  }
  void get_binary(String filtpath) async{
    await loadImageBytes(filtpath);
   // Uint8List imageBytes = await File(filtpath).readAsBytes();
 await loadImageByteaas(filtpath);

  }
}


