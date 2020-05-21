import 'package:flutter/material.dart';

import 'dart:convert';

import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:pageview_test/LOL/pages/Detail.dart';
import 'dart:math';

import '../models/hero.dart';

class HomeScreen extends StatelessWidget {
  static final String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('League of Legends'),
      ),
      body: HomeContent(),
    );
  }
}

class HomeContent extends StatefulWidget {
  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  final List swiper = [
    'assets/images/swiper/1.jpeg',
    'assets/images/swiper/2.jpeg',
    'assets/images/swiper/3.jpeg',
    'assets/images/swiper/4.jpeg'
  ];
  List<Lhero> lhero = [];

  final roles = {
    '战士': 'fighter',
    '魔法': 'mage',
    '刺客': 'assassin',
    '坦克': 'tank',
    '射手': 'marksman',
    '辅助': 'support'
  };

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  _fetchData() async {
    final url =
        'https://game.gtimg.cn/images/lol/act/img/js/heroList/hero_list.js';

    final res = await http.get(url);

    final decodeJson = jsonDecode(res.body);

    final heroList = decodeJson['hero'];

    for (var json in heroList) {
      lhero.add(Lhero.fromJson(json));
    }
//    print(hero[1].alias.toLowerCase());
    setState(() {});
  }

  _fetchBanner() async{

  }


  @override
  Widget build(BuildContext context) {
    return lhero.length == null
        ? Center(
      child: CircularProgressIndicator(),
    )
        : CustomScrollView(
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return Container(
              height: 180.0,
              child: Swiper(
              itemCount: swiper.length,
              itemBuilder: (ctx, index) {
                return Image.asset(
                  swiper[index],
                  fit: BoxFit.cover,
                );
              },
              pagination: SwiperPagination(),
              viewportFraction: 0.8,
              scale: 0.9,
            ),
            );
          }, childCount: 1),
        ),
        SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4),
          delegate: SliverChildBuilderDelegate((ctx, index) {
            return GestureDetector(
              onTap: () {
//                    print(index);
                var heroid = lhero[index].heroId;
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (ctx) => LDetailScreen(heroid:heroid)));
              },
              child: Container(
                key: ValueKey(lhero[index].heroId),
                margin: EdgeInsets.all(10.0),
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Color.fromRGBO(Random().nextInt(255),
                      Random().nextInt(255), Random().nextInt(255), 1),
//                      shape: BoxShape.circle
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Hero(
                        tag:lhero[index].heroId,
                        child: Image.asset(
                          'assets/images/hero/${lhero[index].alias.toLowerCase()}.jpg',
                          width: 40,
                          height: 40,
                        )),
                    Text(
                      '${lhero[index].name}',
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              ),
            );
          }, childCount: lhero.length),
        )
      ],
    );
  }
}