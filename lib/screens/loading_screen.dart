import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void getposition() async {
    var data = await WeatherModel.getLocation();
    Future.delayed(Duration.zero, () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return LocationScreen(data: data);
      }));
    });
  }

  void initState() {
    // méthode appler lors de la création de la widget LoadingScreen
    getposition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitFadingFour(
          //----------------------snipet
          color: Colors.white,
          size: 100,
        ),
      ),
    );
  }
}
