import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

class Coin_API {
  String apiKey = "";
  Future getData() async {
    var data = await http
        .get("https://rest.coinapi.io/v1/exchangerate/BTC/USD?apikey=$apiKey");
    if (data.statusCode == 200) {
      var json = convert.jsonDecode(data.body);
      return json;
    } else {
      return null;
    }
  }
}
