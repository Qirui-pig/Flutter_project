// To parse this JSON data, do
//
//     final lhero = lheroFromJson(jsonString);

import 'dart:convert';

List<Lhero> lheroFromJson(String str) => List<Lhero>.from(json.decode(str).map((x) => Lhero.fromJson(x)));

String lheroToJson(List<Lhero> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Lhero {
  String heroId;
  String name;
  String alias;
  String title;
  List<String> roles;
  String isWeekFree;
  String attack;
  String defense;
  String magic;
  String difficulty;
  String selectAudio;
  String banAudio;

  Lhero({
    this.heroId,
    this.name,
    this.alias,
    this.title,
    this.roles,
    this.isWeekFree,
    this.attack,
    this.defense,
    this.magic,
    this.difficulty,
    this.selectAudio,
    this.banAudio,
  });

  factory Lhero.fromJson(Map<String, dynamic> json) => Lhero(
    heroId: json["heroId"],
    name: json["name"],
    alias: json["alias"],
    title: json["title"],
    roles: List<String>.from(json["roles"].map((x) => x)),
    isWeekFree: json["isWeekFree"],
    attack: json["attack"],
    defense: json["defense"],
    magic: json["magic"],
    difficulty: json["difficulty"],
    selectAudio: json["selectAudio"],
    banAudio: json["banAudio"],
  );

  Map<String, dynamic> toJson() => {
    "heroId": heroId,
    "name": name,
    "alias": alias,
    "title": title,
    "roles": List<dynamic>.from(roles.map((x) => x)),
    "isWeekFree": isWeekFree,
    "attack": attack,
    "defense": defense,
    "magic": magic,
    "difficulty": difficulty,
    "selectAudio": selectAudio,
    "banAudio": banAudio,
  };
}
