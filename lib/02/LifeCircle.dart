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
      appBar:AppBar(
        title: Text('Life Circle'),
      ),
      body: HomeContent(),
    );
  }
}

class HomeContent extends StatefulWidget {
  HomeContent(){
    print('HomePage--constructor');
  }

  @override
  _HomeContentState createState() {
    print('HomePage--createState');
    return _HomeContentState();
  }
}

class _HomeContentState extends State<HomeContent> {

  _HomeContentState(){
    print('_HomeContentState--constructor');
  }

  @override
  void initState() {
    print('_HomeContentState--InitState');
    super.initState();
  }
  @override
  void didChangeDependencies() {
    print('_HomeContentState--didChangeDependencies');
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    print('_HomeContentState--build');
    return Text('begin');
  }
}
