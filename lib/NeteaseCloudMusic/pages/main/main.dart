import 'package:flutter/material.dart';
import 'package:pageview_test/NeteaseCloudMusic/pages/home.dart';
import 'package:pageview_test/NeteaseCloudMusic/pages/profile/profile.dart';
import 'package:pageview_test/NeteaseCloudMusic/pages/video/video.dart';
import 'package:pageview_test/NeteaseCloudMusic/pages/yun/yun.dart';

class MainPage extends StatefulWidget {
  static final String routeName = '/';

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: <Widget>[
          HomeScreen(),
          ProfilePage(),
          VideoPage(),
          YunPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              activeIcon: Image.asset(
                'assets/images/Netease/bottom/shouye.png',
                width: 34,
                color: Colors.red,
              ),
              icon: Image.asset(
                'assets/images/Netease/bottom/shouye.png',
                width: 34,
              ),
              title: Text('首页')),
          BottomNavigationBarItem(
              activeIcon: Image.asset(
                'assets/images/Netease/bottom/person.png',
                width: 34,
                color: Colors.red,
              ),
              icon: Image.asset(
                'assets/images/Netease/bottom/person.png',
                width: 34,
              ),
              title: Text('歌手')),
          BottomNavigationBarItem(
              activeIcon: Image.asset(
                'assets/images/Netease/bottom/shipin.png',
                width: 34,
                color: Colors.red,
              ),
              icon: Image.asset(
                'assets/images/Netease/bottom/shipin.png',
                width: 34,
              ),
              title: Text('视频')),
          BottomNavigationBarItem(
              activeIcon: Image.asset(
                'assets/images/Netease/bottom/icon-.png',
                width: 34,
                color: Colors.red,
              ),
              icon: Image.asset(
                'assets/images/Netease/bottom/icon-.png',
                width: 34,
              ),
              title: Text('云村'))
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
