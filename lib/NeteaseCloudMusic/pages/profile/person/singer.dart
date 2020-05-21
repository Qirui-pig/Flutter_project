import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:pageview_test/LOL/pages/Profile.dart';
import 'package:pageview_test/NeteaseCloudMusic/model/artdetail.dart';
import 'package:pageview_test/NeteaseCloudMusic/model/artsongs.dart';

import 'package:pageview_test/NeteaseCloudMusic/widget/songlist.dart';

class SingerPage extends StatefulWidget {
  static String routeName = '/singer';

  final id;
  final String imgUrl;
  final String name;

  SingerPage({this.id, this.imgUrl, this.name});

  @override
  _SingerPageState createState() => _SingerPageState();
}

class _SingerPageState extends State<SingerPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  List<Widget> tabs = [
    Tab(
      text: '热门50',
    ),
    Tab(
      text: '歌手详情',
    )
  ];

  ArtDetail artDetail;
  ArtSongs artSongs;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: tabs.length);

    _fetchSingerDetail();
    _fetchSingerTop50();
  }

  _fetchSingerDetail() async {
    String url = 'http://10.0.2.2:3000/artist/desc?id=${widget.id}';

    var res = await http.get(url);
    var decodeJson = jsonDecode(res.body);

    artDetail = ArtDetail.fromJson(decodeJson);

    setState(() {});
  }

  _fetchSingerTop50() async {
    String url = 'http://10.0.2.2:3000/artist/top/song?id=${widget.id}';

    var res = await http.get(url);
    var decodeJson = jsonDecode(res.body);

    artSongs = ArtSongs.fromJson(decodeJson);

//    print(artSongs.songs[0].name);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 280.0,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text('${widget.name}'),
                background: Hero(
                    tag: widget.imgUrl,
                    child: Image.network(
                      '${widget.imgUrl}?param=300y280',
                      fit: BoxFit.cover,
                    )),
              ),
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: StickyTabBarDelegate(
                child: TabBar(
                  indicatorColor: Color.fromRGBO(236, 96, 80, 1),
                  labelColor: Colors.white,
                  controller: _tabController,
                  tabs: tabs,
                ),
              ),
            )
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            artSongs == null
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : buildSongs(artSongs: artSongs),
            artDetail == null
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : buildSingerDetail(artDetail: artDetail)
          ],
        ),
      ),
    );
  }
}

class buildSingerDetail extends StatelessWidget {
  const buildSingerDetail({
    Key key,
    @required this.artDetail,
  }) : super(key: key);

  final ArtDetail artDetail;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(0),
      children: artDetail.introduction.map((f) {
        return Container(
          margin: EdgeInsets.all(0),
          color: Color(0xFFF3F5F7),
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  f.ti,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 21,
                      color: Color.fromRGBO(236, 96, 80, 1)),
                ),
                Text(
                  f.txt,
                  style: TextStyle(fontSize: 16),
                )
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
