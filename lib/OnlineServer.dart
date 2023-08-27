
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class OnlineServer extends StatefulWidget {
  const OnlineServer({super.key});

  @override
  State<OnlineServer> createState() => _OnlineServerState();
}

class _OnlineServerState extends State<OnlineServer> {


  Future<List<String>> fetchCategories() async {
    final response = await http.get(Uri.parse('https://grozziie.zjweiting.com:8033/tht/labelCategories'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<String> categories = List<String>.from(data['allcategoris']);
      print(categories);
      return categories;
    } else {
      throw Exception('Failed to load categories');
    }
  }
  Future<List<String>> fetchCategories22() async {
    final response = await http.get(Uri.parse('https://grozziie.zjweiting.com:8033/tht/labelCategories'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<String> categories = List<String>.from(data['allcategories']);
      return categories;
    } else {
      throw Exception('Failed to load categories');
    }
  }
  Future<List<String>> fetchCategories223() async {
    final response = await http.get(Uri.parse('https://grozziie.zjweiting.com:8033/tht/labelCategories'));

    if (response.statusCode == 200) {
      final dynamic decodedData = json.decode(response.body);
      if (decodedData is Map && decodedData.containsKey('allcategories')) {
        final List<String> categories = List<String>.from(decodedData['allcategories']);
        return categories;
      } else {
        throw Exception('Invalid response format or missing "allcategories" key');
      }
    } else {
      throw Exception('Failed to load categories');
    }
  }
  List<String> allCategories = [];
  Future<List<String>> fetchAllCategories2() async {
    final response = await http.get(Uri.parse('https://grozziie.zjweiting.com:8033/tht/labelCategories'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
    //  print(data);



      setState(() {
        allCategories = data.map<String>((item) => item['allCategories']).toList();
      });


      return allCategories;
    } else {
      throw Exception('Failed to load data');
    }
  }
  //add Categories

  Future<void> addCategory(String id, String allCategories, String subCategories) async {
    final Map<String, dynamic> data = {
      'id': id,
      'categoryName': allCategories,
      'subCategoryName': subCategories,
    };

    final response = await http.post(
      Uri.parse('https://grozziie.zjweiting.com:8033/tht/labelCategories/add'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(data),
    );

    if (response.statusCode == 200) {
      print('Category added successfully');
    } else {
      throw Exception('Failed to add category');
    }
  }

  Future<void> addCategory22(String categoryName) async {
    final Map<String, dynamic> data = {
      'categoryName': categoryName,
    };

    final response = await http.post(
      Uri.parse('https://grozziie.zjweiting.com:8033/tht/labelCategories/add'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(data),
    );

    if (response.statusCode == 200) {
      print('Category added successfully');
    } else {
      throw Exception('Failed to add category');
    }
  }

  Future<void> addLabelData() async {
    final url = 'https://grozziie.zjweiting.com:8033/tht/allLabelData/add';
    final headers = {'Content-Type': 'application/json'};

    final data = {
      "subCategoryName": "Ekdala",
      "labelDataList": {
        "contentData": "data update_2",
        "positionX": "x2",
        "positionY": "y2",
        "widgetWidth": "322",
        "widgetHeight": "432",
        "index": "32",
        "length": "342",
        "barcodeType": "boo2l",
        "textSize": "324",
        "bold": "yt2",
        "underline": "4325",
        "fromwhere": "r2t",
        "type": "r2t",
        "address": "rt2r"
      },
      "LabelDataView": {
        "id": "4532",
        "myid": "r425",
        "date": "5625",
        "size": "562",
        "name": "526",
        "imagebitmap": "625"
      }
    };

    final response = await http.post(Uri.parse(url), headers: headers, body: json.encode(data));

    if (response.statusCode == 200) {
      print("LabelData added successfully");
    } else {
      print("Failed to add LabelData. Status code: ${response.statusCode}");
      print("Response body: ${response.body}");
    }
  }
  Future<void> fetchAllLabelData() async {
    final url = 'https://grozziie.zjweiting.com:8033/tht/allLabelData';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final List<dynamic> labelDataList = json.decode(response.body);
      print("Fetched ${labelDataList.length} label data entries");

      // Process and use the label data as needed
      for (var labelData in labelDataList) {
        // Process individual label data here
        print("Label Data: $labelData");
      }
    } else {
      print("Failed to fetch label data. Status code: ${response.statusCode}");
      print("Response body: ${response.body}");
    }
  }
  Future<void> fetchLabelDataBySubCategory(String subCategoryName) async {
    final url = 'https://grozziie.zjweiting.com:8033/tht/allLabelData';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final List<dynamic> labelDataList = json.decode(response.body);
      //final List<dynamic> labelDataListX=null;
      print(labelDataList);
      print(labelDataList[0].length);
      final labelDataListX = labelDataList[0]['id'];
      final labelDataListY = labelDataList[0]['subCategoryName'];
      final labelDataListZ = labelDataList[0]['LabelDataLIst'];
      final decodedDataX = json.decode(labelDataListZ);


      print(labelDataListX);
      print(labelDataListY);
      print(labelDataListZ);
      print(decodedDataX['positionX']);

      final jsonString ='{"id": 1, "subCategoryName": "S M ZUBAYER", "LabelDataLIst": {"contentData":"data update","positionX":"x","positionY":"y","widgetWidh":"32","widgetHeight":"43","index":"3","length":"34","barcodeType":"bool","textSize":"34","bold":"yt","underline":"435","fromWhere":"rt","type":"rt","address":"rtr"}, "LabelDataView": {"id":"453","myid":"r45","date":"565","size":"56","name":"56","imagebitmap":"65"}}';
      // final jsonString = labelDataList[0];//'{"id": 1, "subCategoryName": "S M ZUBAYER", "LabelDataLIst": {"contentData":"data update","positionX":"x","positionY":"y","widgetWidh":"32","widgetHeight":"43","index":"3","length":"34","barcodeType":"bool","textSize":"34","bold":"yt","underline":"435","fromWhere":"rt","type":"rt","address":"rtr"}, "LabelDataView": {"id":"453","myid":"r45","date":"565","size":"56","name":"56","imagebitmap":"65"}}';
      print(' Jason Vaolue  $jsonString');
      final decodedData = json.decode(jsonString);

      print(decodedData['id']);
      return;

    }



  }
  List<String> qrCodes = [];
  List<Offset> qrCodeOffsets = [];
  List<double> qrCodesContainerRotations =[] ;
  List<double> updateQrcodeSize = [];

  Future<void> fetchLabelDataBySubCategory23(String subCategoryName) async {
    final url = 'https://grozziie.zjweiting.com:8033/tht/allLabelData';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final List<dynamic> labelDataList = json.decode(response.body);

      print("Total label data entries: ${labelDataList.length}");

      // Process each label data entry
      final filteredLabelData = labelDataList.where((labelData) =>
      labelData['subCategoryName'] == subCategoryName).toList();
      for (var labelData in filteredLabelData) {
        final id = labelData['id'];
        final categoryName = labelData['subCategoryName'];
        final labelDataListData = labelData['LabelDataLIst'];

        print("ID: $id");
        print("SubCategoryName: $categoryName");

        final decodedData = json.decode(labelDataListData);
        final contentData= decodedData['contentData'];
        final positionX= decodedData['positionX'];
        final positionY= decodedData['positionY'];
        final widgetWidh= decodedData['widgetWidh'];
        final widgetHeight= decodedData['widgetHeight'];
        final index= decodedData['index'];
        final length= decodedData['length'];
        final barcodeType= decodedData['barcodeType'];
        final textSize= decodedData['textSize'];

        final bold= decodedData['bold'];
        final underline= decodedData['underline'];
        final fromWhere= decodedData['fromWhere'];
        final type= decodedData['type'];
        final address= decodedData['address'];
        print("Decoded PositionX: $contentData");
        // ... access other fields
      //retriving feature view
        final labelDataView = labelData['LabelDataView'];
        final decodedData_view = json.decode(labelDataView);

        final id_view= decodedData_view['id'];
        final myid= decodedData_view['myid'];
        final date= decodedData_view['date'];
        final size= decodedData_view['size'];
        final name= decodedData_view['name'];
        final imagebitmap= decodedData_view['imagebitmap'];
        print(imagebitmap);
      }
    } else {
      print("Failed to fetch label data. Status code: ${response.statusCode}");
      print("Response body: ${response.body}");
    }
  }

  //sssssss
  Future<void> fetchLabelDataBySubCategory22(String subCategoryName) async {
    final url = 'https://grozziie.zjweiting.com:8033/tht/allLabelData';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final List<dynamic> labelDataList = json.decode(response.body);
      //final List<dynamic> labelDataListX=null;
      print(labelDataList);
      print(labelDataList[0].length);
      final labelDataListX = labelDataList[0]['id'];
      final labelDataListY = labelDataList[0]['subCategoryName'];
      final labelDataListZ = labelDataList[0]['LabelDataLIst'];
      final decodedDataX = json.decode(labelDataListZ);


      print(labelDataListX);
      print(labelDataListY);
      print(labelDataListZ);
      print(decodedDataX['positionX']);
      final filteredLabelData = labelDataList.where((labelData) =>
      labelData['subCategoryName'] == subCategoryName).toList();

      print("Found ${filteredLabelData.length} label data entries with subCategoryName: $subCategoryName");


      // Process and use the filtered label data as needed
      for (var labelData in filteredLabelData) {


        print('Ariful 1 : $labelData');
      }
    } else {
      print("Failed to fetch label data. Status code: ${response.statusCode}");
      print("Response body: ${response.body}");
    }


    }




  //ssssssss

/*
  Future<void> fetchLabelDataBySubCategory(String subCategoryName) async {
    final url = 'https://grozziie.zjweiting.com:8033/tht/allLabelData';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final List<String> labelDataList = json.decode(response.body);
      //final List<dynamic> labelDataListX=null;
      print(labelDataList);
      String xxx=labelDataList[0];
      final jsonString = xxx;//'{"id": 1, "subCategoryName": "S M ZUBAYER", "LabelDataLIst": {"contentData":"data update","positionX":"x","positionY":"y","widgetWidh":"32","widgetHeight":"43","index":"3","length":"34","barcodeType":"bool","textSize":"34","bold":"yt","underline":"435","fromWhere":"rt","type":"rt","address":"rtr"}, "LabelDataView": {"id":"453","myid":"r45","date":"565","size":"56","name":"56","imagebitmap":"65"}}';
     // final jsonString = labelDataList[0];//'{"id": 1, "subCategoryName": "S M ZUBAYER", "LabelDataLIst": {"contentData":"data update","positionX":"x","positionY":"y","widgetWidh":"32","widgetHeight":"43","index":"3","length":"34","barcodeType":"bool","textSize":"34","bold":"yt","underline":"435","fromWhere":"rt","type":"rt","address":"rtr"}, "LabelDataView": {"id":"453","myid":"r45","date":"565","size":"56","name":"56","imagebitmap":"65"}}';
print(' Jason Vaolue  $jsonString');
    final decodedData = json.decode(jsonString);
     // final myObject = LabelDataModel.fromJson(decodedData);
      //print("myObject");
     //print(myObject);

      // Now you can use the decoded data
      print(decodedData['id']);


      //========================
      //final jsonData = json.decode(jsonString);
      //final Map<String, dynamic> jsonString = json.decode(labelDataList[0]);
      //final jsonString =;// '{"id": 1, "subCategoryName": "S M ZUBAYER", "LabelDataLIst": {"contentData":"data update","positionX":"x","positionY":"y","widgetWidh":"32","widgetHeight":"43","index":"3","length":"34","barcodeType":"bool","textSize":"34","bold":"yt","underline":"435","fromWhere":"rt","type":"rt","address":"rtr"}, "LabelDataView": {"id":"453","myid":"r45","date":"565","size":"56","name":"56","imagebitmap":"65"}}';
    //  print("arifulXXXX");
      //print(jsonString);

      //final jsonData = json.decode(jsonString);
      //final jsonData = json.decode(jsonString);
      //final Map<String, dynamic> jsonData = json.decode(jsonString);

      //final labelDataListX = jsonData['id'];
      //final labelDataListY = jsonData[1];
      //final labelDataListZ = jsonData[2];
      //final labelDataListW = jsonData[3];
     // print("ariful");
     // print(labelDataListX);
      //print(labelDataListY);
      //print(labelDataListZ);
     // print(labelDataListW);
      //========================

      final filteredLabelData = labelDataList.where((labelData) =>
     labelData['subCategoryName'] == subCategoryName).toList();

      print("Found ${filteredLabelData.length} label data entries with subCategoryName: $subCategoryName");


      // Process and use the filtered label data as needed
      for (var labelData in filteredLabelData) {
        // Process individual label data here
       // extractLabelDataListData(labelData);
       // final labelDataModel = LabelDataModel.fromJson(labelData);
        //print("Label Data From Export  : $labelDataModel");
        final jsonData = json.decode(labelData);

        final List<String> dataList = jsonData.keys.map((key) => jsonData[key]).toList();
        print('Ariful 1 : $dataList');
      }
    } else {
      print("Failed to fetch label data. Status code: ${response.statusCode}");
      print("Response body: ${response.body}");
    }
  }

  */

  Future<void> fetchLabelDataListBySubCategory11(String subCategoryName) async {
    final url = 'https://grozziie.zjweiting.com:8033/tht/allLabelData';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final List<dynamic> labelDataList = json.decode(response.body);

      // Process data from the labelDataList field based on subCategoryName
      for (var labelData in labelDataList) {
        if (labelData['subCategoryName'] == subCategoryName) {
          final labelDataListField = labelData['labelDataList'];

          // Process individual labelDataList field data here
          print("Label Data List Field: $labelDataListField");
        }
      }
    } else {
      print("Failed to fetch label data. Status code: ${response.statusCode}");
      print("Response body: ${response.body}");
    }
  }
  void extractLabelDataListData(dynamic labelDataListField) {
    final List<Map<String, dynamic>> extractedData = [];
    print(labelDataListField['contentData']);

    if (labelDataListField is Map<String, dynamic>) {
      final String contentData = labelDataListField['contentData'] ?? '';
      final positionX = labelDataListField['positionX'] ?? '';
      final positionY = labelDataListField['positionY'] ?? '';
      final widgetWidth = labelDataListField['widgetWidth'] ?? '';
      final widgetHeight = labelDataListField['widgetHeight'] ?? '';
      final index = labelDataListField['index'] ?? '';
      final length = labelDataListField['length'] ?? '';
      final barcodeType = labelDataListField['barcodeType'] ?? '';
      final textSize = labelDataListField['textSize'] ?? '';
      final bold = labelDataListField['bold'] ?? '';
      final underline = labelDataListField['underline'] ?? '';
      final fromwhere = labelDataListField['fromwhere'] ?? '';
      final type = labelDataListField['type'] ?? '';
      final address = labelDataListField['address'] ?? '';

      extractedData.add({
        "contentData": contentData,
        "positionX": positionX,
        "positionY": positionY,
        "widgetWidth": widgetWidth,
        "widgetHeight": widgetHeight,
        "index": index,
        "length": length,
        "barcodeType": barcodeType,
        "textSize": textSize,
        "bold": bold,
        "underline": underline,
        "fromwhere": fromwhere,
        "type": type,
        "address": address,
      });

      // Use the extractedData list as needed
      print("Extracted Data: $extractedData");
    } else {
      print("Invalid labelDataListField structure");
    }
  }
  //
  void extractLabelDataList(dynamic jsonData) {
    if (jsonData is Map<String, dynamic>) {
      if (jsonData['LabelDataLIst'] is Map<String, dynamic>) {
        final labelDataListField = jsonData['LabelDataLIst'];
        print("Extracted LabelDataList: $labelDataListField");
      } else {
        print("Invalid LabelDataLIst structure");
      }
    } else {
      print("Invalid JSON structure");
    }
  }
  void extractLabelDataList22(dynamic jsonData) {
    if (jsonData is Map<String, dynamic>) {
      if (jsonData['LabelDataList'] is Map<String, dynamic>) { // Corrected field name
        final labelDataListField = jsonData['LabelDataList']; // Corrected field name
        print("Extracted LabelDataList: $labelDataListField");
      } else {
        print("Invalid LabelDataList structure"); // Corrected field name
      }
    } else {
      print("Invalid JSON structure");
    }
  }
  void extractAndSaveValues(dynamic jsonData) {
    List<int> ids = [];
    List<String> subCategoryNames = [];
    List<Map<String, dynamic>> labelDataList = [];
    List<Map<String, dynamic>> labelDataView = [];

    if (jsonData is Map<String, dynamic>) {
      final id = jsonData['id'] as int;
      final subCategoryName = jsonData['subCategoryName'] as String;

      final labelDataListField = jsonData['LabelDataLIst'];
      final labelDataViewField = jsonData['LabelDataView'];

      ids.add(id);
      subCategoryNames.add(subCategoryName);
      labelDataList.add(labelDataListField);
      labelDataView.add(labelDataViewField);

      print("IDs: $ids");
      print("SubCategoryNames: $subCategoryNames");
      print("LabelDataList: $labelDataList");
      print("LabelDataView: $labelDataView");
    } else {
      print("Invalid JSON structure");
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      init();
      //fetchCategories();
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Online Server"),
        ),
        body: ListView.builder(
          itemCount: allCategories.length,

          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(allCategories[index]),
            );

          },

        ),
      ),
    );
  }

  void init() async {
    try {
      //await addCategory22("Tamim");
     // await addCategory("11","AAAAA","Ekdala");
      await  fetchLabelDataBySubCategory23("Ekdala");
     print('Category added successfully');
    } catch (e) {
      print('Error adding category: $e');
    }
    await fetchAllCategories2();
  }
}
class LabelDataModel {
  int id;
  String subCategoryName;
  LabelDataList labelDataList;
  LabelDataView labelDataView;

