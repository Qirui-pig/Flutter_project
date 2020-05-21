import 'package:flutter/material.dart';
import 'package:pageview_test/NeteaseCloudMusic/provider/play.dart';
import 'package:pageview_test/NeteaseCloudMusic/provider/song.dart';
import 'router/router.dart';
import 'package:provider/provider.dart';

main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_)=>PlayProvider(),),
      ChangeNotifierProvider(create: (_)=>SongProvide(),),

    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: Router.routes,
      initialRoute: Router.initialRoute,
      theme: ThemeData(
        primaryColor: Color.fromRGBO(236, 96, 80, 1),
        accentColor: Color(0xFFD8ECF1),
        scaffoldBackgroundColor: Color(0xFFF3F5F7),
      ),
    );
  }
}
