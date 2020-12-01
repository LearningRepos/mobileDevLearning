import "package:clima/screens/location_screen.dart";
import "package:clima/services/location.dart";
import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  String apiKey = '73301a55115867f0c4504fca82cd9ff0';
  final spinkit = SpinKitRotatingCircle(
    color: Colors.white,
    size: 100.0,
  );
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: spinkit,
      ),
    );
  }

  void getLocationData() async {
    Location location = new Location();
    await location.getCurrentLocation();
    var netHelp = NetworkHelper(
        "http://api.openweathermap.org/data/2.5/weather?lat=${location.getLatitude()}&lon=${location.getLongitude()}&appid=$apiKey&units=imperial");
    var weatherData = await netHelp.getData();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return LocationScreen(weatherData);
        },
      ),
    );
  }
}
