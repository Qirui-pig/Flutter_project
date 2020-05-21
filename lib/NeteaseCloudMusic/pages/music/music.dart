import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pageview_test/NeteaseCloudMusic/model/music/music.dart';
import 'package:pageview_test/NeteaseCloudMusic/provider/play.dart';
import 'package:pageview_test/NeteaseCloudMusic/provider/song.dart';
import 'package:provider/provider.dart';
import 'dart:ui';
import 'package:audioplayers/audioplayers.dart';

class MusicPage extends StatefulWidget {
  static final String routeName = '/music';

  final id;
  final String name;
  final String songName;
  final String imgUrl;

  MusicPage({this.id, this.name, this.songName, this.imgUrl});

  @override
  _MusicPageState createState() => _MusicPageState();
}

class _MusicPageState extends State<MusicPage>
    with SingleTickerProviderStateMixin {
  MusicData _music;
  AnimationController _animationController;
  Animation _animation;

  AudioPlayer _audioPlayer = AudioPlayer();
  String currentTime = '0:00';
  String completeTime = '0:00';

  @override
  void initState() {
    _animationController =
        AnimationController(duration: Duration(seconds: 2), vsync: this);

    _animation = Tween(begin: -.15, end: -.01).animate(_animationController);

    super.initState();

    _fetchMusic();
  }

  _fetchMusic() async {
    final String url = 'http://10.0.2.2:3000/song/url?id=${widget.id}';

    var res = await http.get(url);
    var decodeJson = jsonDecode(res.body);
    _music = MusicData.fromJson(decodeJson);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(widget.songName),
            Text(
              widget.name,
              style: TextStyle(fontSize: 15),
            ),
          ],
        ),
      ),
      body: _music == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 1.5,
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        left: MediaQuery.of(context).size.width / 2 - 135,
                        top: MediaQuery.of(context).size.height / 2 - 200,
                        child: CenterPlay(imgUrl: widget.imgUrl),
                      ),
                      Positioned(
                        top: 25,
                        left: MediaQuery.of(context).size.width / 3,
                        child: RotationTransition(
                          turns: _animation,
                          alignment: Alignment(-1 + 90 / 293, -1 + 90 / 504),
                          child: Image.asset(
                            'assets/images/Netease/play/bgm.png',
                            width: 146.5,
                            height: 252,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Image.asset(
                      'assets/images/Netease/play/icon_dislike.png',
                      color: Colors.red,
                      width: 50,
                      height: 50,
                    ),
                    Image.asset(
                      'assets/images/Netease/play/icon_download_black.png',
                      color: Colors.red,
                      width: 50,
                      height: 50,
                    ),
                    Image.asset(
                      'assets/images/Netease/play/bfc.png',
                      color: Colors.red,
                      width: 40,
                      height: 40,
                    ),
                    Image.asset(
                      'assets/images/Netease/play/icon_comment.png',
                      color: Colors.red,
                      width: 30,
                      height: 30,
                    ),
                    Image.asset(
                      'assets/images/Netease/play/icon_music.png',
                      color: Colors.red,
                      width: 50,
                      height: 50,
                    ),
                  ],
                ),

//          Row(
//            children: <Widget>[
//              Text(currentTime),
//              Text(completeTime)
//            ],
//          ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Image.asset(
                      'assets/images/Netease/play/icon_song_play_type_1.png',
                      color: Colors.grey,
                      width: 50,
                      height: 50,
                    ),
                    Image.asset(
                      'assets/images/Netease/play/icon_song_left.png',
                      color: Colors.grey,
                      width: 50,
                      height: 50,
                    ),
                    Consumer2<PlayProvider, SongProvide>(
                      builder: (ctx, play, song, child) {
//                  song.audioPlayer.onAudioPositionChanged.listen((Duration duration){
//                    currentTime = duration.toString().split('.')[0];
//                  });
//
//                  song.audioPlayer.onDurationChanged.listen((Duration duration){
//                    completeTime = duration.toString().split('.')[0];
//                  });

                        return FlatButton(
                          onPressed: () {
                            setState(() {
                              play.isPlay = !play.isPlay;

                              play.isPlay
                                  ? song.playSong(_music.datas[0].url)
                                  : song.pause();
                              play.isPlay
                                  ? _animationController.forward()
                                  : _animationController.reverse();
                            });
                          },
                          child: play.isPlay
                              ? Image.asset(
                                  'assets/images/Netease/play/pause.png',
                                  color: Colors.grey,
                                  width: 50,
                                  height: 50,
                                )
                              : Image.asset(
                                  'assets/images/Netease/play/play.png',
                                  color: Colors.grey,
                                  width: 50,
                                  height: 50,
                                ),
                        );
                      },
                    ),
                    Image.asset(
                      'assets/images/Netease/play/icon_song_right.png',
                      color: Colors.grey,
                      width: 50,
                      height: 50,
                    ),
                    Image.asset(
                      'assets/images/Netease/play/list.png',
                      color: Colors.grey,
                      width: 40,
                      height: 40,
                    ),
                  ],
                ),
              ],
            ),
    );
  }
}

class CenterPlay extends StatefulWidget {
  final String imgUrl;

  CenterPlay({@required this.imgUrl});

  @override
  _CenterPlayState createState() => _CenterPlayState();
}

class _CenterPlayState extends State<CenterPlay>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _animation;

  void initState() {
    _animationController =
        AnimationController(duration: Duration(seconds: 4), vsync: this);

    _animation = Tween(begin: .0, end: .9).animate(_animationController);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isPlay = Provider.of<PlayProvider>(context).isPlay;
    isPlay ? _animationController.repeat() : _animationController.stop();

    return RotationTransition(
      turns: _animation,
      child: Container(
        height: 270,
        width: 270,
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(135)),
        child: Stack(
          children: <Widget>[
            Image.asset('assets/images/Netease/play/bet.png'),
            Center(
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(90),
                    child: Image.network(
                      '${widget.imgUrl}?parma=100y100',
                      width: 180,
                    )))
          ],
        ),
      ),
    );
  }
}
