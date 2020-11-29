import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkHelper {
  final String weatherURL;
  NetworkHelper(this.weatherURL);

  Future getData() async {
    var response = await http.get(weatherURL);
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      print(json);
      return json;
    } else {
      print("Bad api url 404");
    }
  }
}
