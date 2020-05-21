import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pageview_test/NeteaseCloudMusic/pages/profile/person/singer.dart';
import '../../model/artist.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ProfilePage extends StatefulWidget {
  static final String routeName = '/profile';

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  List<Widget> tabs = [
    Tab(
      child: Text('华语'),
    ),
    Tab(
      child: Text('欧美'),
    ),
    Tab(
      child: Text('日本'),
    ),
    Tab(
      child: Text('韩国'),
    ),
    Tab(
      child: Text('其他'),
    )
  ];

  Art art7;
  Art art96;
  Art art8;
  Art art16;
  Art art0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: tabs.length);

    _getArt();
  }

  _fetchArt(int type) async {
    String url = 'http://10.0.2.2:3000/artist/list?type=-1&area=${type}';

    var res = await http.get(url);
    var decodejson = jsonDecode(res.body);
    Art art;
    art = Art.fromJson(decodejson);
    return art;
  }

  _getArt() async {
    art7 = await _fetchArt(7);
    art96 = await _fetchArt(96);
    art8 = await _fetchArt(8);
    art16 = await _fetchArt(16);
    art0 = await _fetchArt(0);

//    print(art7.artists[0].name);
//    print(art96.artists[0].name);
//    print(art8.artists[0].name);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('歌手'),
        bottom: TabBar(
          controller: _tabController,
          tabs: tabs,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          art7 == null
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : buildArtItem(art7: art7),
          art96 == null
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : buildArtItem(art7: art96),
          art8 == null
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : buildArtItem(art7: art8),
          art16 == null
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : buildArtItem(art7: art16),
          art0 == null
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : buildArtItem(art7: art0),
        ],
      ),
    );
  }
}

class buildArtItem extends StatelessWidget {
  const buildArtItem({
    Key key,
    @required this.art7,
  }) : super(key: key);

  final Art art7;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        SizedBox(
          height: 10.0,
        ),
        GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4, crossAxisSpacing: 4.0, mainAxisSpacing: 4.0),
          itemBuilder: (ctx, index) {
            var item = art7.artists[index];

            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (ctx) => SingerPage(
                        id: item.id, imgUrl: item.img1V1Url, name: item.name)));
              },
              child: Container(
//                      color: Colors.blue,
                child: Column(
                  children: <Widget>[
                    ClipRRect(
                        borderRadius: BorderRadius.circular(30.0),
                        child: Hero(
                          tag: item.img1V1Url,
                          child: CachedNetworkImage(
                            imageUrl: item.img1V1Url + '?param=60y60',
                            width: 60,
                            height: 60,
                            placeholder: (context, url) =>
                                CircularProgressIndicator(),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                        )),
                    Text(
                      item.name,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              ),
            );
          },
          itemCount: art7.artists.length,
        ),
      ],
    );
  }
}
