import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

main(){
  runApp(VideoApp());
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
    return MaterialApp(
      title: 'Video',
      theme: ThemeData.light().copyWith(
        platform: _platform ?? Theme.of(context).platform,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Video'),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Center(
                child: Chewie(
                  controller: _chewieController,
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }


  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}