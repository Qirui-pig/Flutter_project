// To parse this JSON data, do
//
//     final art = artFromJson(jsonString);

import 'dart:convert';

Art artFromJson(String str) => Art.fromJson(json.decode(str));

String artToJson(Art data) => json.encode(data.toJson());

class Art {
  List<Artist> artists;
  bool more;
  int code;

  Art({
    this.artists,
    this.more,
    this.code,
  });

  factory Art.fromJson(Map<String, dynamic> json) => Art(
    artists: List<Artist>.from(json["artists"].map((x) => Artist.fromJson(x))),
    more: json["more"],
    code: json["code"],
  );

  Map<String, dynamic> toJson() => {
    "artists": List<dynamic>.from(artists.map((x) => x.toJson())),
    "more": more,
    "code": code,
  };
}

class Artist {
  double img1V1Id;
  int topicPerson;
  List<String> alias;
  bool followed;
  String briefDesc;
  int albumSize;
  String img1V1Url;
  String picUrl;
  double picId;
  String trans;
  int musicSize;
  String name;
  int id;
  String picIdStr;
  List<String> transNames;
  String img1V1IdStr;
  int accountId;

  Artist({
    this.img1V1Id,
    this.topicPerson,
    this.alias,
    this.followed,
    this.briefDesc,
    this.albumSize,
    this.img1V1Url,
    this.picUrl,
    this.picId,
    this.trans,
    this.musicSize,
    this.name,
    this.id,
    this.picIdStr,
    this.transNames,
    this.img1V1IdStr,
    this.accountId,
  });

  factory Artist.fromJson(Map<String, dynamic> json) => Artist(
    img1V1Id: json["img1v1Id"].toDouble(),
    topicPerson: json["topicPerson"],
    alias: List<String>.from(json["alias"].map((x) => x)),
    followed: json["followed"],
    briefDesc: json["briefDesc"],
    albumSize: json["albumSize"],
    img1V1Url: json["img1v1Url"],
    picUrl: json["picUrl"],
    picId: json["picId"].toDouble(),
    trans: json["trans"],
    musicSize: json["musicSize"],
    name: json["name"],
    id: json["id"],
    picIdStr: json["picId_str"] == null ? null : json["picId_str"],
    transNames: json["transNames"] == null ? null : List<String>.from(json["transNames"].map((x) => x)),
    img1V1IdStr: json["img1v1Id_str"] == null ? null : json["img1v1Id_str"],
    accountId: json["accountId"] == null ? null : json["accountId"],
  );

  Map<String, dynamic> toJson() => {
    "img1v1Id": img1V1Id,
    "topicPerson": topicPerson,
    "alias": List<dynamic>.from(alias.map((x) => x)),
    "followed": followed,
    "briefDesc": briefDesc,
    "albumSize": albumSize,
    "img1v1Url": img1V1Url,
    "picUrl": picUrl,
    "picId": picId,
    "trans": trans,
    "musicSize": musicSize,
    "name": name,
    "id": id,
    "picId_str": picIdStr == null ? null : picIdStr,
    "transNames": transNames == null ? null : List<dynamic>.from(transNames.map((x) => x)),
    "img1v1Id_str": img1V1IdStr == null ? null : img1V1IdStr,
    "accountId": accountId == null ? null : accountId,
  };
}
