import 'location.dart';
import 'networking.dart';
const String  apikey='5653c8ee103d8578f9a1e5ae893ffdb6';
class WeatherModel {

  double longtitude=0;
  double latitude=0;
  Future<dynamic> getCityWeather (String cityName) async {
    NetworkHelper networkHelper=NetworkHelper(latitude: latitude.toString(), longtitude: longtitude.toString(), apikey: apikey,cityname: cityName);
    dynamic deco=await networkHelper.getDataCity();
    return deco;
  }
  Future<dynamic> getLocation() async {
    Location location=Location();
    await location.getCurrentLocation();
    longtitude=location.longtitude;
    latitude=location.latitude;
    NetworkHelper networkHelper=NetworkHelper(latitude: latitude.toString(), longtitude: longtitude.toString(), apikey: apikey,cityname: "");
    dynamic deco=await networkHelper.getData();
    return deco;
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
