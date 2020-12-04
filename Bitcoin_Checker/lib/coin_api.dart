import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

class Coin_API {
  String apiKey = "";
  Future getOriginalBitcoinData() async {
    var data = await http
        .get("https://rest.coinapi.io/v1/exchangerate/BTC/USD?apikey=$apiKey");
    if (data.statusCode == 200) {
      var json = convert.jsonDecode(data.body);
      return json;
    } else {
      return null;
    }
  }

  Future getOriginalEthereumData() async {
    var data = await http
        .get("https://rest.coinapi.io/v1/exchangerate/ETH/USD?apikey=$apiKey");
    if (data.statusCode == 200) {
      var json = convert.jsonDecode(data.body);
      return json;
    } else {
      return null;
    }
  }

  Future getOriginalLitecoinData() async {
    var data = await http
        .get("https://rest.coinapi.io/v1/exchangerate/LTC/USD?apikey=$apiKey");
    if (data.statusCode == 200) {
      var json = convert.jsonDecode(data.body);
      return json;
    } else {
      return null;
    }
  }

  Future getCurrencyBitcoinData(String currency) async {
    var data = await http.get(
        "https://rest.coinapi.io/v1/exchangerate/BTC/$currency?apikey=$apiKey");
    if (data.statusCode == 200) {
      var json = convert.jsonDecode(data.body);
      return json;
    } else {
      return null;
    }
  }

  Future getCurrencyEthereumData(String currency) async {
    var data = await http.get(
        "https://rest.coinapi.io/v1/exchangerate/ETH/$currency?apikey=$apiKey");
    if (data.statusCode == 200) {
      var json = convert.jsonDecode(data.body);
      return json;
    } else {
      return null;
    }
  }

  Future getCurrencyLitecoinData(String currency) async {
    var data = await http.get(
        "https://rest.coinapi.io/v1/exchangerate/LTC/$currency?apikey=$apiKey");
    if (data.statusCode == 200) {
      var json = convert.jsonDecode(data.body);
      return json;
    } else {
      return null;
    }
  }
}
