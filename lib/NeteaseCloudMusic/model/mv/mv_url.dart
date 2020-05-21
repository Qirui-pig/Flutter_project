// To parse this JSON data, do
//
//     final videoUrl = videoUrlFromJson(jsonString);

import 'dart:convert';

VideoUrl videoUrlFromJson(String str) => VideoUrl.fromJson(json.decode(str));

String videoUrlToJson(VideoUrl data) => json.encode(data.toJson());

class VideoUrl {
  int code;
  Data data;

  VideoUrl({
    this.code,
    this.data,
  });

  factory VideoUrl.fromJson(Map<String, dynamic> json) => VideoUrl(
    code: json["code"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "data": data.toJson(),
  };
}

class Data {
  int id;
  String url;
  int r;
  int size;
  String md5;
  int code;
  int expi;
  int fee;
  int mvFee;
  int st;
  String msg;

  Data({
    this.id,
    this.url,
    this.r,
    this.size,
    this.md5,
    this.code,
    this.expi,
    this.fee,
    this.mvFee,
    this.st,
    this.msg,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    url: json["url"],
    r: json["r"],
    size: json["size"],
    md5: json["md5"],
    code: json["code"],
    expi: json["expi"],
    fee: json["fee"],
    mvFee: json["mvFee"],
    st: json["st"],
    msg: json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "url": url,
    "r": r,
    "size": size,
    "md5": md5,
    "code": code,
    "expi": expi,
    "fee": fee,
    "mvFee": mvFee,
    "st": st,
    "msg": msg,
  };
}
