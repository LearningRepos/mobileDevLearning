import 'package:flutter/material.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'location_screen.dart';
import 'package:clima/services/weather.dart';


class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  initState(){
    super.initState();
    getLocationData();
  }

  void getLocationData() async{
    var weatherData = await WeatherModel().getLocationWeatherData();

    Navigator.push(context, MaterialPageRoute(builder: (context){
      return LocationScreen(
        weatherData: weatherData,
      );
    }));
  }
  // Future<bool> setPosition() async{
  //   longitude = await location.getLongitude();
  //   latitude = await location.getLatitude();
  //   // print('setPosition() longitude: $longitude, latitude: $latitude');
  //   // longitude = -23.727539;
  //   // latitude = 	37.983810;
  //   return true;
  // }

  // void getData() async{
  //   // http.Response response = await http.get('https://samples.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=439d4b804bc8187953eb36d2a8c26a02');
  //   if(longitude == null || latitude == null){
  //     await setPosition();
  //   }
  //   try{
  //   // var myURL = 'https://api.openweathermap.org/data/2.5/weather?lat=${latitude.toInt()}&lon=${longitude.toInt()}&appid=$apiKey';
  //   var myURL = 'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric';
  //     // print(myURL);
  //     Networking networkHelper = Networking(myURL);
  //     // https://samples.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=439d4b804bc8187953eb36d2a8c26a02
  //     // Networking networkHelper = Networking('https://samples.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=439d4b804bc8187953eb36d2a8c26a02');
  //     var decodedData = await networkHelper.getData();
  //     if (decodedData != null){
  //       String weatherMain = decodedData['weather'][0]['main'];
  //       int weatherId = decodedData['weather'][0]['id'];
  //       // double weatherTemp = (decodedData['main']['temp'] - 273.15);
  //       double weatherTemp = (decodedData['main']['temp']);
  //       String weatherCity = decodedData['name'];
  //       print('weatherMain: $weatherMain');
  //       print('weatherId: $weatherId');
  //       print('weatherTemp: $weatherTemp');
  //       print('weatherCity: $weatherCity');
  //       Navigator.push(context, MaterialPageRoute(builder: (context){
  //         return LocationScreen(
  //           weatherData: decodedData,
  //         );
  //       }));
  //     }
  //   } catch(e){
  //     print(e);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    getLocationData();
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
