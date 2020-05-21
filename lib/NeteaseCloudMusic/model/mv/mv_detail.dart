// To parse this JSON data, do
//
//     final videoDetailInfo = videoDetailInfoFromJson(jsonString);

import 'dart:convert';

VideoDetailInfo videoDetailInfoFromJson(String str) => VideoDetailInfo.fromJson(json.decode(str));

String videoDetailInfoToJson(VideoDetailInfo data) => json.encode(data.toJson());

class VideoDetailInfo {
  String loadingPic;
  String bufferPic;
  String loadingPicFs;
  String bufferPicFs;
  bool subed;
  Mp mp;
  Data data;
  int code;

  VideoDetailInfo({
    this.loadingPic,
    this.bufferPic,
    this.loadingPicFs,
    this.bufferPicFs,
    this.subed,
    this.mp,
    this.data,
    this.code,
  });

  factory VideoDetailInfo.fromJson(Map<String, dynamic> json) => VideoDetailInfo(
    loadingPic: json["loadingPic"],
    bufferPic: json["bufferPic"],
    loadingPicFs: json["loadingPicFS"],
    bufferPicFs: json["bufferPicFS"],
    subed: json["subed"],
    mp: Mp.fromJson(json["mp"]),
    data: Data.fromJson(json["data"]),
    code: json["code"],
  );

  Map<String, dynamic> toJson() => {
    "loadingPic": loadingPic,
    "bufferPic": bufferPic,
    "loadingPicFS": loadingPicFs,
    "bufferPicFS": bufferPicFs,
    "subed": subed,
    "mp": mp.toJson(),
    "data": data.toJson(),
    "code": code,
  };
}

class Data {
  int id;
  String name;
  int artistId;
  String artistName;
  String briefDesc;
  String desc;
  String cover;
  String coverIdStr;
  double coverId;
  int playCount;
  int subCount;
  int shareCount;
  int commentCount;
  int duration;
  int nType;
  DateTime publishTime;
  dynamic price;
  List<Br> brs;
  List<Artist> artists;
  String commentThreadId;
  List<VideoGroup> videoGroup;

  Data({
    this.id,
    this.name,
    this.artistId,
    this.artistName,
    this.briefDesc,
    this.desc,
    this.cover,
    this.coverIdStr,
    this.coverId,
    this.playCount,
    this.subCount,
    this.shareCount,
    this.commentCount,
    this.duration,
    this.nType,
    this.publishTime,
    this.price,
    this.brs,
    this.artists,
    this.commentThreadId,
    this.videoGroup,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    name: json["name"],
    artistId: json["artistId"],
    artistName: json["artistName"],
    briefDesc: json["briefDesc"],
    desc: json["desc"],
    cover: json["cover"],
    coverIdStr: json["coverId_str"],
    coverId: json["coverId"].toDouble(),
    playCount: json["playCount"],
    subCount: json["subCount"],
    shareCount: json["shareCount"],
    commentCount: json["commentCount"],
    duration: json["duration"],
    nType: json["nType"],
    publishTime: DateTime.parse(json["publishTime"]),
    price: json["price"],
    brs: List<Br>.from(json["brs"].map((x) => Br.fromJson(x))),
    artists: List<Artist>.from(json["artists"].map((x) => Artist.fromJson(x))),
    commentThreadId: json["commentThreadId"],
    videoGroup: List<VideoGroup>.from(json["videoGroup"].map((x) => VideoGroup.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "artistId": artistId,
    "artistName": artistName,
    "briefDesc": briefDesc,
    "desc": desc,
    "cover": cover,
    "coverId_str": coverIdStr,
    "coverId": coverId,
    "playCount": playCount,
    "subCount": subCount,
    "shareCount": shareCount,
    "commentCount": commentCount,
    "duration": duration,
    "nType": nType,
    "publishTime": "${publishTime.year.toString().padLeft(4, '0')}-${publishTime.month.toString().padLeft(2, '0')}-${publishTime.day.toString().padLeft(2, '0')}",
    "price": price,
    "brs": List<dynamic>.from(brs.map((x) => x.toJson())),
    "artists": List<dynamic>.from(artists.map((x) => x.toJson())),
    "commentThreadId": commentThreadId,
    "videoGroup": List<dynamic>.from(videoGroup.map((x) => x.toJson())),
  };
}

class Artist {
  int id;
  String name;
  String img1V1Url;
  bool followed;

  Artist({
    this.id,
    this.name,
    this.img1V1Url,
    this.followed,
  });

  factory Artist.fromJson(Map<String, dynamic> json) => Artist(
    id: json["id"],
    name: json["name"],
    img1V1Url: json["img1v1Url"],
    followed: json["followed"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "img1v1Url": img1V1Url,
    "followed": followed,
  };
}

class Br {
  int size;
  int br;
  int point;

  Br({
    this.size,
    this.br,
    this.point,
  });

  factory Br.fromJson(Map<String, dynamic> json) => Br(
    size: json["size"],
    br: json["br"],
    point: json["point"],
  );

  Map<String, dynamic> toJson() => {
    "size": size,
    "br": br,
    "point": point,
  };
}

class VideoGroup {
  int id;
  String name;
  int type;

  VideoGroup({
    this.id,
    this.name,
    this.type,
  });

  factory VideoGroup.fromJson(Map<String, dynamic> json) => VideoGroup(
    id: json["id"],
    name: json["name"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "type": type,
  };
}

class Mp {
  int id;
  int fee;
  int mvFee;
  int payed;
  int pl;
  int dl;
  int cp;
  int sid;
  int st;
  bool normal;
  bool unauthorized;
  dynamic msg;

  Mp({
    this.id,
    this.fee,
    this.mvFee,
    this.payed,
    this.pl,
    this.dl,
    this.cp,
    this.sid,
    this.st,
    this.normal,
    this.unauthorized,
    this.msg,
  });

  factory Mp.fromJson(Map<String, dynamic> json) => Mp(
    id: json["id"],
    fee: json["fee"],
    mvFee: json["mvFee"],
    payed: json["payed"],
    pl: json["pl"],
    dl: json["dl"],
    cp: json["cp"],
    sid: json["sid"],
    st: json["st"],
    normal: json["normal"],
    unauthorized: json["unauthorized"],
    msg: json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "fee": fee,
    "mvFee": mvFee,
    "payed": payed,
    "pl": pl,
    "dl": dl,
    "cp": cp,
    "sid": sid,
    "st": st,
    "normal": normal,
    "unauthorized": unauthorized,
    "msg": msg,
  };
}
