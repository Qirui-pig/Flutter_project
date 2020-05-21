//import 'package:flutter/material.dart';
//
//class RecommendSong extends StatefulWidget {
//  static final String routeName = '/recommend_song';
//
//  @override
//  _RecommendSongState createState() => _RecommendSongState();
//}
//
//class _RecommendSongState extends State<RecommendSong> {
//  @override
//  Widget build(BuildContext context) {
//    return Material(
//      child: NestedScrollView(
//        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled){
//          return <Widget>[
//            SliverAppBar(
//              expandedHeight: 280.0,
//              pinned: true,
//              flexibleSpace: FlexibleSpaceBar(
//                centerTitle: true,
//                title: Text('每日推荐歌单'),
//                background: Hero(tag:widget.imgUrl,child: Image.network('${widget.imgUrl}?param=300y280',fit: BoxFit.cover,)),
//              ),
//            ) ,
//          ];
//        },
//        body:Container(),
//      ),
//    );
//  }
//}
