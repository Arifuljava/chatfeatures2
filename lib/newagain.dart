

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

import 'chatsection22.dart';
String jubayer = "iVBORw0KGgoAAAANSUhEUgAAAWMAAACXCAYAAADAtjpaAAAACXBIWXMAAAsTAAALEwEAmpwYAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAA9eSURBVHgB7d1PbBznecfxZ0VZFR2VpAy7EdRSXMJGgCAKSKHopXJCMqfIF5KXVofA5KKAfHJIHqJLA1CE7Yt8IBmfogLZ3SAHFShAsgVs+BCTBCqhKNyIglwEEOyQFBMjiQ2LVBRI8b/N/F7p3cyuuPwn7vKd5fcDjHb23dmZoWz8+OiZ2X1T5v3b4e6Gg6nRaK0zWloMAFBNc/ZlIf/Fv9zP6UmD/jiQfXL0wAHTQDpaDhsAoNrSlkr1pfoOWWHms/lUQ/bwoFkqawCAPZGyQs+B6GHAAAB7pmCp0SiMrdsAAHup84ABAPZaC2EMAAEgjAEgAIQxAASAMAaAABDGABAAwhgAAkAYA0AADhoA1Ej6yAn79rFvW7356fs/s8dFGAOoGQXxT56/ZPVmN8KYNgUABIAwBoAAEMYAEADCGAACQBgDQAAIYwAIAGEMAAEgjAEgAIQxAASAMAaAABDGABAAwhgAAkAYA0AACGMACABhDAABIIwBIACEMQAEgDAGgAAQxgAQgB3NgVevkwriMd14z+ybJw2I+89b/2Wrn64ZNrajMG470laXkwriMV29aPb8eQPinv2PrxPGW0CbAgACQBgDQAAIYwAIAGEMAAEgjAEgAIQxAASAMAaAABDGABAAwhgAAkAYA0AAdvRx6JBNTk7a6upqyVhHR4f19fXZdk1PT1tnZ6el0+lNt11YWLClpaWS48zNzVlLS4vbBwBspO4qYwVvV1eXC8fm5ma3vtMwnJmZcQG7FTpeJpMp2X5+ft6uX79uALCZugvj7u5ut/iKVOuqbMfGxiyfz1t/f7/bTlWrwlPPVQF7uVzOjY2MjJTs14etXtN7Kx3b77/cesdTWKuS17iW+DHioa5z15geAdSnfdMzVhguLi7a+Pi4e64QHB0ddc8VvGptqBLWks1mbWBgoBi6CkZtMzQ05LZXKJa3QkThr/etF5r6RVB+PJ3PxMSEG9MvDwWu1rUP/8tA+yoUCjY1NeUeCWSgPu2rC3iDg4PF/q8CV5WowlcUjgpfBa6vqn17Q60GjWl73wf27ys3PDzstimvnhWy5cfz56T99fb2Fit69Z3966qidc6q2P0jgPqzL++mUKXb09PjHtva2lwAigJwvYr39u3bJc8VnOpFV6Kg99WvP55vPcSPtxXlx/aVPYD6si/DWCGpKlNVrKpfH5oKWPVxRcGpSlZ8paoqVsva2sZflK19q9Xgq1i9VwGs46n6XS/wK2lvb3f703H13uXlZQNQf+ru1jZPARavQBW6/rm/XU3VscZ8e0CBp4r21KlT7nVVwBrXovaFtheFdvntbuXVroJX7Q1VwuXH8+cSf4/WdSeI59dVZatPrEXbUBkDW3TnjllTkyVFqiHbWLBt6jr2Lfv5d982oMTFi2bnmXYJpTTt0vLdB/+ie/G579VmyrbLlx/8/6hrNK2tVm0Hc0/a4+ITeADqi4L45ZfNVlZ0gefBYwIQxgDqhw9iL0GBTBgDqA/lQewlJJAJYwDJVymIvQQEMmEMINk2C2Iv8EAmjAEk11aD2As4kAljAMm03SD2Ag1kwhhA8uw0iL0AA5kwBpAsjxvEXmCBTBgDSI7dCmIvoEDe+XdT6KOGSaG/6Bp8JHLf+++3zT5714ASX/317nwLzm4HsecDuUYfna5k539FSfoOAr4zoTYUxOduGlDinZTZPXs81QpiL4BApk0BIGzVDmJvj1sWhDGAcNUqiL09DGTCGECYah3E3h4FMmEMIDx7FcTeHgRy3c70ASDh3nhjW5vbjRtmlyp8cX1zs9mrr9q21fBOLMIYQHjOnrVtU2hWCmNNv7STfdYQbQoACABhDAABqGoYa7r76enpkrG5uTlbWFio+B69lslkDAD2k6qH8Yw+0RIzPz/vprCvRFPaDwwMuPVcLmf5fN4AoN7t6QW8kZERF76qnru7u210dNSNK8BbWlpsbGzMPSrU/WsAUI/2NIwnJiZscXHRhoaGrKenx3p7e134qlUxPj7uAjiVShUrZQCoV3t6AU9VsRZRZbxR+wIA6lnNw3h1ddWadQM2AKCoqmHc2dlZcveE1rVofKs2uvMCAOpFVcNY/d/Z2Vl3Ia69vd09ZrPZktaE19bW5hbp6Ohwj319fa6SVm8ZAOpZ1S/gKXinpqbWfU3B7A0ODhbXffgqzOPbAEC94hN4ABAAwhgAAkAYA0AACGMACABhjJpYWvl0W+Pbsbr2hVt2g87HLxvtc/qtNQN2E2GMmuju+8DGXv9tydjSrU+t/e9/aXNX7trjmLz0kc3sUjj689Ry6js33b7LKaTzlz+x1Tu78wsAEMIYNTN35Y+lz6/etXTrobJt7rqq01fMCuyF9+4Vx+PblIfh9Jtrj1SsCs5cFJzxce1P+89VCNTsj0645do7X7OJH39cPKZ/j6XMhs49Yy1NDSXHKP+lUv6zABvZ2X3Gt1bMLl60xLh6NVnnm1SbTN7YefKwC6ju00fc88lLH1vfC03F1/sHlqwj2kYhN/b672x2+lkXZCM//NAGzh61+at/dOO9Z5pcAE5GQaltJHf59oPxKFy1jYJUQZ75/oobVwDPvHnHsm+0uipa59F7ptntx4dquZbmBis8XM//+yfR/j5z5yEXomPMRT+HjtE/uBSF89Pu57n+//dcUOucC6mCpf/ukDtPHbf8Fw8Qt7MwPtFqdu68JYaC+HyCzjepXns3+uNmxZcVfgpKhbHCsPNh8IqetzQfsAs/OOaeR8VnFJ5r1hYFWPrEEzb80jNRcDdb5uVbxW3U4vC6T3/FbSNrUcBqf/NR5a3wHDz7lBvviVoQvkod0v7OrP8dKXqvQn0+quTjvyzGXztund9oLNlWYa+g1bj25/rNt9Rz/pNN5dvdNgp1/QJQSAOVMCEpakYhrDBW0OWjSnb0/DHXexWFmNoYPX3vF7cfeBiiCrPNxKtObb/88CKc2gT+GPF9VaqGRSEuqtJ9kFd6jyprH9Dad2dzowvz8p+l9wxfjoWNEcaoKVWqI//6oasc4wHaebLRLVP5tHse7xlvxULUHvDfer3w3n3r+scjLiS1T1+Ruuq7afNgH31YeW9F+sShYutF56o+uCpkHde3UNzdHlzswyYIY9SUgkr91PFXj5eMK7zSrU9EbYgVV2Eq1Hwwb4UqUb1X2qK2hsJR++zp/8AWbtx346trnxf71btFP4eOq2pa5zD00tPu/Luitol64PqFo7Ce+mnagI2kGrKNhe2+qevYt+zn333bEoOecW289k/RtYT1e8aqdH0lrCqxeCfCw4rRP9eFNlHFGd/Gr8f349f9PnwVrRCOe9CPbiiOlx+z0nnGxc9hvZ9n4cY96/xm4yPbqCqO/yz70bPv/MqW733u1l987nv2k+cvWVVcuaKvelz/tdboOtcvfmHVcjD3pD0uKmPURElPNxZM5SFVHqTl28T349f96+u9V8qr4Y2CsdIdD+XvKf951qu43TatBmwJ9xkDQAAIYwAIAGEMAAGoahhrvjtNt6Spk7xcLuemXwIA/EVNKuORkZGKr2nCUYX20tKSAcB+VfW7KTTpqOaym56edhOMxqlCVhBrG62Pj49va+ZoBOYPX5r9758MKGqiE7pVNbm1bXR01Hp6eh4JWgX0tWvX3HpXV5cL5EqTlyIhUgZgB2oSxqqMVfVmMhkbGHjwoVW1JTTuqTreqJ2BBPjrqAr6h78yoMSHhi2o2b8hFLaqjCcnJ91zBXG8T6zecTqdNgDYj2ra0FG7wt9ZoTAeGhqy/v5+F9CqmlU9y6lTp1wvGQD2i6q2KVQJx6tdBfDs7Gzx+fDwsLuop+DVuG9bZLNZLuQB2FeqGsYK13hfWMpbEXo+ODhYMkYQA9hvuO8EAAJAGANAAAhjAAgAYQwAASCMASAAhDEABIAwBoAA7Pw+Y03ymRRXrybrfJNqZcUA7MzOwzhJsy0zO3RtvPZu9MdNA7B9tCkAIAA1+QpNAKi606fNPvrIkorKGAACQBgDQAAIYwAIAGEMAAEgjAEgAIQxAASgJmGsiUdzuZxNT09vuN3Y2NiGr2t6Jk1cCgD1puphrIDVpKOaiHRmZsba29uLk5LGaWy98e1uAwBJVNUPffiKeHFxsTim6lgBrZmgta458BTSmjk6Pj+equD5+Xnr6Oiw5eVlN5O0n1NPgeyrbL02MDDwyNx6AJAkVa2Mr1+/7maAjvOzQYtCWGGtwJWJiQn3qDEtXV1dri1x4cIFN65w1j4VxplMxgWztunp6aFiDlxP3wfR8v7D5QNbWvl03e1SfxP9973zhQH7TVUrYwXpehXr7du3i+uaGbp8Nuh8Pm/ZbNa9t7u72yYnJx/Zh8YV7H5dVTizSodrMQrfpf/7ultXEPcPLNm1d75WfF1j6dZDVvh9R8n7/Hjc6tqDsG5pbjCgXlS1Mm5ra3vkgptC8+jRo8Xnqm7Lqa0RH29ubrbNUBknhwvXwoP1zPdvWeblWzbyw9+4irg7qppl6VYU2C8u2djrv3WV9PRba248f/m2C3K979R3blJFo25UNYx9S0IB7KnqVf93I7rgpxaG6L3qC6N+zF25WxKiXaeP2FS+3Vqa/lLpjr3+O+t9ocmyPzoRvZZ2FbIq4tzlT2x2+lm3fd+ZpiicPzGgHlS1TaHqdmpqyvV01XJQsOpim1oTG9HFvJGRkWLfWBU2kk/9YkmfOOQC1StvQ4jCd/yF425d7Yjhc8+4ENd4z8PqWYHeefKwAfWg6l+hqRBW20FthPKWhPrCcf6uC20bv7tC1bRozJudna24H4Rpdvq5LW+rAFarovNko3uuqlghruCOBzlQL2r2fcbr9YYrURirMlYYa32ztgbqz9C5p6O+8IqNv3LcZt66Y4VUwSZe+Vv32uSlj6wtCuXJH39sA2eP2uDZpwxIuiC/XF53RajyVVvD31uMZJt45fi64wP//JSreL0LP/iqe+yO+sjZN1pt5s21KHifsOGXnnHjqorVN77+3j0bjbbVdkA9CHqmDz7IUT/6Xlj/jpjyMI0/7/xGo1vKUQmjHvFFQQAQAMIYAAJAGANAAHbUM16+u2z5939midG4YJak802qr/ze7Nd3DIhb++zL4nrisqOGUg3ZxoIBAPYUbQoACABhDAABUBjzdWcAsMcUxkwqBwB7qjB3IGWFMQMA7KV8w5czny819B1MmaW6DQBQUyqIv8jcn3Df5h0F8tyBvoP6BveW6KW0AQCqphBdq4tC+H+iKjjzeeZ+TmN/BvD/UXSiJKryAAAAAElFTkSuQmCC";


