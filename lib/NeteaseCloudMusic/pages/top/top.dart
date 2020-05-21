import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pageview_test/NeteaseCloudMusic/model/toplist/toplist.dart';

final ateFrequencyValues = EnumValues({
  "每周四更新": AteFrequency.ATE_FREQUENCY,
  "每天更新": AteFrequency.EMPTY,
  "每周一更新": AteFrequency.FLUFFY,
  "每周五更新": AteFrequency.PURPLE,
  "每周三更新": AteFrequency.TENTACLED
});

class TopPage extends StatelessWidget {
  static final String routeName = '/top';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('排行榜'),
      ),
      body: TopContent(),
    );
  }
}

class TopContent extends StatefulWidget {
  @override
  _TopContentState createState() => _TopContentState();
}

class _TopContentState extends State<TopContent> {

  TopList _topList;


  @override
  void initState() {
    super.initState();

    _fetchTopList();
  }

  _fetchTopList() async{
    final String url = 'http://10.0.2.2:3000/toplist/detail';

    var res = await http.get(url);
    var decodeJson = jsonDecode(res.body);
    _topList = TopList.fromJson(decodeJson);

    setState(() {

    });
  }


  @override
  Widget build(BuildContext context) {
    return _topList == null ? Center(child: CircularProgressIndicator(),):CustomScrollView(
      slivers: <Widget>[
        buildTitle(title: '官方榜',),
        SliverList(
          delegate: SliverChildBuilderDelegate(
                  (ctx,index){
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 12),
                  child: Row(
                    children: <Widget>[
                      buildTopItem(topList: _topList,index:index),
                      Column(
                        children: _topList.list[index].tracks.asMap().entries.map((MapEntry map){
                          return Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Container(width: MediaQuery.of(context).size.width - 170,child: Text('${map.key+1} ${map.value.first} ${map.value.second}',overflow: TextOverflow.ellipsis,)),
                          );
                        }).toList(),
                        crossAxisAlignment: CrossAxisAlignment.start,
                      ),
                    ],
                  ),
                );
              },
              childCount: 4
          ),
        ),
        buildTitle(title: '更多榜单',),
        SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5
          ),
          delegate: SliverChildBuilderDelegate(
              (ctx,index){
                return Container(
                  child: Column(
                    children: <Widget>[
                      buildTopItem(topList: _topList,index:index+4),
                      Text('${_topList.list[index+4].name}',overflow: TextOverflow.ellipsis,)
                    ],
                  ),
                );
              },childCount: 15
          ),
        )
      ],
    );
  }
}

class buildTopItem extends StatelessWidget {
  final index;

  const buildTopItem({
    this.index,
    Key key,
    @required TopList topList,
  }) : _topList = topList, super(key: key);

  final TopList _topList;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipRRect(
          child: CachedNetworkImage(
            imageUrl: _topList.list[index].coverImgUrl+'?param=100y100',
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          borderRadius: BorderRadius.circular(5.0),
        ),
        Positioned(
          left: 5,
          bottom: 5,
          child: Text('${ateFrequencyValues.map.keys.first}',
          style: TextStyle(color: Colors.white),),
        )
      ],
    );
  }
}

class buildTitle extends StatelessWidget {
  final String title;


  const buildTitle({
    Key key,
    this.title
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
              (ctx,index){
            return Container(
              margin: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
              child: Text(title,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
            );
          },childCount: 1
      ),
    );
  }
}
