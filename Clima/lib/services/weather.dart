import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:clima/utilities/apikey.dart';

var apiKey = openWeatherMapApiKey;
const weatherAPIURL = 'https://api.openweathermap.org/data/2.5/weather';
var latitude = 37.0;
var longitude = 23.0;
var units = 'metric';
var weatherURIParameters;

class WeatherModel {

  Future<dynamic> getCityWeatherData(String cityName) async{
    weatherURIParameters = '?q=$cityName&appid=$apiKey&units=$units';
    Networking networkHelper = Networking('$weatherAPIURL$weatherURIParameters');
    var weatherData = networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeatherData() async {
    weatherURIParameters = '?lat=$latitude&lon=$longitude&appid=$apiKey&units=$units';
    Location location = Location();
    await location.getPosition();
    latitude = await location.getLatitude();
    longitude = await location.getLongitude();
    Networking networkHelper = Networking('$weatherAPIURL$weatherURIParameters');
    var weatherData = networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
