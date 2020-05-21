// To parse this JSON data, do
//
//     final heroItem = heroItemFromJson(jsonString);

import 'dart:convert';

HeroItem heroItemFromJson(String str) => HeroItem.fromJson(json.decode(str));

String heroItemToJson(HeroItem data) => json.encode(data.toJson());

class HeroItem {
  Heros heros;
  List<Skin> skins;
  List<Spell> spells;
  String version;
  String fileName;
  DateTime fileTime;

  HeroItem({
    this.heros,
    this.skins,
    this.spells,
    this.version,
    this.fileName,
    this.fileTime,
  });

  factory HeroItem.fromJson(Map<String, dynamic> json) => HeroItem(
    heros: Heros.fromJson(json["hero"]),
    skins: List<Skin>.from(json["skins"].map((x) => Skin.fromJson(x))),
    spells: List<Spell>.from(json["spells"].map((x) => Spell.fromJson(x))),
    version: json["version"],
    fileName: json["fileName"],
    fileTime: DateTime.parse(json["fileTime"]),
  );

  Map<String, dynamic> toJson() => {
    "heros": heros.toJson(),
    "skins": List<dynamic>.from(skins.map((x) => x.toJson())),
    "spells": List<dynamic>.from(spells.map((x) => x.toJson())),
    "version": version,
    "fileName": fileName,
    "fileTime": fileTime.toIso8601String(),
  };
}

class Heros {
  String heroId;
  Name name;
  String alias;
  Title title;
  List<String> roles;
  String shortBio;
  String camp;
  String attack;
  String defense;
  String magic;
  String difficulty;
  String hp;
  String hpperlevel;
  String mp;
  String mpperlevel;
  String movespeed;
  String armor;
  String armorperlevel;
  String spellblock;
  String spellblockperlevel;
  String attackrange;
  String hpregen;
  String hpregenperlevel;
  String mpregen;
  String mpregenperlevel;
  String crit;
  String critperlevel;
  String attackdamage;
  String attackdamageperlevel;
  String attackspeed;
  String attackspeedperlevel;
  List<String> allytips;
  List<String> enemytips;
  String heroVideoPath;
  String isWeekFree;
  String damageType;
  String style;
  String difficultyL;
  String damage;
  String durability;
  String crowdControl;
  String mobility;
  String utility;
  String selectAudio;
  String banAudio;

  Heros({
    this.heroId,
    this.name,
    this.alias,
    this.title,
    this.roles,
    this.shortBio,
    this.camp,
    this.attack,
    this.defense,
    this.magic,
    this.difficulty,
    this.hp,
    this.hpperlevel,
    this.mp,
    this.mpperlevel,
    this.movespeed,
    this.armor,
    this.armorperlevel,
    this.spellblock,
    this.spellblockperlevel,
    this.attackrange,
    this.hpregen,
    this.hpregenperlevel,
    this.mpregen,
    this.mpregenperlevel,
    this.crit,
    this.critperlevel,
    this.attackdamage,
    this.attackdamageperlevel,
    this.attackspeed,
    this.attackspeedperlevel,
    this.allytips,
    this.enemytips,
    this.heroVideoPath,
    this.isWeekFree,
    this.damageType,
    this.style,
    this.difficultyL,
    this.damage,
    this.durability,
    this.crowdControl,
    this.mobility,
    this.utility,
    this.selectAudio,
    this.banAudio,
  });

  factory Heros.fromJson(Map<String, dynamic> json) => Heros(
    heroId: json["heroId"],
    name: nameValues.map[json["name"]],
    alias: json["alias"],
    title: titleValues.map[json["title"]],
    roles: List<String>.from(json["roles"].map((x) => x)),
    shortBio: json["shortBio"],
    camp: json["camp"],
    attack: json["attack"],
    defense: json["defense"],
    magic: json["magic"],
    difficulty: json["difficulty"],
    hp: json["hp"],
    hpperlevel: json["hpperlevel"],
    mp: json["mp"],
    mpperlevel: json["mpperlevel"],
    movespeed: json["movespeed"],
    armor: json["armor"],
    armorperlevel: json["armorperlevel"],
    spellblock: json["spellblock"],
    spellblockperlevel: json["spellblockperlevel"],
    attackrange: json["attackrange"],
    hpregen: json["hpregen"],
    hpregenperlevel: json["hpregenperlevel"],
    mpregen: json["mpregen"],
    mpregenperlevel: json["mpregenperlevel"],
    crit: json["crit"],
    critperlevel: json["critperlevel"],
    attackdamage: json["attackdamage"],
    attackdamageperlevel: json["attackdamageperlevel"],
    attackspeed: json["attackspeed"],
    attackspeedperlevel: json["attackspeedperlevel"],
    allytips: List<String>.from(json["allytips"].map((x) => x)),
    enemytips: List<String>.from(json["enemytips"].map((x) => x)),
    heroVideoPath: json["heroVideoPath"],
    isWeekFree: json["isWeekFree"],
    damageType: json["damageType"],
    style: json["style"],
    difficultyL: json["difficultyL"],
    damage: json["damage"],
    durability: json["durability"],
    crowdControl: json["crowdControl"],
    mobility: json["mobility"],
    utility: json["utility"],
    selectAudio: json["selectAudio"],
    banAudio: json["banAudio"],
  );

