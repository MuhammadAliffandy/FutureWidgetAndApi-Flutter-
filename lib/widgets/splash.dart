
import "package:flutter/material.dart";
import "package:future_api/pages/splashScreen.dart";
import "package:future_api/pages/trip.dart";

class MySplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FutureBuilder(
      future: Future.delayed(Duration(seconds: 3)),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return TripScreen();
        } else {
          return SplashScreen();
        }
      },
    );
  }
}
