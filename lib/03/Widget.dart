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
      appBar: AppBar(title: Text('Widget demo'),),
      body: HomeContent(),
    );
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AvatarDemo2();
  }
}






//TextDemo01
class TextDemo extends StatelessWidget {
  const TextDemo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('《定风波》 苏轼 \n莫听穿林打叶声，何妨吟啸且徐行。竹杖芒鞋轻胜马，谁怕？一蓑烟雨任平生。',
      style: TextStyle(fontSize: 20,color: Colors.redAccent),
      textAlign: TextAlign.center,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,);
  }
}
//TextDemo02
class TextDemo02 extends StatelessWidget {
  const TextDemo02({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(children: [
        TextSpan(text: '《定风波》\n', style: TextStyle(fontSize: 30,fontWeight:FontWeight.bold,color: Colors.blue)),
        TextSpan(text: '苏轼\n', style: TextStyle(fontSize: 25,fontWeight:FontWeight.w300,color: Colors.deepOrange)),
        TextSpan(text: '莫听穿林打叶声，何妨吟啸且徐行。\n竹杖芒鞋轻胜马，谁怕？一蓑烟雨任平生。', style: TextStyle(fontSize: 20,fontWeight:FontWeight.w300,color: Colors.green))
      ]),
      textAlign:TextAlign.center,
      style: TextStyle(fontSize: 20),
    );
  }
}


//ButtonDemo
class ButtonDemo extends StatelessWidget {
  const ButtonDemo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FloatingActionButton(
          child: Text('Circle'),
          onPressed: ()=>print('im a FloatingActionButton'),
          hoverColor:Colors.amber,
        ),
        RaisedButton(
          child: Text('RaisedButton', style: TextStyle(fontSize: 20,color: Colors.pink),),
          onPressed: ()=>print('im RaisedButton'),
          color: Colors.yellow,
        ),
        FlatButton(
          child: Text('FlatButton',style: TextStyle(fontSize: 20,color:Colors.amber),),
          onPressed: ()=>print('FlatButton'),
          color: Colors.green,
        ),
        OutlineButton(
          child: Text('OutlineButton',style: TextStyle(fontSize: 20,color:Colors.amber),),
          onPressed: ()=>print('OutlineButton'),
          focusColor: Colors.green,
        )
      ],
    );
  }
}


//ImageDemo
class ImageDemo extends StatelessWidget {
  const ImageDemo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Image.asset('assets/images/1.jpg'),
//        child: Image.network('http://www.haiwainet.cn/HLMediaFile/20140819/88/6874717304207895772.jpg',),
        width: 200,
        height: 200,
        color: Colors.green,
      ),
    );
  }
}
//AvatarDemo01
class AvatarDemo01 extends StatelessWidget {
  const AvatarDemo01({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircleAvatar(
        radius: 150,
        backgroundImage: NetworkImage('http://pic1.win4000.com/wallpaper/2018-01-30/5a7018031beb6.jpg'),
        child:Container(
          width: 200,
          height: 200,
          child: Text('Qirui likes',style: TextStyle(fontSize: 20,color: Colors.pink),),
        ),
      ),
    );
  }
}
//AvatarDemo2
class AvatarDemo2 extends StatelessWidget {
  const AvatarDemo2({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Image.network('http://pic29.nipic.com/20130601/8716187_234705669000_2.png',
          width: 200,height: 200,
          fit: BoxFit.fill,),
      ),
    );
  }
}