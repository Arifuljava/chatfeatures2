



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class chatmain extends StatefulWidget {
  const chatmain({super.key});

  @override
  State<chatmain> createState() => _chatmainState();
}
int selectedItemIndex = 0;
List<String> items = [
  'A203',
  'B32',
  'B32R',
  'A63',
  'B1',
  "B18",
  "P18",
  "Hi-D110",
  "B21S",
  "B21",
  "Betty",
  "T2S",
  "Fust",
  "T8S",
  "Dxx",
  "P1",
  "A20",
  "A8",
  "P1S",
  "S6",
  "B3S",
  "D11S",
  "Z401",
  "D101",
  "T8",
  "B50W",
  "S1",
  "T7",
  "T6",
  "S3",
  "Jc-M90",
  "D41",
  "B203",
  "B16",
  "D61",
  "B3",
  "D110",
  "JCB3S",
  "Hi-NB-D11",
  "B11",
  "B50",
  "D11"
];
String itemmm = "A203";
class _chatmainState extends State<chatmain> {
  void _showPickerDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext builder) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin:
                  EdgeInsets.only(left: 20, top: 10, right: 10, bottom: 10),
                  padding: EdgeInsets.all(2),
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.close,
                      size: 20,
                      color: Colors.black54,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(2),
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Printer",
                    style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                ),
                Container(
                  margin:
                  EdgeInsets.only(top: 10, left: 10, right: 20, bottom: 10),
                  padding: EdgeInsets.all(2),
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      String selectedValue = items[selectedItemIndex];
                      itemmm = selectedValue;
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.done,
                      size: 20,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 200.0, // Adjust the height as per your requirement
              child: CupertinoPicker(
                itemExtent: 32.0, // Height of each item in the picker
                onSelectedItemChanged: (int index) {
                  setState(() {
                    selectedItemIndex = index;
                    String value = items[selectedItemIndex];
                  });
                },
                children: items.map((String item) {
                  return Container(
                    margin: EdgeInsets.only(top: 5, left: 10, right: 10),
                    child: Text(
                      item,
                      style: const TextStyle(color: Colors.black54, fontSize: 15),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        );
      },
    );
  }
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
                  _showPickerDialog(context);
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
                ),
              ),
              SizedBox(width: 15,),
              FloatingActionButton(
                onPressed: (){},
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
}
List<ChatMessage> messages = [
  ChatMessage(messageContent: "Hello, Will", messageType: "receiver"),
  ChatMessage(messageContent: "How have you been?", messageType: "receiver"),
  ChatMessage(messageContent: "Hey Kriss, I am doing fine dude. wbu?", messageType: "sender"),
  ChatMessage(messageContent: "ehhhh, doing OK.", messageType: "receiver"),
  ChatMessage(messageContent: "Is there any thing wrong?", messageType: "sender"),
];

class ChatMessage{
  String messageContent;
  String messageType;
  ChatMessage({required this.messageContent, required this.messageType});
}