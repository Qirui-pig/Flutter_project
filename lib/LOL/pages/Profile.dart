import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:pageview_test/LOL/models/waterfall/waterfall.dart';
import 'dart:math';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  WaterFall waterFall;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);

    _fetchWaterFall();
  }

  _fetchWaterFall() async {
    String url =
        'https://apps.game.qq.com/lol/lolapi/zanStatistics.php?a0=mzanWeekStatistics';
    var res = await http.get(url);

    var decodeJson = jsonDecode(res.body);

    waterFall = WaterFall.fromJson(decodeJson);

//    print(waterFall.msg[0].sNickName);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            expandedHeight: 280.0,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                '英雄联盟',
                style: TextStyle(color: Colors.white),
              ),
              background: Image.asset(
                'assets/images/top/0.jpg',
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: StickyTabBarDelegate(
              child: TabBar(
                labelColor: Colors.black,
                controller: this._tabController,
                tabs: <Widget>[
                  Tab(text: '图片'),
                  Tab(text: '视频'),
                ],
              ),
            ),
          )
        ];
      },
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          WaterFallPage(waterFall: waterFall),
          Container(
            child: VideoApp(),
          ),
        ],
      ),
    );
  }
}

class VideoApp extends StatefulWidget {
  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  TargetPlatform _platform;
  VideoPlayerController _controller;
  ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/video/3.mp4');
    _chewieController = ChewieController(
      videoPlayerController: _controller,
      aspectRatio: 3 / 2,
      autoPlay: true,
      looping: true,
      // Try playing around with some of these other options:

      // showControls: false,
      // materialProgressColors: ChewieProgressColors(
      //   playedColor: Colors.red,
      //   handleColor: Colors.blue,
      //   backgroundColor: Colors.grey,
      //   bufferedColor: Colors.lightGreen,
      // ),
      // placeholder: Container(
      //   color: Colors.grey,
      // ),
      // autoInitialize: true,
    );
  }

  Widget build(BuildContext context) {
    return  Chewie(controller: _chewieController,);
  }


  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _chewieController.dispose();
  }
}




class WaterFallPage extends StatelessWidget {
  const WaterFallPage({
    Key key,
    @required this.waterFall,
  }) : super(key: key);

  final WaterFall waterFall;

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      padding: EdgeInsets.symmetric(horizontal: 5.0,vertical: 5.0),
      crossAxisCount: 4,
      itemBuilder: (ctx, index) {
        var item = waterFall.msg[index];

        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Theme.of(context).accentColor,
          ),
          child: Column(children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  child: Image.network(
                    item.sCoverUrl,
                    fit: BoxFit.fitHeight,
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                Positioned(
                  top: 10.0,
                  left:10.0,
                  child: Container(
                    decoration:BoxDecoration(
                      color: Colors.lightBlue,
                      borderRadius: BorderRadius.circular(18.0)
                    ),
                    child: CircleAvatar(
                      backgroundColor: Color.fromRGBO(142, 200, 246, 1),
                      child: Text('${index+1}'),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(item.sTitle,
                      style: TextStyle(
                          fontSize: 16.0,
                          color: Color.fromRGBO(
                              Random().nextInt(255),
                              Random().nextInt(255),
                              Random().nextInt(255),
                              1)),
                      overflow: TextOverflow.ellipsis),
                  SizedBox(
                    height: 8.0,
                  ),
                  Row(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: Image.network(
                              item.sUrl,
                              width: 30.0,
                            ),
                          ),
                          Container(
                              width: 60.0,
                              child: Text(
                                item.sNickName,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(color: Colors.grey),
                              ))
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Icon(
                            FontAwesomeIcons.hotjar,
                            color: Colors.grey,
                            size: 17,
                          ),
                          SizedBox(width: 3.0),
                          Text(
                            item.iZanCountWeek,
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      )
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  )
                ],
              ),
            )
          ]),
        );
      },
      staggeredTileBuilder: (int index) =>
          StaggeredTile.count(2, index.isEven ? 2.7 : 3.0),
      mainAxisSpacing: 8.0,
      crossAxisSpacing: 8.0,
      itemCount: waterFall.msg.length,
    );
  }
}

class StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar child;

  StickyTabBarDelegate({@required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: this.child,
    );
  }

  @override
  double get maxExtent => this.child.preferredSize.height;

  @override
  double get minExtent => this.child.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
