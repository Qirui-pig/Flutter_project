// To parse this JSON data, do
//
//     final yJob = yJobFromJson(jsonString);

import 'dart:convert';

YJob yJobFromJson(String str) => YJob.fromJson(json.decode(str));

String yJobToJson(YJob data) => json.encode(data.toJson());

class YJob {
  String version;
  String season;
  DateTime time;
  List<Datum> data;

  YJob({
    this.version,
    this.season,
    this.time,
    this.data,
  });

  factory YJob.fromJson(Map<String, dynamic> json) => YJob(
    version: json["version"],
    season: json["season"],
    time: DateTime.parse(json["time"]),
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "version": version,
    "season": season,
    "time": time.toIso8601String(),
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  String jobId;
  String name;
  String traitId;
  String introduce;
  String alias;
  dynamic level;
  String tftid;
  String imagePath;

  Datum({
    this.jobId,
    this.name,
    this.traitId,
    this.introduce,
    this.alias,
    this.level,
    this.tftid,
    this.imagePath,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    jobId: json["jobId"],
    name: json["name"],
    traitId: json["traitId"],
    introduce: json["introduce"],
    alias: json["alias"],
    level: json["level"],
    tftid: json["TFTID"],
    imagePath: json["imagePath"],
  );

  Map<String, dynamic> toJson() => {
    "jobId": jobId,
    "name": name,
    "traitId": traitId,
    "introduce": introduce,
    "alias": alias,
    "level": level,
    "TFTID": tftid,
    "imagePath": imagePath,
  };
}
