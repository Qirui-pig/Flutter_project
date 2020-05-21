// To parse this JSON data, do
//
//     final yRace = yRaceFromJson(jsonString);

import 'dart:convert';

YRace yRaceFromJson(String str) => YRace.fromJson(json.decode(str));

String yRaceToJson(YRace data) => json.encode(data.toJson());

class YRace {
  String version;
  String season;
  DateTime time;
  List<Datum> data;

  YRace({
    this.version,
    this.season,
    this.time,
    this.data,
  });

  factory YRace.fromJson(Map<String, dynamic> json) => YRace(
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
  String raceId;
  String name;
  String traitId;
  String introduce;
  String alias;
  Map<String, String> level;
  String tftid;
  String imagePath;

  Datum({
    this.raceId,
    this.name,
    this.traitId,
    this.introduce,
    this.alias,
    this.level,
    this.tftid,
    this.imagePath,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    raceId: json["raceId"],
    name: json["name"],
    traitId: json["traitId"],
    introduce: json["introduce"],
    alias: json["alias"],
    level: Map.from(json["level"]).map((k, v) => MapEntry<String, String>(k, v)),
    tftid: json["TFTID"],
    imagePath: json["imagePath"],
  );

  Map<String, dynamic> toJson() => {
    "raceId": raceId,
    "name": name,
    "traitId": traitId,
    "introduce": introduce,
    "alias": alias,
    "level": Map.from(level).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "TFTID": tftid,
    "imagePath": imagePath,
  };
}
