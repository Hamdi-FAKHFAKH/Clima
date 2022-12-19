import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

class WeatherModel {
  // get location methode
  static Future getLocation() async {
    Location location = new Location();
    await location.getposition();
    //get result from API
    Networking net = Networking(
        'https://api.openweathermap.org/data/2.5/weather?lat=${location.Latitude}&lon=${location.Longitude}&appid=7dbf85e165599268322f4ac8d773dffe&units=metric');
    return net.getdata();
  }

// get weather type a partir de nom de city
  static Future getCityWeather(String cityName) async {
    Networking net = Networking(
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=7dbf85e165599268322f4ac8d773dffe&units=metric');
    return net.getdata();
  }

//condition : est un valeur retourner par API weather Permet de données le types de météo ( cloud , Rain , snow , clair,....)
  static String getWeatherIcon(int condition) {
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

  static String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'You\'ll need 🧥';
    }
  }
}
