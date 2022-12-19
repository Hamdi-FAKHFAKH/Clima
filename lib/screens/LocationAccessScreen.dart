import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';

/*----------------------------------------- Page afficher lorsque l'acces au position est refuser --------------------------------  */
class LocationAccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "images/9_Location Error.png",
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.15,
            left: MediaQuery.of(context).size.width * 0.3,
            right: MediaQuery.of(context).size.width * 0.3,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 13),
                    blurRadius: 25,
                    color: Color(0xFFD27E4A).withOpacity(0.17),
                  ),
                ],
              ),
              child: FlatButton(
                color: Color(0xFFFF9858),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                onPressed: () async {
                  var data = await WeatherModel.getLocation();
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return LocationScreen(data: data);
                  }));
                },
                child: Text(
                  "Enable".toUpperCase(),
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
