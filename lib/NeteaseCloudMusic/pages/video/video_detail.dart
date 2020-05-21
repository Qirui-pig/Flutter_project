import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pageview_test/NeteaseCloudMusic/model/mv/mv_detail.dart';
import 'package:pageview_test/NeteaseCloudMusic/model/mv/mv_url.dart';
import 'package:pageview_test/NeteaseCloudMusic/model/mv/video_comment.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class VideoDetail extends StatefulWidget {
  static final String routeName = '/video_detail';
  final int id;
  final String name;

  VideoDetail({this.id, this.name});

  @override
  _VideoDetailState createState() => _VideoDetailState();
}

class _VideoDetailState extends State<VideoDetail> {
  VideoUrl vUrl;
  VideoDetailInfo videoDetailInfo;
  VideoCommentList videoCommentList;

  VideoPlayerController _videoPlayerController1;
  ChewieController _chewieController;

  @override
  void initState() {
    super.initState();

    _fetchVideoUrl();
    _fetchVideoDetail();
    _fetchVideoComment();
  }

  _fetchVideoUrl() async {
    String url = 'http://10.0.2.2:3000/mv/url?id=${widget.id}';
    var res = await http.get(url);
    var decodeJson = jsonDecode(res.body);
    vUrl = VideoUrl.fromJson(decodeJson);

    setState(() {});

    _videoPlayerController1 = VideoPlayerController.network('${vUrl.data.url}');
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController1,
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

  _fetchVideoDetail() async {
    String url = 'http://10.0.2.2:3000/mv/detail?mvid=${widget.id}';
    var res = await http.get(url);
    var decodeJson = jsonDecode(res.body);
    videoDetailInfo = VideoDetailInfo.fromJson(decodeJson);

    setState(() {});
  }

  _fetchVideoComment() async {
    String url = 'http://10.0.2.2:3000/comment/mv?id=${widget.id}';
    var res = await http.get(url);
    var decodeJson = jsonDecode(res.body);
    videoCommentList = VideoCommentList.fromJson(decodeJson);

    setState(() {});
  }

  @override
  void dispose() {
    _videoPlayerController1.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('${widget.name}'),
      ),
      body: Column(
        children: <Widget>[
          vUrl == null
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Chewie(
                  controller: _chewieController,
                ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2 + 30,
            child: videoDetailInfo == null
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView(
                    children: <Widget>[
                      _buildTop(videoDetailInfo: videoDetailInfo),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          '精彩评论',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 20),
                        ),
                      ),
                      videoCommentList == null
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : _buildComment(videoCommentList: videoCommentList)
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}

class _buildComment extends StatelessWidget {
  const _buildComment({
    Key key,
    @required this.videoCommentList,
  }) : super(key: key);

  final VideoCommentList videoCommentList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: videoCommentList.hotComments.length,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (ctx, index) {
          var item = videoCommentList.hotComments[index];
          return Container(
            margin: EdgeInsets.symmetric(
                vertical: 5, horizontal: 10),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        ClipRRect(
                            borderRadius:
                                BorderRadius.circular(
                                    20.0),
                            child: Image.network(
                              '${item.user.avatarUrl}?param=40y40',
                              width: 40,
                              fit: BoxFit.cover,
                            )),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          '${item.user.nickname}',
                          style: TextStyle(
                              color: Colors.grey[600]),
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          '${item.likedCount}',
                          style: TextStyle(
                              color: Colors.grey),
                        ),
                        Image.asset(
                          'assets/images/Netease/play/icon_parise.png',
                          width: 20,
                          color: Colors.grey,
                        )
                      ],
                    )
                  ],
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                ),
                Container(
                  margin: EdgeInsets.all(20.0),
                  child: Text('${item.content}'),
                ),
              ],
            ),
          );
        },
      );
  }
}

class _buildTop extends StatelessWidget {
  const _buildTop({
    Key key,
    @required this.videoDetailInfo,
  }) : super(key: key);

  final VideoDetailInfo videoDetailInfo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '${videoDetailInfo.data.desc}',
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            '${videoDetailInfo.data.playCount}次观看',
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            '发布：${videoDetailInfo.data.publishTime.year}/${videoDetailInfo.data.publishTime.month}/${videoDetailInfo.data.publishTime.day}',
            style: TextStyle(color: Colors.grey[700]),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Image.asset(
                    'assets/images/Netease/play/icon_event_commend.png',
                    width: 30,
                    fit: BoxFit.fitWidth,
                    color: Colors.black,
                  ),
                  Text('${videoDetailInfo.data.playCount}')
                ],
              ),
              Column(
                children: <Widget>[
                  Image.asset(
                    'assets/images/Netease/detail/duoxuan.png',
                    width: 30,
                    fit: BoxFit.fitWidth,
                    color: Colors.black,
                  ),
                  Text('${videoDetailInfo.data.subCount}')
                ],
              ),
              Column(
                children: <Widget>[
                  Image.asset(
                    'assets/images/Netease/play/icon_comment.png',
                    width: 30,
                    fit: BoxFit.fitWidth,
                    color: Colors.black,
                  ),
                  Text('${videoDetailInfo.data.commentCount}')
                ],
              ),
              Column(
                children: <Widget>[
                  Image.asset(
                    'assets/images/Netease/play/icon_share.png',
                    width: 30,
                    fit: BoxFit.fitWidth,
                    color: Colors.black,
                  ),
                  Text('分享')
                ],
              )
            ],
          ),
          Divider(
            thickness: 1.5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        '${videoDetailInfo.data.cover}?param=40y40',
                        width: 40,
                        fit: BoxFit.cover,
                      )),
                  SizedBox(
                    width: 15.0,
                  ),
                  Text(
                    '${videoDetailInfo.data.artistName}',
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
              FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(20.0)),
                color: Theme.of(context).primaryColor,
                child: Text(
                  '+收藏',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {},
              )
            ],
          ),
          Divider(
            thickness: 1.5,
          )
        ],
      ),
    );
  }
}
