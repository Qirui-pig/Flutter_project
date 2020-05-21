// To parse this JSON data, do
//
//     final playList = playListFromJson(jsonString);

import 'dart:convert';

PlayList playListFromJson(String str) => PlayList.fromJson(json.decode(str));

String playListToJson(PlayList data) => json.encode(data.toJson());

class PlayList {
  int code;
  List<Playlist> playlists;

  PlayList({
    this.code,
    this.playlists,
  });

  factory PlayList.fromJson(Map<String, dynamic> json) => PlayList(
    code: json["code"],
    playlists: List<Playlist>.from(json["playlists"].map((x) => Playlist.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "playlists": List<dynamic>.from(playlists.map((x) => x.toJson())),
  };
}

class Playlist {
  Creator creator;
  String coverImgUrl;
  String name;
  String id;

  Playlist({
    this.creator,
    this.coverImgUrl,
    this.name,
    this.id,
  });

  factory Playlist.fromJson(Map<String, dynamic> json) => Playlist(
    creator: Creator.fromJson(json["creator"]),
    coverImgUrl: json["coverImgUrl"],
    name: json["name"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "creator": creator.toJson(),
    "coverImgUrl": coverImgUrl,
    "name": name,
    "id": id,
  };
}

class Creator {
  String userId;
  String nickname;

  Creator({
    this.userId,
    this.nickname,
  });

  factory Creator.fromJson(Map<String, dynamic> json) => Creator(
    userId: json["userId"],
    nickname: json["nickname"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "nickname": nickname,
  };
}
