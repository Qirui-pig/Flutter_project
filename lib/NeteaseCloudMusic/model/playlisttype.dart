// To parse this JSON data, do
//
//     final playList1 = playList1FromJson(jsonString);

import 'dart:convert';

PlayList1 playList1FromJson(String str) => PlayList1.fromJson(json.decode(str));

String playList1ToJson(PlayList1 data) => json.encode(data.toJson());

class PlayList1 {
  List<Playlist> playlists;
  int total;
  int code;
  bool more;
  String cat;

  PlayList1({
    this.playlists,
    this.total,
    this.code,
    this.more,
    this.cat,
  });

  factory PlayList1.fromJson(Map<String, dynamic> json) => PlayList1(
    playlists: List<Playlist>.from(json["playlists"].map((x) => Playlist.fromJson(x))),
    total: json["total"],
    code: json["code"],
    more: json["more"],
    cat: json["cat"],
  );

  Map<String, dynamic> toJson() => {
    "playlists": List<dynamic>.from(playlists.map((x) => x.toJson())),
    "total": total,
    "code": code,
    "more": more,
    "cat": cat,
  };
}

class Playlist {
  String name;
  int id;
  int trackNumberUpdateTime;
  int status;
  int userId;
  int createTime;
  int updateTime;
  int subscribedCount;
  int trackCount;
  int cloudTrackCount;
  String coverImgUrl;
  double coverImgId;
  String description;
  List<String> tags;
  int playCount;
  int trackUpdateTime;
  int specialType;
  int totalDuration;
  Creator creator;
  dynamic tracks;
  List<Creator> subscribers;
  dynamic subscribed;
  String commentThreadId;
  bool newImported;
  int adType;
  bool highQuality;
  int privacy;
  bool ordered;
  bool anonimous;
  int coverStatus;
  dynamic recommendInfo;
  int shareCount;
  String coverImgIdStr;
  int commentCount;
  Alg alg;

  Playlist({
    this.name,
    this.id,
    this.trackNumberUpdateTime,
    this.status,
    this.userId,
    this.createTime,
    this.updateTime,
    this.subscribedCount,
    this.trackCount,
    this.cloudTrackCount,
    this.coverImgUrl,
    this.coverImgId,
    this.description,
    this.tags,
    this.playCount,
    this.trackUpdateTime,
    this.specialType,
    this.totalDuration,
    this.creator,
    this.tracks,
    this.subscribers,
    this.subscribed,
    this.commentThreadId,
    this.newImported,
    this.adType,
    this.highQuality,
    this.privacy,
    this.ordered,
    this.anonimous,
    this.coverStatus,
    this.recommendInfo,
    this.shareCount,
    this.coverImgIdStr,
    this.commentCount,
    this.alg,
  });

  factory Playlist.fromJson(Map<String, dynamic> json) => Playlist(
    name: json["name"],
    id: json["id"],
    trackNumberUpdateTime: json["trackNumberUpdateTime"],
    status: json["status"],
    userId: json["userId"],
    createTime: json["createTime"],
    updateTime: json["updateTime"],
    subscribedCount: json["subscribedCount"],
    trackCount: json["trackCount"],
    cloudTrackCount: json["cloudTrackCount"],
    coverImgUrl: json["coverImgUrl"],
    coverImgId: json["coverImgId"].toDouble(),
    description: json["description"],
    tags: List<String>.from(json["tags"].map((x) => x)),
    playCount: json["playCount"],
    trackUpdateTime: json["trackUpdateTime"],
    specialType: json["specialType"],
    totalDuration: json["totalDuration"],
    creator: Creator.fromJson(json["creator"]),
    tracks: json["tracks"],
    subscribers: List<Creator>.from(json["subscribers"].map((x) => Creator.fromJson(x))),
    subscribed: json["subscribed"],
    commentThreadId: json["commentThreadId"],
    newImported: json["newImported"],
    adType: json["adType"],
    highQuality: json["highQuality"],
    privacy: json["privacy"],
    ordered: json["ordered"],
    anonimous: json["anonimous"],
    coverStatus: json["coverStatus"],
    recommendInfo: json["recommendInfo"],
    shareCount: json["shareCount"],
    coverImgIdStr: json["coverImgId_str"],
    commentCount: json["commentCount"],
    alg: algValues.map[json["alg"]],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "id": id,
    "trackNumberUpdateTime": trackNumberUpdateTime,
    "status": status,
    "userId": userId,
    "createTime": createTime,
    "updateTime": updateTime,
    "subscribedCount": subscribedCount,
    "trackCount": trackCount,
    "cloudTrackCount": cloudTrackCount,
    "coverImgUrl": coverImgUrl,
    "coverImgId": coverImgId,
    "description": description,
    "tags": List<dynamic>.from(tags.map((x) => x)),
    "playCount": playCount,
    "trackUpdateTime": trackUpdateTime,
    "specialType": specialType,
    "totalDuration": totalDuration,
    "creator": creator.toJson(),
    "tracks": tracks,
    "subscribers": List<dynamic>.from(subscribers.map((x) => x.toJson())),
    "subscribed": subscribed,
    "commentThreadId": commentThreadId,
    "newImported": newImported,
    "adType": adType,
    "highQuality": highQuality,
    "privacy": privacy,
    "ordered": ordered,
    "anonimous": anonimous,
    "coverStatus": coverStatus,
    "recommendInfo": recommendInfo,
    "shareCount": shareCount,
    "coverImgId_str": coverImgIdStr,
    "commentCount": commentCount,
    "alg": algValues.reverse[alg],
  };
}

