import 'package:flutter/material.dart';
import 'package:pageview_test/food/ui/pages/main/main.dart';

class Router {
  static final initialRoute = MainScreen.routeName;

  static Map<String,WidgetBuilder> routes = {
    MainScreen.routeName: (ctx)=> MainScreen()
  };

  static final RouteFactory generateRoute = (settings){
    return null;
  };

  static final RouteFactory unknownRoute = (settings){
    return null;
  };

}