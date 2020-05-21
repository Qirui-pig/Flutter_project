
import 'package:flutter/cupertino.dart';
import 'package:audioplayers/audioplayers.dart';

class SongProvide with ChangeNotifier {
  List _songs = [];
  AudioPlayer _audioPlayer = AudioPlayer();

  AudioPlayer get audioPlayer => _audioPlayer;


  void playSong(song) {
    this._songs.insert(0,song);
    play();
  }

  void play() {
    _audioPlayer.play(_songs[0]);
  }

  void stop() {
    _audioPlayer.stop();
  }

  void pause() {
    _audioPlayer.pause();
  }

}