import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pageview_test/Douban/widgets/hotel_carousel.dart';
import '../widgets/destination_carousel.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<IconData> _icons = [
    FontAwesomeIcons.plane,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.walking,
    FontAwesomeIcons.biking
  ];

  int _selectedIndex = 0;
  int _currentTab = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home'),centerTitle: true,),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 20.0,right: 120.0),
              child: Text('What you would like to find',style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold),),
            ),
            SizedBox(height: 20.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: _icons.asMap().entries.map((MapEntry map)=>buildIcons(map.key)).toList(),
            ),
            SizedBox(height: 20.0,),
            DestinationCarousel(),
            HotelCarousel()
          ],
        ),
      ),
    );
  }
  
  Widget buildIcons(int index){
    return GestureDetector(
      onTap: (){
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        width: 60.0,
        height: 60.0,
        decoration: BoxDecoration(
          color: _selectedIndex == index ? Theme.of(context).accentColor:Color(0xFFE7EBEE),
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Icon(_icons[index],size: 25.0,color: _selectedIndex == index ? Theme.of(context).primaryColor:Color(0xFFB4C1C4)),
      ),
    );
  }
}