  Map<String, dynamic> toJson() => {
    "heroId": heroId,
    "name": nameValues.reverse[name],
    "alias": alias,
    "title": titleValues.reverse[title],
    "roles": List<dynamic>.from(roles.map((x) => x)),
    "shortBio": shortBio,
    "camp": camp,
    "attack": attack,
    "defense": defense,
    "magic": magic,
    "difficulty": difficulty,
    "hp": hp,
    "hpperlevel": hpperlevel,
    "mp": mp,
    "mpperlevel": mpperlevel,
    "movespeed": movespeed,
    "armor": armor,
    "armorperlevel": armorperlevel,
    "spellblock": spellblock,
    "spellblockperlevel": spellblockperlevel,
    "attackrange": attackrange,
    "hpregen": hpregen,
    "hpregenperlevel": hpregenperlevel,
    "mpregen": mpregen,
    "mpregenperlevel": mpregenperlevel,
    "crit": crit,
    "critperlevel": critperlevel,
    "attackdamage": attackdamage,
    "attackdamageperlevel": attackdamageperlevel,
    "attackspeed": attackspeed,
    "attackspeedperlevel": attackspeedperlevel,
    "allytips": List<dynamic>.from(allytips.map((x) => x)),
    "enemytips": List<dynamic>.from(enemytips.map((x) => x)),
    "heroVideoPath": heroVideoPath,
    "isWeekFree": isWeekFree,
    "damageType": damageType,
    "style": style,
    "difficultyL": difficultyL,
    "damage": damage,
    "durability": durability,
    "crowdControl": crowdControl,
    "mobility": mobility,
    "utility": utility,
    "selectAudio": selectAudio,
    "banAudio": banAudio,
  };
}

enum Name { EMPTY }

final nameValues = EnumValues({
  "狂战士": Name.EMPTY
});

enum Title { EMPTY }

final titleValues = EnumValues({
  "奥拉夫": Title.EMPTY
});

class Skin {
  String skinId;
  String heroId;
  Name heroName;
  Title heroTitle;
  String name;
  String chromas;
  String chromasBelongId;
  String isBase;
  String emblemsName;
  String description;
  String mainImg;
  String iconImg;
  String loadingImg;
  String videoImg;
  String sourceImg;
  String vedioPath;
  String suitType;
  String publishTime;
  String chromaImg;

  Skin({
    this.skinId,
    this.heroId,
    this.heroName,
    this.heroTitle,
    this.name,
    this.chromas,
    this.chromasBelongId,
    this.isBase,
    this.emblemsName,
    this.description,
    this.mainImg,
    this.iconImg,
    this.loadingImg,
    this.videoImg,
    this.sourceImg,
    this.vedioPath,
    this.suitType,
    this.publishTime,
    this.chromaImg,
  });

  factory Skin.fromJson(Map<String, dynamic> json) => Skin(
    skinId: json["skinId"],
    heroId: json["heroId"],
    heroName: nameValues.map[json["heroName"]],
    heroTitle: titleValues.map[json["heroTitle"]],
    name: json["name"],
    chromas: json["chromas"],
    chromasBelongId: json["chromasBelongId"],
    isBase: json["isBase"],
    emblemsName: json["emblemsName"],
    description: json["description"],
    mainImg: json["mainImg"],
    iconImg: json["iconImg"],
    loadingImg: json["loadingImg"],
    videoImg: json["videoImg"],
    sourceImg: json["sourceImg"],
    vedioPath: json["vedioPath"],
    suitType: json["suitType"],
    publishTime: json["publishTime"],
    chromaImg: json["chromaImg"],
  );

  Map<String, dynamic> toJson() => {
    "skinId": skinId,
    "heroId": heroId,
    "heroName": nameValues.reverse[heroName],
    "heroTitle": titleValues.reverse[heroTitle],
    "name": name,
    "chromas": chromas,
    "chromasBelongId": chromasBelongId,
    "isBase": isBase,
    "emblemsName": emblemsName,
    "description": description,
    "mainImg": mainImg,
    "iconImg": iconImg,
    "loadingImg": loadingImg,
    "videoImg": videoImg,
    "sourceImg": sourceImg,
    "vedioPath": vedioPath,
    "suitType": suitType,
    "publishTime": publishTime,
    "chromaImg": chromaImg,
  };
}

class Spell {
  String heroId;
  String spellKey;
  String name;
  String description;
  String abilityIconPath;
  String abilityVideoPath;
  String dynamicDescription;
  dynamic cost;
  String costburn;
  dynamic cooldown;
  String cooldownburn;
  dynamic range;

  Spell({
    this.heroId,
    this.spellKey,
    this.name,
    this.description,
    this.abilityIconPath,
    this.abilityVideoPath,
    this.dynamicDescription,
    this.cost,
    this.costburn,
    this.cooldown,
    this.cooldownburn,
    this.range,
  });

  factory Spell.fromJson(Map<String, dynamic> json) => Spell(
    heroId: json["heroId"],
    spellKey: json["spellKey"],
    name: json["name"],
    description: json["description"],
    abilityIconPath: json["abilityIconPath"],
    abilityVideoPath: json["abilityVideoPath"],
    dynamicDescription: json["dynamicDescription"],
    cost: json["cost"],
    costburn: json["costburn"],
    cooldown: json["cooldown"],
    cooldownburn: json["cooldownburn"],
    range: json["range"],
  );

  Map<String, dynamic> toJson() => {
    "heroId": heroId,
    "spellKey": spellKey,
    "name": name,
    "description": description,
    "abilityIconPath": abilityIconPath,
    "abilityVideoPath": abilityVideoPath,
    "dynamicDescription": dynamicDescription,
    "cost": cost,
    "costburn": costburn,
    "cooldown": cooldown,
    "cooldownburn": cooldownburn,
    "range": range,
  };
}

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
