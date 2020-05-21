
import 'package:flutter/cupertino.dart';
import 'package:pageview_test/NeteaseCloudMusic/pages/main/main.dart';
import 'package:pageview_test/NeteaseCloudMusic/pages/playlist/playlist_page.dart';
import 'package:pageview_test/NeteaseCloudMusic/pages/profile/person/singer.dart';
import 'package:pageview_test/NeteaseCloudMusic/pages/profile/profile.dart';
import 'package:pageview_test/NeteaseCloudMusic/pages/top/top.dart';
import 'package:pageview_test/NeteaseCloudMusic/pages/video/video.dart';
import 'package:pageview_test/NeteaseCloudMusic/pages/video/video_detail.dart';
import 'package:pageview_test/NeteaseCloudMusic/pages/yun/yun.dart';

class Router {
  static final String initialRoute = MainPage.routeName;

  static final Map<String,WidgetBuilder> routes = {
    MainPage.routeName:(ctx)=>MainPage(),
    VideoPage.routeName: (ctx)=>VideoPage(),
    TopPage.routeName:(ctx)=>TopPage(),
    ProfilePage.routeName:(ctx)=>ProfilePage(),
    YunPage.routeName:(ctx)=>YunPage(),
    SingerPage.routeName: (ctx)=>SingerPage(),
    PlayListPage.routeName:(ctx)=>PlayListPage(),
    VideoDetail.routeName:(ctx)=>VideoDetail(),
  };

  static final RouteFactory generateRoute = (settings) {
    return null;
  };

  static final RouteFactory unknownRoute = (settings) {
    return null;
  };

}