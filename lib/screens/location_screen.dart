import 'package:clima/screens/LocationAccessScreen.dart';
import 'package:clima/screens/city_screen.dart';
import 'package:clima/services/weather.dart';
import 'package:clima/utilities/constants.dart';
import 'package:flutter/material.dart';

/*---------------------------------------------------------------- Page d'acceuil -----------------------------------------*/

class LocationScreen extends StatefulWidget {
  LocationScreen({this.data});
  final data;
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  int temp = 0;
  int id = 0;
  String name = '';
  @override
  void initState() {
    /** pour passer des données de classe parent au son state en utilise << widget >> **/
    updateUI(widget.data);
  }

  void updateUI(dynamic data) {
    // lorsque il n'a pas de données on fait une redirection vers la page de erreur
    if (data == null) {
      // autre Méthode pour faire la redirection auto vers autre Screen
      WidgetsBinding.instance.addPostFrameCallback((_) {
        // pour résoulue l'erreur setState() or markNeedsBuild() called during build
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return LocationAccessScreen();
        }));
      });
      return;
    }
    setState(() {
      double t = data['main']['temp'];
      temp = t.toInt();
      id = data['weather'][0]['id'];
      name = data['name'];
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
                  TextButton(
                    onPressed: () async {
                      var data = await WeatherModel.getLocation();
                      updateUI(data);
                      print(data['name']);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () async {
                      var CityName = await Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return CityScreen();
                      }));
                      if (CityName != null) {
                        var data = await WeatherModel.getCityWeather(CityName);
                        updateUI(data);
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 15.0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        '$temp°',
                        style: kTempTextStyle,
                      ),
                      Text(
                        WeatherModel.getWeatherIcon(id),
                        style: kConditionTextStyle,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: Text(
                    '${WeatherModel.getMessage(temp)} in $name',
                    textAlign: TextAlign.right,
                    style: kMessageTextStyle,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
