import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../model/playlisttype.dart';
import '../../widget/playlist_item.dart';


class PlayListPage extends StatefulWidget {
  static final String routeName = '/playlist';

  @override
  _PlayListPageState createState() => _PlayListPageState();
}

class _PlayListPageState extends State<PlayListPage>
    with SingleTickerProviderStateMixin {
  List<Widget> tabs = [
    Tab(
      child: Text('全部'),
    ),
    Tab(
      child: Text('华语'),
    ),
    Tab(
      child: Text('古风'),
    ),
    Tab(
      child: Text('欧洲'),
    ),
    Tab(
      child: Text('流行'),
    )
  ];

  TabController _tabController;
  PlayList1 allPlayList;
  PlayList1 playList01;
  PlayList1 playList02;
  PlayList1 playList03;
  PlayList1 playList04;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);

//    print(allPlayList);
//    print(playList01);
//    print(playList02);
    _getPlayList();
  }

  _fetchPlayList(String type) async {
    String baseUrl = 'http://10.0.2.2:3000/top/playlist?limit=30&cat=${type}';
    var res = await http.get(baseUrl);
    var decodeJson = jsonDecode(res.body);
    PlayList1 playListItem;
    playListItem = PlayList1.fromJson(decodeJson);
    return playListItem;
  }

  _getPlayList() async {
    allPlayList = await _fetchPlayList('');
    playList01 = await _fetchPlayList('华语');
    playList02 = await _fetchPlayList('古风');
    playList03 = await _fetchPlayList('欧美');
    playList04 = await _fetchPlayList('流行');
//    print(allPlayList.playlists[0].name);
//    print(playList01.playlists[0].name);
//    print(playList02.playlists[0].name);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('歌单广场'),
        bottom: TabBar(
          controller: _tabController,
          tabs: tabs,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          allPlayList == null
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : buildPlayList(allPlayList: allPlayList),
          playList01 == null
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : buildPlayList(allPlayList: playList01),
          playList02 == null
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : buildPlayList(allPlayList: playList02),
          playList03 == null
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : buildPlayList(allPlayList: playList03),
          playList04 == null
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : buildPlayList(allPlayList: playList04)
        ],
      ),
    );
  }
}

class buildPlayList extends StatelessWidget {
  const buildPlayList({
    Key key,
    @required this.allPlayList,
  }) : super(key: key);

  final PlayList1 allPlayList;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: allPlayList.playlists.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 4.0,
                crossAxisSpacing: 4.0,
                childAspectRatio: 0.65),
            itemBuilder: (ctx, index) {
              return JumpToDetail(
                item: allPlayList.playlists[index],
                dWidth: 120,
              );
            })
      ],
    );
  }
}
