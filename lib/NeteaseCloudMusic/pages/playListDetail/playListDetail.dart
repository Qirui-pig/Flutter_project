import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:http/http.dart' as http;
import 'package:pageview_test/NeteaseCloudMusic/model/playlistdetail.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pageview_test/NeteaseCloudMusic/pages/music/music.dart';
import 'package:pageview_test/food/ui/shared/size_fit.dart';

class PlayListDetail extends StatefulWidget {
  static final String routeName = '/detail';

  final id;
  final String name;

  PlayListDetail({this.id, this.name});

  @override
  _PlayListDetailState createState() => _PlayListDetailState();
}

class _PlayListDetailState extends State<PlayListDetail> {
  PlayListDetailData detail;

  @override
  void initState() {
    super.initState();

    _fetchPlayListDetail();
  }

  _fetchPlayListDetail() async {
    String url = 'http://10.0.2.2:3000/playlist/detail?id=${widget.id}';

    var res = await http.get(url);
    var decodeJson = jsonDecode(res.body);

    detail = PlayListDetailData.fromJson(decodeJson);

//    print(detail.playlist.name);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.name),
      ),
      body: detail == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
              children: <Widget>[
                Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 250,
                      child: Image.network('${detail.playlist.coverImgUrl}'),
                    ),
                    BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 50.0, sigmaY: 40.0),
                      child: Center(
                        child: Container(
                          color: Colors.black.withOpacity(0.1),
                          width: MediaQuery.of(context).size.width,
                          height: 250,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 15.0,
                      top: 15.0,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Stack(
                            children: <Widget>[
                              ClipRRect(
                                child: Image.network(
                                  detail.playlist.coverImgUrl,
                                  width: 150,
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              Positioned(
                                right: 5,
                                top: 5,
                                child: Row(
                                  children: <Widget>[
                                    Icon(
                                      FontAwesomeIcons.solidPlayCircle,
                                      size: 17,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 7,
                                    ),
                                    Text(
                                      '${detail.playlist.playCount}',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15),
                                    ),
                                  ],
                                  mainAxisAlignment: MainAxisAlignment.end,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 7.0),
                            width: MediaQuery.of(context).size.width / 1.8,
                            height: 170,
//                      color: Colors.white,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  height: 60,
//                            color: Colors.red,
                                  child: Text(
                                    detail.playlist.name,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                                SizedBox(
                                  height: 7.0,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(18.0),
                                      child: Image.network(
                                        '${detail.playlist.creator.avatarUrl}',
                                        width: 36,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 7.0,
                                    ),
                                    Text(
                                      '${detail.playlist.creator.nickname} >',
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 15.0),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      width: 200,
                                      height: 50,
//                                color: Colors.deepOrangeAccent,
                                      child: Text(
                                        '${detail.playlist.description}',
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ),
                                    Text('>')
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      left: 10.0,
                      bottom: 5.0,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Image.asset(
                                  'assets/images/Netease/detail/pinglun.png',
                                  width: 30,
                                ),
                                Text(
                                  '${detail.playlist.shareCount}',
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                Image.asset(
                                  'assets/images/Netease/detail/chakantiezifenxiang.png',
                                  width: 30,
                                ),
                                Text(
                                  '${detail.playlist.shareCount}',
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                Image.asset(
                                  'assets/images/Netease/detail/xiazai.png',
                                  width: 30,
                                ),
                                Text(
                                  '下载',
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                Image.asset(
                                  'assets/images/Netease/detail/duoxuan.png',
                                  width: 30,
                                ),
                                Text(
                                  '全选',
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          width: 10.0,
                        ),
                        Icon(FontAwesomeIcons.playCircle),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          '播放全部',
                          style: TextStyle(
                              fontSize: 19, fontWeight: FontWeight.bold),
                        ),
                        Text('(共${detail.playlist.tracks.length}首)')
                      ],
                    ),
                    FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      color: Theme.of(context).primaryColor,
                      child: Text(
                        '+收藏(${detail.playlist.subscribedCount})',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {},
                    )
                  ],
                ),
                Divider(
                  thickness: 1.5,
                ),
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: detail.playlist.trackCount,
                    itemBuilder: (ctx, index) {
                      var item = detail.playlist.tracks[index];

                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) => MusicPage(
                                    id: item.id,
                                    name: item.ar[0].name,
                                    songName: item.name,
                                    imgUrl: item.al.picUrl,
                                  )));
                        },
                        child: Container(
                          margin: EdgeInsets.all(5.0),
                          width: MediaQuery.of(context).size.width,
                          height: 60,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
//                        SizedBox(width: 7.0,),
                                  Container(
                                      width: 30.0,
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 6.0),
                                      child: Text(
                                        '${index + 1}',
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 23),
                                      )),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                          width: 250,
                                          child: Text(
                                            item.name,
                                            style: TextStyle(
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.w500),
                                            overflow: TextOverflow.ellipsis,
                                          )),
                                      Container(
                                          width: 250,
                                          child: Text(
                                              '${item.ar[0].name}-${item.al.name}',
                                              overflow: TextOverflow.ellipsis))
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  IconButton(
                                    icon: Icon(
                                      FontAwesomeIcons.youtube,
                                      color: Colors.grey,
                                    ),
                                    onPressed: () {},
                                  ),
                                  IconButton(
                                    icon: Image.asset(
                                      'assets/images/Netease/detail/gengduo.png',
                                      color: Colors.grey,
                                    ),
                                    onPressed: () {},
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ],
            ),
    );
  }
}
