
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
      print(data);



      setState(() {
        allCategories = data.map<String>((item) => item['allCategories']).toList();
      });
print(allCategories);

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
     // print('Category added successfully');
    } catch (e) {
      print('Error adding category: $e');
    }
    await fetchAllCategories2();
  }
}
