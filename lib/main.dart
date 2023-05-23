import 'package:flutter/material.dart';
import 'package:future_api/widgets/splash.dart';

void main() {
  runApp(CultureTrip());
}

class CultureTrip extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color warnaUtama = Color.fromARGB(255, 234, 105, 105);
    Color warnaBg = Color.fromARGB(255, 239, 238, 238);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: warnaUtama,
        backgroundColor: warnaBg,
        textTheme: TextTheme(
          headlineMedium: TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.bold,
          ),
          headlineSmall: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 15,
          ),
        ),
      ),
      home: MySplashScreen(),
    );
  }
}
