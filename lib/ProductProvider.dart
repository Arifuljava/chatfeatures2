import 'dart:convert';

import 'package:chatfeatures/NodelData.dart';
import 'package:chatfeatures/network.dart';
import 'package:flutter/material.dart';
class ProductProvider with ChangeNotifier {
  NodelData productModel = NodelData();

  List<NodelData> dotPrinterList = [];
  List<NodelData> thermalPrinterList = [];
  List<NodelData> attendanceMachineList = [];

  Future<void> getAllProduct() async {
    await getDotProduct();
  //  await getThermalProduct();
  //  await getAttendanceProduct();
  }

  Future<void> getDotProduct() async {
    var res = await Network().getDataOpen('');
    var body = json.decode(res.body);

    if (res.statusCode == 200) {
      dotPrinterList.clear();
      for (var item in body) {
        dotPrinterList.add(NodelData.fromJson(item));
      }

      notifyListeners();
    }
  }




}