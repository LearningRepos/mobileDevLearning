import 'package:clima/screens/city_screen.dart';
import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:clima/services/weather.dart';
import 'city_screen.dart';

import '../services/weather.dart';

class LocationScreen extends StatefulWidget {
  final weatherData;
  LocationScreen({this.weatherData});

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  var weatherData;
  int temperature = 0;
  int condition = 500;
  String location = '';

  @override
  void initState() {
    super.initState();
    weatherData = widget.weatherData;
    updateUI(weatherData);
  }

  void updateUI(weatherData) {
    setState(() {
      if (weatherData == null) {
        print('updateUI() weatherData is null');
        // temperature = 1;
        // condition = 500;
        // location = '';
      } else {
        print('updateUI weatherData: $weatherData');
        double temp = weatherData['main']['temp'];
        temperature = temp.toInt();
        condition = weatherData['weather'][0]['id'];
        location = weatherData['name'];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () async {
                      print('button pressed');
                      var setStateWeatherData =
                          await WeatherModel().getLocationWeatherData();
                      print(
                          '\nlocation screen setState setStateWeatherData: $setStateWeatherData');
                      updateUI(setStateWeatherData);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () async {
                      var cityName = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return CityScreen(
                                // weatherData: decodedData,
                                );
                          },
                        ),
                      );
                      if(cityName.isNotEmpty){
                        print(cityName);
                        var weatherData = await WeatherModel().getCityWeatherData(cityName);
                        updateUI(weatherData);
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      // '32°',
                      '$temperature',
                      style: kTempTextStyle,
                    ),
                    Text(
                      // '☀️',
                      '${WeatherModel().getWeatherIcon(condition)}',
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  // "It's 🍦 time in $location",
                  '${WeatherModel().getMessage(temperature)} in $location',
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
