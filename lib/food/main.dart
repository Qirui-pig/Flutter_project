import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pageview_test/food/ui/shared/app_theme.dart';

import 'package:pageview_test/food/core/router/router.dart';

main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food',
      theme: AppTheme.norTheme,
      routes: Router.routes,
      initialRoute: Router.initialRoute,
      onGenerateRoute: Router.generateRoute,
      onUnknownRoute: Router.unknownRoute,
    );
  }
}
