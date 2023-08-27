
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

      // Filter the label data by subCategoryName
      final filteredLabelData = labelDataList.where((labelData) =>
      labelData['subCategoryName'] == subCategoryName).toList();

      print("Found ${filteredLabelData.length} label data entries with subCategoryName: $subCategoryName");

      // Process and use the filtered label data as needed
      for (var labelData in filteredLabelData) {
        // Process individual label data here
        extractLabelDataList22(labelData);
        print("Label Data: $labelData");
      }
    } else {
      print("Failed to fetch label data. Status code: ${response.statusCode}");
      print("Response body: ${response.body}");
    }
  }
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

    if (labelDataListField is Map<String, dynamic>) {
      final contentData = labelDataListField['contentData'] ?? '';
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
      await  fetchLabelDataBySubCategory("Ekdala");
     print('Category added successfully');
    } catch (e) {
      print('Error adding category: $e');
    }
    await fetchAllCategories2();
  }
}
