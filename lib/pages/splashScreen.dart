import 'package:flutter/material.dart';
import 'package:future_api/main.dart';

class SplashScreen extends CultureTrip {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        color: Theme.of(context).primaryColor,
        child: Center(
          child: Container(
            width: 300,
            height: 300,
            child: Image.asset('lib/assets/images/CultureTrip-02.png'),
          ),
        ),
      ),
    );
  }
}
