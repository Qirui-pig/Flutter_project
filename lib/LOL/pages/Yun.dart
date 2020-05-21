import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:pageview_test/LOL/models/Yun/equip.dart';
import 'package:pageview_test/LOL/models/Yun/job.dart';
import 'package:pageview_test/LOL/models/Yun/race.dart';
import 'package:pageview_test/LOL/models/Yun/yhero.dart';

class YunScreen extends StatefulWidget {
  @override
  _YunScreenState createState() => _YunScreenState();
}

class _YunScreenState extends State<YunScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  List tabs = <Widget>[
    Tab(
        child: Container(
            width: 90,
            alignment: Alignment.center,
            child: Text(
              '英雄',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
            ))),
    Tab(
      child: Container(
          width: 90,
          alignment: Alignment.center,
          child: Text(
            '装备',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
          )),
    )
  ];

  YHero yunHero;
  YRace yunRace;
  YJob yunJob;
  YEquip yunEquip;

  List yunEquip1;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);

    _fetchYHero();
    _fetchYJob();
    _fetchYRace();
    _fetchYEquip();
  }

  _fetchYHero() async {
    final url = 'https://game.gtimg.cn/images/lol/act/img/tft/js/chess.js';
    final res = await http.get(url);

    final decodeJson = jsonDecode(res.body);

    yunHero = YHero.fromJson(decodeJson);

//    print(yunHero.data[1].name);
    setState(() {});
  }

  _fetchYJob() async {
    final url = 'https://game.gtimg.cn/images/lol/act/img/tft/js/job.js';
    final res = await http.get(url);

    final decodeJson = jsonDecode(res.body);

    yunJob = YJob.fromJson(decodeJson);

//    print(yunJob.data[1].name);
    setState(() {});
  }

  _fetchYRace() async {
    final url = 'https://game.gtimg.cn/images/lol/act/img/tft/js/race.js';
    final res = await http.get(url);

    final decodeJson = jsonDecode(res.body);

    yunRace = YRace.fromJson(decodeJson);

//    print(yunRace.data[1].name);

    setState(() {});
  }

  _fetchYEquip() async {
    final url = 'https://game.gtimg.cn/images/lol/act/img/tft/js/equip.js';
    final res = await http.get(url);

    final decodeJson = jsonDecode(res.body);

    yunEquip = YEquip.fromJson(decodeJson);

//    过滤
    yunEquip1 = yunEquip.data.where((s){
      var i = int.parse(s.type);
      return  i == 1;
    }).toList();
//    print(yunEquip1.length);


    yunEquip.data = yunEquip.data.where((n){
      var s = int.parse(n.type);
      return s == 2;
    }).toList();

//    print(yunEquip.data.length);


    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '云顶之弈',
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.w500, color: Colors.white),
        ),
        bottom: TabBar(
          controller: _tabController,
          tabs: tabs,
          indicatorColor: Colors.amberAccent,
          indicatorSize: TabBarIndicatorSize.label,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          yunHero == null
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : YunHeroPage(yunHero: yunHero, yunRace: yunRace, yunJob: yunJob, yunEquip: yunEquip),
          yunEquip == null ? Center(
            child: CircularProgressIndicator(),
          ):YunEquipPage(yunEquip: yunEquip, yunEquip1: yunEquip1)
        ],
      ),
    );
  }
}

class YunEquipPage extends StatelessWidget {
  const YunEquipPage({
    Key key,
    @required this.yunEquip,
    @required this.yunEquip1,
  }) : super(key: key);

  final YEquip yunEquip;
  final List yunEquip1;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(vertical: 10.0),
          width: MediaQuery.of(context).size.width,
          height: 40.0,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text('配方'),
              Text('合成')
            ],
          ),
        ),
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: yunEquip.data.length,
          itemBuilder: (ctx,index){
            var item = yunEquip.data[index];

//                  配方图片过滤
            List formulas = item.formula.split(',');
//                  print(formulas);
            List e1Img = [];
            yunEquip1.map((j){
              if(j.equipId == formulas[0] && j.equipId == formulas[1]){
                e1Img.add(j.imagePath);
                e1Img.add(j.imagePath);
              }else if(j.equipId == formulas[0] || j.equipId == formulas[1]){
                e1Img.add(j.imagePath);
              }
            }).toList();
//                  print(e1Img);


            return Container(
              width: MediaQuery.of(context).size.width,
              height: 100.0,
              color: Colors.white,
              margin: EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                children: <Widget>[
                  Row(
                    children: e1Img.map((f){
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6.0),
                        child: Image.network(f,width: 50,),
                      );
                    }).toList(),
                  ),
                  SizedBox(width: 30.0,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image.network(item.imagePath,width: 50,),
                      SizedBox(width: 7.0,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(item.name,style: TextStyle(fontWeight: FontWeight.w400,fontSize: 20),),
                          Container(width:180,child: Text(item.effect,style: TextStyle(color: Colors.grey,fontSize: 15),overflow: TextOverflow.ellipsis,maxLines: 2,))
                        ],
                      )
                    ],
                  )
                ],
              ),
            );
          })
      ],
    );
  }
}

