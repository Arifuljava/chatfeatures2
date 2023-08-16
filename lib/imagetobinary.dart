



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class imagetobinary extends StatefulWidget {
  const imagetobinary({super.key});

  @override
  State<imagetobinary> createState() => _imagetobinaryState();
}

class _imagetobinaryState extends State<imagetobinary> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Image To Binary"),
        ),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.all(50),
              alignment: Alignment.center,
              height: 250,
              width: 250,
              child: Image.network(
                'https://picsum.photos/250?image=9',
              ),

            )
          ],
        ),
      ),
    );
  }
}
