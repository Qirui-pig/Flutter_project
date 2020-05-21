// To parse this JSON data, do
//
//     final video01 = video01FromJson(jsonString);

import 'dart:convert';

Video01 video01FromJson(String str) => Video01.fromJson(json.decode(str));

String video01ToJson(Video01 data) => json.encode(data.toJson());

class Video01 {
  List<Datum> data;
  int code;

  Video01({
    this.data,
    this.code,
  });

  factory Video01.fromJson(Map<String, dynamic> json) => Video01(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    code: json["code"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "code": code,
  };
}

class Datum {
  int id;
  String cover;
  String name;
  int playCount;
  String briefDesc;
  dynamic desc;
  String artistName;
  int artistId;
  int duration;
  int mark;
  bool subed;
  List<Artist> artists;

  Datum({
    this.id,
    this.cover,
    this.name,
    this.playCount,
    this.briefDesc,
    this.desc,
    this.artistName,
    this.artistId,
    this.duration,
    this.mark,
    this.subed,
    this.artists,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    cover: json["cover"],
    name: json["name"],
    playCount: json["playCount"],
    briefDesc: json["briefDesc"] == null ? null : json["briefDesc"],
    desc: json["desc"],
    artistName: json["artistName"],
    artistId: json["artistId"],
    duration: json["duration"],
    mark: json["mark"],
    subed: json["subed"],
    artists: List<Artist>.from(json["artists"].map((x) => Artist.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "cover": cover,
    "name": name,
    "playCount": playCount,
    "briefDesc": briefDesc == null ? null : briefDesc,
    "desc": desc,
    "artistName": artistName,
    "artistId": artistId,
    "duration": duration,
    "mark": mark,
    "subed": subed,
    "artists": List<dynamic>.from(artists.map((x) => x.toJson())),
  };
}

class Artist {
  int id;
  String name;

  Artist({
    this.id,
    this.name,
  });

  factory Artist.fromJson(Map<String, dynamic> json) => Artist(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
