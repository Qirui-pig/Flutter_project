import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:pageview_test/NeteaseCloudMusic/model/mv/mv1.dart';
import 'package:pageview_test/NeteaseCloudMusic/pages/video/video_detail.dart';

class VideoPage extends StatelessWidget {
  static final String routeName = '/video';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('MV'),
      ),
      body: VideoContent(),
    );
  }
}

class VideoContent extends StatefulWidget {
  @override
  _VideoContentState createState() => _VideoContentState();
}

class _VideoContentState extends State<VideoContent> {
  Video01 video01;

  @override
  void initState() {
    super.initState();
    _fetchMVData();
  }

  _fetchMVData() async {
    final String url = 'http://10.0.2.2:3000/mv/first?limit=20';
    var res = await http.get(url);
    var decodeJson = jsonDecode(res.body);

    video01 = Video01.fromJson(decodeJson);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                'MV精选',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
            FlatButton(
              onPressed: () {},
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              child: Text('更多'),
            )
          ],
        ),
        video01 == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                padding: EdgeInsets.all(5.0),
                childAspectRatio: 1.3,
                children: video01.data.map((item) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (ctx) => VideoDetail(
                                id: item.id,
                                name: item.name,
                              )));
                    },
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Stack(
                            children: <Widget>[
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: CachedNetworkImage(
                                    imageUrl: '${item.cover}?param=180y100',
                                    width:
                                        MediaQuery.of(context).size.width - 15,
                                    height: 100,
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) =>
                                        CircularProgressIndicator(),
                                  )),
                              Positioned(
                                right: 5,
                                top: 5,
                                child: Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.play_arrow,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      '${item.playCount}',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Text(
                            item.name,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            item.artistName,
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          )
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                '更多精彩MV',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
            FlatButton(
              onPressed: () {},
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              child: Text('分类'),
            )
          ],
        ),
//        ListView.builder(itemBuilder: null)
      ],
    );
  }
}
