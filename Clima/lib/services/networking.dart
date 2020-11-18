import 'dart:convert';
import 'package:http/http.dart' as http;

class Networking{

  final String url;
  Networking(this.url);

  Future getData() async{
    http.Response response = await http.get(url);
    if(response.statusCode == 200){
      var data = response.body;
      try{
        var decodedData = jsonDecode(data);
        return decodedData;
      } catch(e) {
        print('Networking: JSON decoding failed');
      }
    } else{
      print('Networking: HTTP service error: ${response.statusCode}');
      throw('HTTPServiceErrorException');
    }
  }

}