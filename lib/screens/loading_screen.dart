import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

/*-----------------------------------------  page loading jusqu'a récupération de la position -------------------------------------*/
class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void getposition() async {
    // data contient la resultat de API permet de récuperer la position et le weather a partir de long et alt
    var data = await WeatherModel.getLocation();
    // permet de faire la redirection auto vers un autre screen
    Future.delayed(Duration.zero, () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return LocationScreen(data: data);
      }));
    });
  }

  void initState() {
    // méthode appeler lors de la création de la widget LoadingScreen
    getposition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitFadingFour(
          //----------------------spinner -------------------//
          color: Colors.white,
          size: 100,
        ),
      ),
    );
  }
}
