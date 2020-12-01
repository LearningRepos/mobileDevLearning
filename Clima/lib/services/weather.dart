import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

String apiKey = '73301a55115867f0c4504fca82cd9ff0';
String openWeatherMapURL = "http://api.openweathermap.org/data/2.5/weather";

class WeatherModel {
  Future getCityWeather(String cityName) async {
    var netHelp = NetworkHelper(
        "$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric");
    var weatherData = await netHelp.getData();
    return weatherData;
  }

  Future getLocationWeather() async {
    Location location = new Location();
    await location.getCurrentLocation();
    var netHelp = NetworkHelper(
        "$openWeatherMapURL?lat=${location.getLatitude()}&lon=${location.getLongitude()}&appid=$apiKey&units=metric");
    var weatherData = await netHelp.getData();
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
