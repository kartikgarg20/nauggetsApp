import 'dart:convert';

import 'package:http/http.dart' as http;

class RemoteService {
  static var client = http.Client();

  static Future post(
      {required String key, required Map<String, String> myMap}) async {
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    var body = myMap;
    var response = await client.post(Uri.parse('https://reqres.in/$key'),
        headers: headers, body: jsonEncode(myMap));

    if (response.statusCode == 200) {
      var data = response.body;
      return data;
    } else {
      return null;
    }
  }
}