class YunHeroPage extends StatelessWidget {
  const YunHeroPage({
    Key key,
    @required this.yunHero,
    @required this.yunRace,
    @required this.yunJob,
    @required this.yunEquip,
  }) : super(key: key);

  final YHero yunHero;
  final YRace yunRace;
  final YJob yunJob;
  final YEquip yunEquip;

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: <Widget>[
          ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: yunHero.data.length,
              itemBuilder: (ctx, index) {
                var item = yunHero.data[index];

//                        找到对应的体系的图片
                List raceImg = yunRace.data.where((n) {
                  return n.name == item.races;
                }).toList();

//                        过滤job job可能有多个
                List jobs = item.jobs.split(',');

                List jobImg = yunJob.data.where((n) {
                  var length = jobs.length;
                  if (length == 1) {
                    return n.name == jobs[0];
                  } else {
                    return n.name == jobs[0] || n.name == jobs[1];
                  }
                }).toList();
//                          print(jobImg);

//                          过滤recEquip 去查找装备
                List equip = item.recEquip.split(',');
                List fEquip = equip.where((n) {
                  int s = int.parse(n);
                  return s < 1000;
                }).toList();
//                          print(fEquip.length);

//                          装备图
//                          print(yunEquip.data);
                List equipment = yunEquip.data.where((n) {
                  return n.equipId == fEquip[0] ||
                      n.equipId == fEquip[1] ||
                      n.equipId == fEquip[2];
                }).toList();
//                          print(equipment.length);

                return Container(
                  margin: EdgeInsets.all(10.0),
                  height: 170,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(31, 37, 51, 1),
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              ClipRRect(
                                  borderRadius:
                                      BorderRadius.circular(10.0),
                                  child: Image.network(
                                    'https://game.gtimg.cn/images/lol/act/img/tft/champions/${item.name}',
                                    width: 70,
                                    fit: BoxFit.cover,
                                  )),
                              Text(
                                item.displayName,
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.start,
                                  children: <Widget>[
                                    Image.network(
                                      '${raceImg[0].imagePath}',
                                      width: 27,
                                      fit: BoxFit.cover,
                                      color: Color.fromRGBO(
                                          222, 183, 98, 1),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      item.races,
                                      style: TextStyle(
                                          color: Colors.white),
                                    )
                                  ],
                                ),
                                Column(
                                  children: jobImg.map((n) {
                                    return Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Image.network(
                                          '${n.imagePath}',
                                          width: 27,
                                          fit: BoxFit.cover,
                                          color: Color.fromRGBO(
                                              222, 183, 98, 1),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          n.name,
                                          style: TextStyle(
                                              color: Colors.white),
                                        )
                                      ],
                                    );
                                  }).toList(),
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: 70.0,
                            child: Column(
                              children: <Widget>[
                                Icon(
                                  FontAwesomeIcons.coins,
                                  color:
                                      Color.fromRGBO(222, 183, 98, 1),
                                ),
                                Text(
                                  '${item.price}金币',
                                  style:
                                      TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      Divider(
                        color: Color.fromRGBO(56, 67, 75, 1),
                        thickness: 1.5,
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: 20.0,
                          ),
                          Container(
                              width: 40.0,
                              child: Text(
                                '推荐装备',
                                style: TextStyle(
                                    color: Color.fromRGBO(
                                        222, 183, 98, 1),
                                    fontSize: 18),
                                maxLines: 2,
                              )),
                          Row(
                            children: equipment.map((f) {
                              return Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: Image.network(
                                    '${f.imagePath}',
                                    width: 50,
                                  )
                              );
                            }).toList(),
                          )
                        ],
                      )
                    ],
                  ),
                );
              })
        ],
      );
  }
}
