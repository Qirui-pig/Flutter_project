
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:HomePage(),
    );
  }
}

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('first project'),
        ),
        body: HomeContent()
    );
  }
}

class HomeContent extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return ContentBodyState();
  }
}

class ContentBodyState extends State<HomeContent>{
  var flag = true;

  @override
  Widget build(BuildContext context) {

    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Checkbox(value: flag,
            onChanged: (value){
              this.setState((){
                flag = value;
              });
            },),
          Text('I’m Checkbox',style: TextStyle(fontSize: 30,color:Colors.pink),)
        ],
      ),
    );
  }
}

//class HomeContent extends StatelessWidget{
//  @override
//  Widget build(BuildContext context) {
//    return Center(
//      child: Row(
//        mainAxisAlignment: MainAxisAlignment.center,
//        children: <Widget>[
//          Checkbox(
//            value: true,
//            onChanged: (value)=>print(value),
//          ),
//          Text('嘻嘻我是一个chekbox',style: TextStyle(fontSize: 30,color: Colors.orange),)
//        ],
//      ),
//    );
//  }
//}