import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:http/http.dart' as http;
import 'package:pageview_test/NeteaseCloudMusic/model/playlist.dart';
import 'package:pageview_test/NeteaseCloudMusic/model/Banner/banner.dart';
import 'package:pageview_test/NeteaseCloudMusic/pages/playlist/playlist_page.dart';


import '../widget/playlist_item.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeScreen extends StatelessWidget {
  static final String routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('网易云音乐'),
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
  List<String> _swiperImg = [
    'assets/images/Netease/swiper/1.jpg',
    'assets/images/Netease/swiper/2.jpg',
    'assets/images/Netease/swiper/3.jpg',
    'assets/images/Netease/swiper/4.jpg',
    'assets/images/Netease/swiper/5.jpg'
  ];
  HomeBanner banner;
  PlayList _recommendList;

  @override
  void initState() {
    super.initState();

    _fetchPlayList();
    _fetchBanner();
  }

  _fetchPlayList() async {
    String url = 'http://10.0.2.2:3000/related/playlist?id=1';

    var res = await http.get(url);
    var decodeJson = jsonDecode(res.body);

    _recommendList = PlayList.fromJson(decodeJson);

//    print(_recommendList.playlists[0].id);
    setState(() {});
  }

  _fetchBanner() async {
    String url = 'http://10.0.2.2:3000/banner?type=2';

    var res = await http.get(url);
    var decodeJson = jsonDecode(res.body);

    banner = HomeBanner.fromJson(decodeJson);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          height: 180.0,
          margin: EdgeInsets.all(5.0),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
          child: banner == null
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Swiper(
                  itemCount: 4,
                  itemBuilder: (ctx, index) {
                    var bWidth = MediaQuery.of(context).size.width.floor();
//              print(bWidth);

                    return ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: CachedNetworkImage(
                        imageUrl:
                            '${banner.banners[index].pic}?param=${bWidth}y180',
                        fit: BoxFit.cover,
//                  placeholder: (context, url) => CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    );
                  },
                  pagination: SwiperPagination(),
                ),
        ),
        SizedBox(
          height: 5.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            buildTagItem(
              url: 'assets/images/Netease/banner/riqi.png',
              title: '每日推荐',
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/playlist');
              },
              child: buildTagItem(
                url: 'assets/images/Netease/banner/gedan.png',
                title: '歌单',
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/top');
              },
              child: buildTagItem(
                url: 'assets/images/Netease/banner/paixing.png',
                title: '排行榜',
              ),
            ),
            buildTagItem(
              url: 'assets/images/Netease/banner/diantai.png',
              title: '电台',
            ),
            buildTagItem(
              url: 'assets/images/Netease/banner/zhibo.png',
              title: '直播',
            ),
          ],
        ),
        Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    '推荐歌单',
                    style:
                        TextStyle(fontSize: 21.0, fontWeight: FontWeight.w600),
                  ),
                  OutlineButton(
                    child: Text('查看更多'),
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (ctx) => PlayListPage()));
                    },
                  )
                ],
              ),
            ),
            _recommendList == null
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Container(
                    height: 230.0,
                    child: ListView.builder(
                      itemCount: _recommendList.playlists.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (ctx, index) {
                        var item = _recommendList.playlists[index];

                        return JumpToDetail(
                          item: item,
                          dWidth: 135,
                        );
                      },
                    ),
                  )
          ],
        )
      ],
    );
  }
}

class buildTagItem extends StatelessWidget {
  final String url;
  final String title;

  const buildTagItem({Key key, this.title, this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: Theme.of(context).primaryColor),
            child: Stack(
              children: <Widget>[
                Center(
                  child: Container(
                    child: Image.asset(
                      url,
                      width: 40,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(5.0),
            child: Text(
              title,
              style: TextStyle(fontSize: 16.0),
            ),
          )
        ],
      ),
    );
  }
}
