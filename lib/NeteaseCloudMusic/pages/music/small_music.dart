import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:chewie_audio/chewie_audio.dart';
import 'package:pageview_test/NeteaseCloudMusic/model/music/music.dart';
import 'package:video_player/video_player.dart';


class SmallMusicPage extends StatefulWidget {

  @override
  _SmallMusicPageState createState() => _SmallMusicPageState();
}

class _SmallMusicPageState extends State<SmallMusicPage> {
  VideoPlayerController _videoPlayerController1;
  ChewieAudioController _chewieAudioController;
  MusicData _music;


  @override
  void initState() {
    super.initState();

    _fetchMusic();
  }

  _fetchMusic() async{
    final String url = 'http://10.0.2.2:3000/song/url?id=33894312';

    var res = await http.get(url);
    var decodeJson = jsonDecode(res.body);
    _music = MusicData.fromJson(decodeJson);



    setState(() {

    });


    _videoPlayerController1 = VideoPlayerController.network(
        '${_music.datas[0].url}');

    _chewieAudioController = ChewieAudioController(
      videoPlayerController: _videoPlayerController1,
      autoPlay: true,
      looping: true,
      // Try playing around with some of these other options:

      // showControls: false,
      materialProgressColors: ChewieProgressColors(
        playedColor: Colors.red,
        handleColor: Colors.blue,
        backgroundColor: Colors.grey,
        bufferedColor: Colors.lightGreen,
      ),
      // autoInitialize: true,
    );
  }

  @override
  void dispose() {
    super.dispose();

    _videoPlayerController1.dispose();
    _chewieAudioController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return  Column(
      children: <Widget>[
        Center(
          child:_music == null ? Center(child: CircularProgressIndicator(),): ChewieAudio(
            controller: _chewieAudioController,
          ),
        ),
      ],
    );
  }

}

