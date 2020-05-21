import 'package:flutter/material.dart';

class AppTheme{
  static const double bodyFontSize = 14;
  static const double smallFontSize = 16;
  static const double normalFontSize = 20;
  static const double largeFontSize = 14;

  static final Color norTextColors = Colors.red;

  static final ThemeData norTheme = ThemeData(
    primarySwatch: Colors.cyan,
    canvasColor: Color.fromRGBO(255, 254, 222, 1),
    textTheme: TextTheme(
      body1: TextStyle(fontSize: bodyFontSize),
      display1: TextStyle(fontSize: bodyFontSize),
      display2: TextStyle(fontSize: normalFontSize),
      display3: TextStyle(fontSize: largeFontSize),

    )


  );


}