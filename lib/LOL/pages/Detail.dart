import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:http/http.dart' as http;
import '../models/hero_item.dart';

class LDetailScreen extends StatefulWidget {

  static final String routeName = '/detail';
  final String heroid;

  LDetailScreen({this.heroid});

  @override
  _LDetailScreenState createState() => _LDetailScreenState();
}

class _LDetailScreenState extends State<LDetailScreen> {
  HeroItem heroitem;
  List loadImg;
  List isShow = [false,false,false,false,false];

  @override
  void initState() {
    super.initState();
    _fetchDetail();
  }

  _fetchDetail() async {
    final baseUrl =
        'http://game.gtimg.cn/images/lol/act/img/js/hero/${widget.heroid}.js';

    final res = await http.get(baseUrl);

    final decodeJson = jsonDecode(res.body);

    heroitem = HeroItem.fromJson(decodeJson);

//    print(heroitem.heros.title);
//    print(heroitem.heros.alias);
//    final skinlodingImg = heroitem.
    loadImg = heroitem.skins.where((item) {
      return item.loadingImg != '';
    }).toList();
//    print(loadImg[1].loadingImg);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(title: Text('Detail'),),
      body: heroitem == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SafeArea(
              child: ListView(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          Image.network(
                            heroitem.skins[0].mainImg,
                            fit: BoxFit.cover,
                          ),
                          Positioned(
                            left: 5.0,
                            top: 5.0,
                            child: IconButton(
                              icon: Icon(
                                Icons.arrow_back,
                                size: 25.0,
                              ),
                              color: Colors.white,
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ),
                          Positioned(
                            right: 20.0,
                            bottom: 20.0,
                            child: Column(
                              children: <Widget>[
                                Text(
                                  '${heroitem.heros.camp}',
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                ),
                                Text(
                                  '${heroitem.heros.alias}',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 20.0,),
                      Stack(children: <Widget>[
                        buildInfo(heroitem: heroitem),
                        Positioned(
                          top: 0,
                          left: 20,
                          child: Hero(
                            tag: widget.heroid,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30.0),
                                child: Image.asset('assets/images/hero/${heroitem.heros.alias.toLowerCase()}.jpg')),
                          ),
                        )

                      ],),
                      buildSkin(heroitem: heroitem),
                      showSkin(loadImg: loadImg),
                      Divider(
                        color: Colors.grey,
                        thickness: 1.5,
                      ),
                      SizedBox(height: 10.0,),
                      Text('技能介绍',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.deepPurple),),
                      Container(
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: heroitem.spells.length,
                            itemBuilder: (ctx, index) {
                              var spells = heroitem.spells[index];
                              return Container(
                                key: ValueKey(spells.name),
                                child: Column(
                                  children: <Widget>[
                                    GestureDetector(
                                      onTap: (){
                                        setState(() {
                                          isShow[index] = !isShow[index];
                                        });
                                      },
                                      child: Container(
                                        padding:EdgeInsets.all(12.0),
                                        child: Row(
                                          children: <Widget>[
                                            ClipRRect(
                                              child: Image.network(
                                                '${spells.abilityIconPath}',
                                                width: 60,
                                                height: 60,
                                              ),
                                              borderRadius: BorderRadius.circular(30.0),
                                            ),
                                            SizedBox(width: 7.0,),
                                            Text(
                                              '${spells.name}',
                                              style: TextStyle(
                                                  fontSize: 25,
                                                  color: Colors.cyan,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.grey[300],
                                        ),
                                        margin: EdgeInsets.all(10.0)
                                      ),
                                    ),
                                    isShow[index]?ListTile(
                                      title: Text('${spells.description}\n${spells.dynamicDescription}',),
                                      contentPadding:EdgeInsets.symmetric(horizontal: 30.0),
                                    ):SizedBox()

                                  ],
                                ),
                              );
                            }),
                      )
                    ],
                  ),
                ],
              ),
            ),
    );
  }
}

class showSkin extends StatelessWidget {
  const showSkin({
    Key key,
    @required this.loadImg,
  }) : super(key: key);

  final List loadImg;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400.0,
      child: Swiper(
        itemCount: loadImg.length,
        itemBuilder: (ctx, index) {
          return ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.network(
                loadImg[index].loadingImg,
                fit: BoxFit.fitWidth,
              ));
        },
        pagination: SwiperPagination(),
        viewportFraction: 0.6,
        scale: 0.9,
      ),
    );
  }
}

class buildSkin extends StatelessWidget {
  const buildSkin({
    Key key,
    @required this.heroitem,
  }) : super(key: key);

  final HeroItem heroitem;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          '皮肤预览',
          style: TextStyle(
              fontSize: 30,
              color: Colors.green,
              fontWeight: FontWeight.bold),
        ),
        Container(
          height: 280.0,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: heroitem.skins.length,
              itemBuilder: (ctx, index) {
                Skin skin = heroitem.skins[index];
                return skin.mainImg == ''
                    ? null
                    : SkinItem(skin: skin);
              }),
        ),
      ],
    );
  }
}

class buildInfo extends StatelessWidget {
  const buildInfo({
    Key key,
    @required this.heroitem,
  }) : super(key: key);

  final HeroItem heroitem;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 5,
        ),
        Text(
          '背景故事',
          style: TextStyle(
              fontSize: 30,
              color: Colors.pink,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(height:20.0),
        Card(
          margin: EdgeInsets.all(10.0),
          color: Colors.cyanAccent,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0)),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              '${heroitem.heros.shortBio}',
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.w300),
            ),
          ),
        )
      ],
    );
  }
}

class SkinItem extends StatelessWidget {
  const SkinItem({
    Key key,
    @required this.skin,
  }) : super(key: key);

  final Skin skin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280.0,
      decoration: BoxDecoration(
          color: Colors.amberAccent, borderRadius: BorderRadius.circular(20.0)),
      margin: EdgeInsets.all(10.0),
      child: Stack(
        children: <Widget>[
          Positioned(
            bottom: 20.0,
            left: 30.0,
            child: Container(
              height: 90.0,
              width: 200.0,
              decoration: BoxDecoration(
                  color: Colors.lightBlue,
                  borderRadius: BorderRadius.circular(10.0)),
              child: Center(
                  child: Text(
                skin.name,
                style: TextStyle(
                    color: Colors.redAccent,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              )),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0.0, 2.0),
                      blurRadius: 6.0)
                ]),
            child: Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.network(
                    '${skin.mainImg}',
                    width: 280.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
