import 'package:flutter/material.dart';
import 'package:pageview_test/food/ui/pages/favor/favor.dart';
import 'package:pageview_test/food/ui/pages/home/home.dart';

class MainScreen extends StatefulWidget {
  static const routeName = '/';

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
          FavorScreen()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        items: [
          BottomNavigationBarItem(
            title: Text('Home'),
            icon: Icon(Icons.home)
          ),
          BottomNavigationBarItem(
              title: Text('Favor'),
              icon: Icon(Icons.favorite)
          ),
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
