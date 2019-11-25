import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:nanigo_flutter/screen/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nanigo App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
    );
  }
}

/*
final ThemeData _kShrineTheme = _buildShrineTheme();

ThemeData _buildShrineTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(accentColor: kShrineBrown900,
  primaryColor: kShrinePink100,
  buttonTheme: base.buttonTheme.copyWith(
  buttonColor: kShrinePink100, textTheme: ButtonTextTheme.normal,),
  scaffoldBackgroundColor: kShrineBackgroundWhite,
  cardColor: kShrineBackgroundWhite,
  textSelectionColor: kShrinePink100,
  errorColor: kShrineErrorRed,
  textTheme: _buildShrineTextTheme(base.textTheme),
  primaryTextTheme: _buildShrineTextTheme(base.primaryTextTheme),
  accentTextTheme: _buildShrineTextTheme(base.accentTextTheme),
  primaryIconTheme: base.iconTheme.copyWith(
  color
  :
  kShrineBrown900
  )
  ,
  // TODO: Decorate the inputs (103) );
}


TextTheme _buildShrineTextTheme(TextTheme base) {
  return base
      .copyWith(
    headline: base.headline.copyWith(
      fontWeight: FontWeight.w500,
    ),
    title: base.title.copyWith(fontSize: 18.0),
    caption: base.caption.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 14.0,
    ),
  )
      .apply(
    fontFamily: 'Rubik',
    displayColor: kShrineBrown900,
    bodyColor: kShrineBrown900,
  );
}
*/
