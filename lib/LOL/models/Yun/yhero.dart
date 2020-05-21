// To parse this JSON data, do
//
//     final yHero = yHeroFromJson(jsonString);

import 'dart:convert';

YHero yHeroFromJson(String str) => YHero.fromJson(json.decode(str));

String yHeroToJson(YHero data) => json.encode(data.toJson());

class YHero {
  List<Datum> data;

  YHero({
    this.data,
  });

  factory YHero.fromJson(Map<String, dynamic> json) => YHero(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  String chessId;
  String title;
  String name;
  String displayName;
  String raceIds;
  String jobIds;
  String price;
  String skillName;
  SkillType skillType;
  String skillImage;
  String skillIntroduce;
  String skillDetail;
  String life;
  String magic;
  String startMagic;
  String armor;
  String spellBlock;
  String attackMag;
  String attack;
  String attackSpeed;
  String attackRange;
  String crit;
  String originalImage;
  String lifeMag;
  String tftid;
  String synergies;
  String illustrate;
  String recEquip;
  ProStatus proStatus;
  String races;
  String jobs;
  String attackData;
  String lifeData;

  Datum({
    this.chessId,
    this.title,
    this.name,
    this.displayName,
    this.raceIds,
    this.jobIds,
    this.price,
    this.skillName,
    this.skillType,
    this.skillImage,
    this.skillIntroduce,
    this.skillDetail,
    this.life,
    this.magic,
    this.startMagic,
    this.armor,
    this.spellBlock,
    this.attackMag,
    this.attack,
    this.attackSpeed,
    this.attackRange,
    this.crit,
    this.originalImage,
    this.lifeMag,
    this.tftid,
    this.synergies,
    this.illustrate,
    this.recEquip,
    this.proStatus,
    this.races,
    this.jobs,
    this.attackData,
    this.lifeData,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    chessId: json["chessId"],
    title: json["title"],
    name: json["name"],
    displayName: json["displayName"],
    raceIds: json["raceIds"],
    jobIds: json["jobIds"],
    price: json["price"],
    skillName: json["skillName"],
    skillType: skillTypeValues.map[json["skillType"]],
    skillImage: json["skillImage"],
    skillIntroduce: json["skillIntroduce"],
    skillDetail: json["skillDetail"],
    life: json["life"],
    magic: json["magic"],
    startMagic: json["startMagic"],
    armor: json["armor"],
    spellBlock: json["spellBlock"],
    attackMag: json["attackMag"],
    attack: json["attack"],
    attackSpeed: json["attackSpeed"],
    attackRange: json["attackRange"],
    crit: json["crit"],
    originalImage: json["originalImage"],
    lifeMag: json["lifeMag"],
    tftid: json["TFTID"],
    synergies: json["synergies"],
    illustrate: json["illustrate"],
    recEquip: json["recEquip"],
    proStatus: proStatusValues.map[json["proStatus"]],
    races: json["races"],
    jobs: json["jobs"],
    attackData: json["attackData"],
    lifeData: json["lifeData"],
  );

  Map<String, dynamic> toJson() => {
    "chessId": chessId,
    "title": title,
    "name": name,
    "displayName": displayName,
    "raceIds": raceIds,
    "jobIds": jobIds,
    "price": price,
    "skillName": skillName,
    "skillType": skillTypeValues.reverse[skillType],
    "skillImage": skillImage,
    "skillIntroduce": skillIntroduce,
    "skillDetail": skillDetail,
    "life": life,
    "magic": magic,
    "startMagic": startMagic,
    "armor": armor,
    "spellBlock": spellBlock,
    "attackMag": attackMag,
    "attack": attack,
    "attackSpeed": attackSpeed,
    "attackRange": attackRange,
    "crit": crit,
    "originalImage": originalImage,
    "lifeMag": lifeMag,
    "TFTID": tftid,
    "synergies": synergies,
    "illustrate": illustrate,
    "recEquip": recEquip,
    "proStatus": proStatusValues.reverse[proStatus],
    "races": races,
    "jobs": jobs,
    "attackData": attackData,
    "lifeData": lifeData,
  };
}

enum ProStatus { EMPTY, PRO_STATUS, PURPLE }

final proStatusValues = EnumValues({
  "增强": ProStatus.EMPTY,
  "无": ProStatus.PRO_STATUS,
  "削弱": ProStatus.PURPLE
});

enum SkillType { EMPTY, SKILL_TYPE }

final skillTypeValues = EnumValues({
  "主动": SkillType.EMPTY,
  "被动": SkillType.SKILL_TYPE
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
