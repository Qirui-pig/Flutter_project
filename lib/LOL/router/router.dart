import 'package:flutter/cupertino.dart';
import 'package:pageview_test/LOL/pages/Home.dart';
import 'package:pageview_test/LOL/pages/Detail.dart';
import 'package:pageview_test/LOL/pages/main/main.dart';

class Router {
  static final String initialRoute = MainScreen.routeName;

  static final Map<String,WidgetBuilder> routes = {
    MainScreen.routeName:(ctx)=>MainScreen(),
    HomeScreen.routeName: (ctx)=>HomeScreen(),
    LDetailScreen.routeName: (ctx)=>LDetailScreen(),
  };

  static final RouteFactory generateRoute = (settings) {
    return null;
  };

  static final RouteFactory unknownRoute = (settings) {
    return null;
  };
}