import 'package:flutter/material.dart';
import 'package:nanigo_flutter/res/colors.dart';
import 'package:nanigo_flutter/screen/home_screen.dart';
import 'package:nanigo_flutter/screen/splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeData base = ThemeData.light();
    return MaterialApp(
      title: 'Nanigo App',
      theme: ThemeData(
          primarySwatch: Colors.blue,
        fontFamily: 'BlackHanSans',
        textTheme: TextTheme(
          headline: TextStyle(fontSize: 38.0, color: kContentsTextColor),
          title: TextStyle(fontSize: 32.0, color: kContentsTextColor),
          body1: TextStyle(fontSize: 18.0, color: kContentsTextColor),
        ),
      ),
      home: SplashScreen(),
    );
  }
}