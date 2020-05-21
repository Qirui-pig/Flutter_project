import 'package:flutter/material.dart';
import 'package:pageview_test/LOL/router/router.dart';
import 'package:pageview_test/LOL/pages/main/main.dart';


main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: Router.routes,
      initialRoute: Router.initialRoute,
      theme: ThemeData(
        primaryColor: Color(0xFF3EBACE),
        accentColor: Color(0xFFD8ECF1),
        scaffoldBackgroundColor: Color(0xFFF3F5F7),
      ),
    );
  }
}



//GridView.builder(
//itemCount: 300,
//gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//crossAxisCount: 4
//),
//itemBuilder: (ctx,index){
//return Container(
//margin: EdgeInsets.all(10.0),
//padding: EdgeInsets.all(10.0),
//width: 60,
//height: 60,
//color: Colors.blue,
//);
//}
//),
