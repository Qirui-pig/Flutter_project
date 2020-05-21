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
        title: Text('HomePage'),
      ),
      body: HomeContent(),
    );
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children:<Widget>[
        HomeProductItem('APPLE','Macbook1','https://tva1.sinaimg.cn/large/006y8mN6gy1g72j6nk1d4j30u00k0n0j.jpg'),
        HomeProductItem('APPLE','Macbook2','https://tva1.sinaimg.cn/large/006y8mN6gy1g72imm9u5zj30u00k0adf.jpg'),
        HomeProductItem('APPLE','Macbook3','https://tva1.sinaimg.cn/large/006y8mN6gy1g72imqlouhj30u00k00v0.jpg')
      ],
    );
  }
}


class HomeProductItem extends StatelessWidget {
  final String title;
  final String desc;
  final String imageURL;

  HomeProductItem(this.title,this.desc,this.imageURL);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(
          width: 8,
          color: Colors.pink
      )),
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(title,style: TextStyle(fontSize: 24,color: Colors.blue),),
          SizedBox(height: 8,),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(desc,style: TextStyle(fontSize: 20,color: Colors.red),),
            ],
          ),
          SizedBox(height: 5,),
          Image.network(imageURL),
        ],
      ),
    );
  }
}