void onConnect(StompFrame frame) {
  print("Socket Connected");
  stompClient.subscribe(
    destination: '/topic/2',
    callback: (frame) {
      final Map<String, dynamic> responseBody = json.decode(frame.body!);
      final labelDataListData = responseBody['body'];
      final chatModel = ChatModel.fromJson(labelDataListData);
      print(chatModel);

    },
  );

}
Future<void> sendMessage22(String imageBase64, String messageType, String sentBy, String sentTo) async {
  String current_date = ''; // You can remove this part if it's not needed for the message

  try {
    final Map<String, dynamic> messageData = {
      "chatId": 78,
      "sentBy": sentBy,
      "sentTo": sentTo,
      "message": imageBase64, // Use the base64-encoded image string
      "msgType": messageType,
      "timestmp": current_date, // You can remove this part if it's not needed for the message
    };

    // Establish the STOMP connection (if not already connected)
    if (!stompClient.connected) {
      // stompClient.activate();
      stompClient.activate();
    }
    final String messageDataJson = json.encode(messageData);
    print(messageDataJson);

    // Send the message

    stompClient.send(
      destination: '/app/messages',
      body: messageDataJson,
    );


    print('Message sent successfully.');
  } catch (e) {
    // Handle message sending error
    print('Error sending message: $e');
    // Add error handling logic here
  }
}
String second_dd= '/9j/4S85RXhpZgAASUkqAAgAAAARAA4BAgAgAAAA2gAAAA8BAgAgAAAA+gAAABABAgAgAAAAGgEAABIBAwABAAAAAQAAABoBBQABAAAAOgEAABsBBQABAAAAQgEAACgBAwABAAAAAgAAADEBAgAgAAAASgEAADIBAgAUAAAAagEAABMCAwABAAAAAgAAACACBAABAAAAAAAAACECBAABAAAAAAAAACICBAABAAAAAAAAACMCBAABAAAAAAAAACQCBAABAAAAAQAAACUCAgAgAAAAfgEAAGmHBAABAAAAngEAACADAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADVHAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAANUcAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABIAAAAAQAAAEgAAAABAAAATWVkaWFUZWsgQ2FtZXJhIEFwcGxpY2F0aW9uAAAAAAAyMDIzOjA5OjA5IDExOjA3OjM5AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAGQCaggUAAQAAANACAACdggUAAQAAANgCAAAiiAMAAQAAAAAAAAAniAMAAQAAAF8BAAAAkAcABAAAADAyMjADkAIAFAAAAOACAAAEkAIAFAAAAPQCAAABkQcABAAAAAECAwAEkgoAAQAAAAgDAAAHkgMAAQAAAAIAAAAIkgMAAQAAAP8AAAAJkgMAAQAAAAAAAAAKkgUAAQAAABADAACQkgIAAgAAADk0AACRkgIAAgAAADk0AACSkgIAAgAAADk0AAAAoAcABAAAADAxMDABoAMAAQAAAAEAAAACoAQAAQAAAMgEAAADoAQAAQAAAGAGAAAFoAQAAQAAAJYDAAACpAMAAQAAAAAAAAADpAMAAQAAAAAAAAAEpAUAAQAAABgDAAAGpAMAAQAAAAAAAAAAAAAAdBEBAEBCDwAcAAAACgAAADIwMjM6MDk6';
String  dddd= "/9j/4S85RXhpZgAASUkqAAgAAAARAA4BAgAgAAAA2gAAAA8BAgAgAAAA+gAAABABAgAgAAAAGgEAABIBAwABAAAAAQAAABoBBQABAAAAOgEAABsBBQABAAAAQgEAACgBAwABAAAAAgAAADEBAgAgAAAASgEAADIBAgAUAAAAagEAABMCAwABAAAAAgAAACACBAABAAAAAAAAACECBAABAAAAAAAAACICBAABAAAAAAAAACMCBAABAAAAAAAAACQCBAABAAAAAQAAACUCAgAgAAAAfgEAAGmHBAABAAAAngEAACADAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADVHAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAANUcAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABIAAAAAQAAAEgAAAABAAAATWVkaWFUZWsgQ2FtZXJhIEFwcGxpY2F0aW9uAAAAAAAyMDIzOjA5OjA5IDExOjA3OjM5AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAGQCaggUAAQAAANACAACdggUAAQAAANgCAAAiiAMAAQAAAAAAAAAniAMAAQAAAF8BAAAAkAcABAAAADAyMjADkAIAFAAAAOACAAAEkAIAFAAAAPQCAAABkQcABAAAAAECAwAEkgoAAQAAAAgDAAAHkgMAAQAAAAIAAAAIkgMAAQAAAP8AAAAJkgMAAQAAAAAAAAAKkgUAAQAAABADAACQkgIAAgAAADk0AACRkgIAAgAAADk0AACSkgIAAgAAADk0AAAAoAcABAAAADAxMDABoAMAAQAAAAEAAAACoAQAAQAAAMgEAAADoAQAAQAAAGAGAAAFoAQAAQAAAJYDAAACpAMAAQAAAAAAAAADpAMAAQAAAAAAAAAEpAUAAQAAABgDAAAGpAMAAQAAAAAAAAAAAA";

