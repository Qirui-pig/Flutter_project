import 'package:flutter/material.dart';

main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Count Test'),
      ),
      body:HomeContent('Who am I'),
    );
  }
}

class HomeContent extends StatefulWidget {
  final String msg;

  HomeContent(this.msg);

  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  var count = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _Button(),
        Text('Current Count is ${count}',style: TextStyle(fontSize: 25,color: Colors.pink),),
        Text('This is Msg: ${widget.msg}',style: TextStyle(fontSize: 20,color: Colors.redAccent),)
      ],
    );
  }

  Widget _Button(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        FlatButton(
          child: Text('+',style: TextStyle(fontSize: 25,color: Colors.blue),),
          onPressed: (){
            this.setState((){
              count++;
            });
          },
          color: Colors.yellow,
        ),
        FlatButton(
          child: Text('-',style: TextStyle(fontSize: 25,color: Colors.pink),),
          onPressed: (){
            this.setState((){
              count--;
            });
          },
          color: Colors.green,
        )
      ],
    );
  }
}
