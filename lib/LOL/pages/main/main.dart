import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pageview_test/LOL/pages/Home.dart';
import 'package:pageview_test/LOL/pages/Profile.dart';
import 'package:pageview_test/LOL/pages/Yun.dart';

class MainScreen extends StatefulWidget {
  static final String routeName = '/';

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: <Widget>[
          HomeScreen(),
          YunScreen(),
          ProfileScreen()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon:Icon(FontAwesomeIcons.home),
            title: Text('首页')
          ),
          BottomNavigationBarItem(
              icon:Icon(FontAwesomeIcons.magic),
              title: Text('云顶')
          ),
          BottomNavigationBarItem(
              icon:Icon(FontAwesomeIcons.personBooth),
              title: Text('我的')
          )
        ],
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