String  datass = "/9j/4RF0RXhpZgAASUkqAAgAAAARAA4BAgAgAAAA2gAAAA8BAgAgAAAA+gAAABABAgAgAAAAGgEAABIBAwABAAAAAQAAABoBBQABAAAAOgEAABsBBQABAAAAQgEAACgBAwABAAAAAgAAADEBAgAgAAAASgEAADIBAgAUAAAAagEAABMCAwABAAAAAgAAACACBAABAAAAAAAAACECBAABAAAAAAAAACICBAABAAAAAAAAACMCBAABAAAAAAAAACQCBAABAAAAAQAAACUCAgAgAAAAfgEAAGmHBAABAAAAngEAACADAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADVHAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAANUcAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABIAAAAAQAAAEgAAAABAAAATWVkaWFUZWsgQ2FtZXJhIEFwcGxpY2F0aW9uAAAAAAAyMDIzOjA4OjAyIDE5OjM1OjA3AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAGQCaggUAAQAAANACAACdggUAAQAAANgCAAAiiAMAAQAAAAAAAAAniAMAAQAAAEYAAAAAkAcABAAAADAyMjADkAIAFAAAAOACAAAEkAIAFAAAAPQCAAABkQcABAAAAAECAwAEkgoAAQAAAAgDAAAHkgMAAQAAAAIAAAAIkgMAAQAAAP8AAAAJkgMAAQAAAAEAAAAKkgUAAQAAABADAACQkgIAAgAAADM1AACRkgIAAgAAADM1AACSkgIAAgAAADM1AAAAoAcABAAAADAxMDABoAMAAQAAAAEAAAACoAQAAQAAAJAHAAADoAQAAQAAACAKAAAFoAQAAQAAAJYDAAACpAMAAQAAAAAAAAADpAMAAQAAAAAAAAAEpAUAAQAAABgDAAAGpAMAAQAAAAAAAAAAAAAAEU4AAEBCDwAYAAAACgAAADIwMjM6MDg6MDIgMTk6MzU6MDc";
//"/9j/4RGzRXhpZgAASUkqAAgAAAARAA4BAgAgAAAA2gAAAA8BAgAgAAAA+gAAABABAgAgAAAAGgEAABIBAwABAAAAAQAAABoBBQABAAAAOgEAABsBBQABAAAAQgEAACgBAwABAAAAAgAAADEBAgAgAAAASgEAADIBAgAUAAAAagEAABMCAwABAAAAAgAAACACBAABAAAAAAAAACECBAABAAAAAAAAACICBAABAAAAAAAAACMCBAABAAAAAAAAACQCBAABAAAAAQAAACUCAgAgAAAAfgEAAGmHBAABAAAAngEAACADAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADVHAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAANUcAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABIAAAAAQAAAEgAAAABAAAATWVkaWFUZWsgQ2FtZXJhIEFwcGxpY2F0aW9uAAAAAAAyMDIzOjA4OjAzIDE5OjA3OjE1AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAGQCaggUAAQAAANACAACdggUAAQAAANgCAAAiiAMAAQAAAAAAAAAniAMAAQAAAEwAAAAAkAcABAAAADAyMjADkAIAFAAAAOACAAAEkAIAFAAAAPQCAAABkQcABAAAAAECAwAEkgoAAQAAAAgDAAAHkgMAAQAAAAIAAAAIkgMAAQAAAP8AAAAJkgMAAQAAAAEAAAAKkgUAAQAAABADAACQkgIAAgAAADU5AACRkgIAAgAAADU5AACSkgIAAgAAADU5AAAAoAcABAAAADAxMDABoAMAAQAAAAEAAAACoAQAAQAAAJAHAAADoAQAAQAAACAKAAAFoAQAAQAAAJYDAAACpAMAAQAAAAAAAAADpAMAAQAAAAAAAAAEpAUAAQAAABgDAAAGpAMAAQAAAAAAAAAAAAAAVuoAAEBCDwAYAAAACgAAADIwMjM6MDg6MDMgMTk6MDc6MTU";
void  sendMessage(String  message,String messageType,String sentBy, String sentTo){
print("Message");
print(message);

  String current_date = '';
  DateTime now = DateTime.now();
  final random = Random();
  int randomNumber = random.nextInt(100);
  int currentTimeInMillis = DateTime.now().millisecondsSinceEpoch;
  int year = now.year;
  int  month = now.month;
  int day = now.day;
  int  hour = now.hour;
  int min = now.minute;
  int second = now.second;

  current_date = '$hour:$min:$second ,$day/$month/$year';
  // Convert milliseconds to seconds
  int currentTimeInSeconds = currentTimeInMillis ~/ 1000;
 try{
   final Map<String, dynamic> messageData = {
     "chatId": 19,
     "sentBy": sentBy,
     "sentTo": sentTo,
     "message": message,
     "msgType": messageType,
     "timestmp": current_date,
   };

   print( jsonEncode(messageData));
   stompClient.send(
     destination: '/app/messages',
     body: jsonEncode(messageData),
   );

   if(angenlFlag_Image)
   {
     print("Message  Send22");
     angenlFlag_SendImage=true;
   }
// Listen for responses or acknowledgments from the STOMP server
   stompClient.subscribe(
     destination: '/app/messages', // This is just an example destination, adjust as needed
     callback: (StompFrame frame) {
       // Handle the response here
       print('Received response: ${frame.body}');
       // You can add further logic here to check if the message was successfully sent
     },


   );
 }catch(e)
  {
    // Handle message sending error
    print('Error sending message: $e');
    // Add error handling logic here
  }

}
final stompClient = StompClient(
  config: StompConfig(
    url: 'ws://web-api-tht-env.eba-kcaa52ff.us-east-1.elasticbeanstalk.com/websocket',
    onConnect: onConnect,
    beforeConnect: () async {
      print('waiting to connect...');
      await Future.delayed(Duration(milliseconds: 200));
      print('connecting...');

    },
    onWebSocketError: (dynamic error) => print("Closed $error"),
    onStompError: (StompFrame frame)
    {
      print("Stomp Error");
    },
    stompConnectHeaders: {'Authorization': 'Bearer yourToken'},
    webSocketConnectHeaders: {'Authorization': 'Bearer yourToken'},
  ),
);


 Image arrifulGetBase64StringToBitmap(String Base64StringGet)
{
  Uint8List uint8List = base64Decode(Base64StringGet);
  Image image = Image.memory(
    uint8List,
    fit: BoxFit.cover, // Adjust the fit as needed
  );
  return image;

}

void main() {
  stompClient.activate();
}