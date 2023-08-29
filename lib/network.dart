import 'dart:convert';

import 'package:http/http.dart' as http;

class Network {
  // server ip

  String url = 'https://grozziie.zjweiting.com:8033/tht/allLabelData';

  var token;

  postDataOpen(data, apiUrl) async {
    Uri fullUrl = Uri.parse(url + apiUrl);
    var res = await http.post(
      fullUrl,
      body: jsonEncode(data),
      headers: _setHeadersOpen(),
    );
    return res;
  }

  getDataOpen(apiUrl) async {
    Uri fullUrl = Uri.parse(url + apiUrl);
    var res = await http.get(fullUrl);

    return res;
  }

  _setHeaders() => {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $token'
  };
  _setHeadersOpen() => {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };
}