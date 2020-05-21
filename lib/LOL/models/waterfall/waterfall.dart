// To parse this JSON data, do
//
//     final waterFall = waterFallFromJson(jsonString);

import 'dart:convert';

WaterFall waterFallFromJson(String str) => WaterFall.fromJson(json.decode(str));

String waterFallToJson(WaterFall data) => json.encode(data.toJson());

class WaterFall {
  List<Msg> msg;

  WaterFall({
    this.msg,
  });

  factory WaterFall.fromJson(Map<String, dynamic> json) => WaterFall(
    msg: List<Msg>.from(json["msg"].map((x) => Msg.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "msg": List<dynamic>.from(msg.map((x) => x.toJson())),
  };
}

class Msg {
  String iAuditStatus;
  String sUrl;
  String iZanCount;
  String sTitle;
  String sCoverUrl;
  String iCategory1;
  String sNickName;
  String sOpenId;
  String iContentId;
  String iZanCountWeek;

  Msg({
    this.iAuditStatus,
    this.sUrl,
    this.iZanCount,
    this.sTitle,
    this.sCoverUrl,
    this.iCategory1,
    this.sNickName,
    this.sOpenId,
    this.iContentId,
    this.iZanCountWeek,
  });

  factory Msg.fromJson(Map<String, dynamic> json) => Msg(
    iAuditStatus: json["iAuditStatus"],
    sUrl: json["sUrl"],
    iZanCount: json["iZanCount"],
    sTitle: json["sTitle"],
    sCoverUrl: json["sCoverUrl"],
    iCategory1: json["iCategory1"],
    sNickName: json["sNickName"],
    sOpenId: json["sOpenId"],
    iContentId: json["iContentId"],
    iZanCountWeek: json["iZanCountWeek"],
  );

  Map<String, dynamic> toJson() => {
    "iAuditStatus": iAuditStatus,
    "sUrl": sUrl,
    "iZanCount": iZanCount,
    "sTitle": sTitle,
    "sCoverUrl": sCoverUrl,
    "iCategory1": iCategory1,
    "sNickName": sNickName,
    "sOpenId": sOpenId,
    "iContentId": iContentId,
    "iZanCountWeek": iZanCountWeek,
  };
}