enum Alg { ALG_SQ_FEATURED, ALG_SQ_TOPN_LR, OFFICIAL_PLAYLIST_LAN_MATCH }

final algValues = EnumValues({
  "alg_sq_featured": Alg.ALG_SQ_FEATURED,
  "alg_sq_topn_lr": Alg.ALG_SQ_TOPN_LR,
  "official_playlist_lanMatch": Alg.OFFICIAL_PLAYLIST_LAN_MATCH
});

class Creator {
  bool defaultAvatar;
  int province;
  int authStatus;
  bool followed;
  String avatarUrl;
  int accountStatus;
  int gender;
  int city;
  int birthday;
  int userId;
  int userType;
  String nickname;
  String signature;
  Description description;
  Description detailDescription;
  double avatarImgId;
  double backgroundImgId;
  String backgroundUrl;
  int authority;
  bool mutual;
  List<String> expertTags;
  Map<String, String> experts;
  int djStatus;
  int vipType;
  dynamic remarkName;
  String avatarImgIdStr;
  String backgroundImgIdStr;
  String creatorAvatarImgIdStr;

  Creator({
    this.defaultAvatar,
    this.province,
    this.authStatus,
    this.followed,
    this.avatarUrl,
    this.accountStatus,
    this.gender,
    this.city,
    this.birthday,
    this.userId,
    this.userType,
    this.nickname,
    this.signature,
    this.description,
    this.detailDescription,
    this.avatarImgId,
    this.backgroundImgId,
    this.backgroundUrl,
    this.authority,
    this.mutual,
    this.expertTags,
    this.experts,
    this.djStatus,
    this.vipType,
    this.remarkName,
    this.avatarImgIdStr,
    this.backgroundImgIdStr,
    this.creatorAvatarImgIdStr,
  });

  factory Creator.fromJson(Map<String, dynamic> json) => Creator(
    defaultAvatar: json["defaultAvatar"],
    province: json["province"],
    authStatus: json["authStatus"],
    followed: json["followed"],
    avatarUrl: json["avatarUrl"],
    accountStatus: json["accountStatus"],
    gender: json["gender"],
    city: json["city"],
    birthday: json["birthday"],
    userId: json["userId"],
    userType: json["userType"],
    nickname: json["nickname"],
    signature: json["signature"],
    description: descriptionValues.map[json["description"]],
    detailDescription: descriptionValues.map[json["detailDescription"]],
    avatarImgId: json["avatarImgId"].toDouble(),
    backgroundImgId: json["backgroundImgId"].toDouble(),
    backgroundUrl: json["backgroundUrl"],
    authority: json["authority"],
    mutual: json["mutual"],
    expertTags: json["expertTags"] == null ? null : List<String>.from(json["expertTags"].map((x) => x)),
    experts: json["experts"] == null ? null : Map.from(json["experts"]).map((k, v) => MapEntry<String, String>(k, v)),
    djStatus: json["djStatus"],
    vipType: json["vipType"],
    remarkName: json["remarkName"],
    avatarImgIdStr: json["avatarImgIdStr"],
    backgroundImgIdStr: json["backgroundImgIdStr"],
    creatorAvatarImgIdStr: json["avatarImgId_str"],
  );

  Map<String, dynamic> toJson() => {
    "defaultAvatar": defaultAvatar,
    "province": province,
    "authStatus": authStatus,
    "followed": followed,
    "avatarUrl": avatarUrl,
    "accountStatus": accountStatus,
    "gender": gender,
    "city": city,
    "birthday": birthday,
    "userId": userId,
    "userType": userType,
    "nickname": nickname,
    "signature": signature,
    "description": descriptionValues.reverse[description],
    "detailDescription": descriptionValues.reverse[detailDescription],
    "avatarImgId": avatarImgId,
    "backgroundImgId": backgroundImgId,
    "backgroundUrl": backgroundUrl,
    "authority": authority,
    "mutual": mutual,
    "expertTags": expertTags == null ? null : List<dynamic>.from(expertTags.map((x) => x)),
    "experts": experts == null ? null : Map.from(experts).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "djStatus": djStatus,
    "vipType": vipType,
    "remarkName": remarkName,
    "avatarImgIdStr": avatarImgIdStr,
    "backgroundImgIdStr": backgroundImgIdStr,
    "avatarImgId_str": creatorAvatarImgIdStr,
  };
}

enum Description { EMPTY, DESCRIPTION }

final descriptionValues = EnumValues({
  "网易云音乐官方账号": Description.DESCRIPTION,
  "": Description.EMPTY
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