  LabelDataModel({
    required this.id,
    required this.subCategoryName,
    required this.labelDataList,
    required this.labelDataView,
  });

  factory LabelDataModel.fromJson(Map<String, dynamic> json) {
    return LabelDataModel(
      id: json['id'],
      subCategoryName: json['subCategoryName'],
      labelDataList: LabelDataList.fromJson(json['LabelDataLIst']),
      labelDataView: LabelDataView.fromJson(json['LabelDataView']),
    );
  }
}

class LabelDataList {
  String contentData;
  String positionX;
  String positionY;
  String widgetWidth;
  String widgetHeight;
  String index;
  String length;
  String barcodeType;
  String textSize;
  String bold;
  String underline;
  String fromwhere;
  String type;
  String address;

  LabelDataList({
    required this.contentData,
    required this.positionX,
    required this.positionY,
    required this.widgetWidth,
    required this.widgetHeight,
    required this.index,
    required this.length,
    required this.barcodeType,
    required this.textSize,
    required this.bold,
    required this.underline,
    required this.fromwhere,
    required this.type,
    required this.address,
  });

  factory LabelDataList.fromJson(Map<String, dynamic> json) {
    return LabelDataList(
      contentData: json['contentData'],
      positionX: json['positionX'],
      positionY: json['positionY'],
      widgetWidth: json['widgetWidth'],
      widgetHeight: json['widgetHeight'],
      index: json['index'],
      length: json['length'],
      barcodeType: json['barcodeType'],
      textSize: json['textSize'],
      bold: json['bold'],
      underline: json['underline'],
      fromwhere: json['fromwhere'],
      type: json['type'],
      address: json['address'],
    );
  }
}

class LabelDataView {
  String id;
  String myid;
  String date;
  String size;
  String name;
  String imagebitmap;

  LabelDataView({
    required this.id,
    required this.myid,
    required this.date,
    required this.size,
    required this.name,
    required this.imagebitmap,
  });

  factory LabelDataView.fromJson(Map<String, dynamic> json) {
    return LabelDataView(
      id: json['id'],
      myid: json['myid'],
      date: json['date'],
      size: json['size'],
      name: json['name'],
      imagebitmap: json['imagebitmap'],
    );
  }
}
