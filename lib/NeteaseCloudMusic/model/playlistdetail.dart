// To parse this JSON data, do
//
//     final playListDetailData = playListDetailDataFromJson(jsonString);

import 'dart:convert';

PlayListDetailData playListDetailDataFromJson(String str) => PlayListDetailData.fromJson(json.decode(str));

String playListDetailDataToJson(PlayListDetailData data) => json.encode(data.toJson());

class PlayListDetailData {
  int code;
  dynamic relatedVideos;
  Playlist playlist;
  dynamic urls;
  List<Privilege> privileges;

  PlayListDetailData({
    this.code,
    this.relatedVideos,
    this.playlist,
    this.urls,
    this.privileges,
  });

  factory PlayListDetailData.fromJson(Map<String, dynamic> json) => PlayListDetailData(
    code: json["code"],
    relatedVideos: json["relatedVideos"],
    playlist: Playlist.fromJson(json["playlist"]),
    urls: json["urls"],
    privileges: List<Privilege>.from(json["privileges"].map((x) => Privilege.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "relatedVideos": relatedVideos,
    "playlist": playlist.toJson(),
    "urls": urls,
    "privileges": List<dynamic>.from(privileges.map((x) => x.toJson())),
  };
}

class Playlist {
  List<Creator> subscribers;
  bool subscribed;
  Creator creator;
  List<Track> tracks;
  List<TrackId> trackIds;
  dynamic updateFrequency;
  int backgroundCoverId;
  dynamic backgroundCoverUrl;
  int titleImage;
  dynamic titleImageUrl;
  dynamic englishTitle;
  bool opRecommend;
  String description;
  int subscribedCount;
  int cloudTrackCount;
  int userId;
  int adType;
  List<String> tags;
  int trackNumberUpdateTime;
  String name;
  int id;
  bool ordered;
  int updateTime;
  int privacy;
  int trackUpdateTime;
  int status;
  String coverImgUrl;
  double coverImgId;
  bool newImported;
  int specialType;
  int playCount;
  int trackCount;
  String commentThreadId;
  int createTime;
  bool highQuality;
  int shareCount;
  String coverImgIdStr;
  int commentCount;

  Playlist({
    this.subscribers,
    this.subscribed,
    this.creator,
    this.tracks,
    this.trackIds,
    this.updateFrequency,
    this.backgroundCoverId,
    this.backgroundCoverUrl,
    this.titleImage,
    this.titleImageUrl,
    this.englishTitle,
    this.opRecommend,
    this.description,
    this.subscribedCount,
    this.cloudTrackCount,
    this.userId,
    this.adType,
    this.tags,
    this.trackNumberUpdateTime,
    this.name,
    this.id,
    this.ordered,
    this.updateTime,
    this.privacy,
    this.trackUpdateTime,
    this.status,
    this.coverImgUrl,
    this.coverImgId,
    this.newImported,
    this.specialType,
    this.playCount,
    this.trackCount,
    this.commentThreadId,
    this.createTime,
    this.highQuality,
    this.shareCount,
    this.coverImgIdStr,
    this.commentCount,
  });

  factory Playlist.fromJson(Map<String, dynamic> json) => Playlist(
    subscribers: List<Creator>.from(json["subscribers"].map((x) => Creator.fromJson(x))),
    subscribed: json["subscribed"],
    creator: Creator.fromJson(json["creator"]),
    tracks: List<Track>.from(json["tracks"].map((x) => Track.fromJson(x))),
    trackIds: List<TrackId>.from(json["trackIds"].map((x) => TrackId.fromJson(x))),
    updateFrequency: json["updateFrequency"],
    backgroundCoverId: json["backgroundCoverId"],
    backgroundCoverUrl: json["backgroundCoverUrl"],
    titleImage: json["titleImage"],
    titleImageUrl: json["titleImageUrl"],
    englishTitle: json["englishTitle"],
    opRecommend: json["opRecommend"],
    description: json["description"],
    subscribedCount: json["subscribedCount"],
    cloudTrackCount: json["cloudTrackCount"],
    userId: json["userId"],
    adType: json["adType"],
    tags: List<String>.from(json["tags"].map((x) => x)),
    trackNumberUpdateTime: json["trackNumberUpdateTime"],
    name: json["name"],
    id: json["id"],
    ordered: json["ordered"],
    updateTime: json["updateTime"],
    privacy: json["privacy"],
    trackUpdateTime: json["trackUpdateTime"],
    status: json["status"],
    coverImgUrl: json["coverImgUrl"],
    coverImgId: json["coverImgId"].toDouble(),
    newImported: json["newImported"],
    specialType: json["specialType"],
    playCount: json["playCount"],
    trackCount: json["trackCount"],
    commentThreadId: json["commentThreadId"],
    createTime: json["createTime"],
    highQuality: json["highQuality"],
    shareCount: json["shareCount"],
    coverImgIdStr: json["coverImgId_str"],
    commentCount: json["commentCount"],
  );

  Map<String, dynamic> toJson() => {
    "subscribers": List<dynamic>.from(subscribers.map((x) => x.toJson())),
    "subscribed": subscribed,
    "creator": creator.toJson(),
    "tracks": List<dynamic>.from(tracks.map((x) => x.toJson())),
    "trackIds": List<dynamic>.from(trackIds.map((x) => x.toJson())),
    "updateFrequency": updateFrequency,
    "backgroundCoverId": backgroundCoverId,
    "backgroundCoverUrl": backgroundCoverUrl,
    "titleImage": titleImage,
    "titleImageUrl": titleImageUrl,
    "englishTitle": englishTitle,
    "opRecommend": opRecommend,
    "description": description,
    "subscribedCount": subscribedCount,
    "cloudTrackCount": cloudTrackCount,
    "userId": userId,
    "adType": adType,
    "tags": List<dynamic>.from(tags.map((x) => x)),
    "trackNumberUpdateTime": trackNumberUpdateTime,
    "name": name,
    "id": id,
    "ordered": ordered,
    "updateTime": updateTime,
    "privacy": privacy,
    "trackUpdateTime": trackUpdateTime,
    "status": status,
    "coverImgUrl": coverImgUrl,
    "coverImgId": coverImgId,
    "newImported": newImported,
    "specialType": specialType,
    "playCount": playCount,
    "trackCount": trackCount,
    "commentThreadId": commentThreadId,
    "createTime": createTime,
    "highQuality": highQuality,
    "shareCount": shareCount,
    "coverImgId_str": coverImgIdStr,
    "commentCount": commentCount,
  };
}

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
  String description;
  String detailDescription;
  double avatarImgId;
  double backgroundImgId;
  String backgroundUrl;
  int authority;
  bool mutual;
  List<String> expertTags;
  Experts experts;
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
    description: json["description"],
    detailDescription: json["detailDescription"],
    avatarImgId: json["avatarImgId"].toDouble(),
    backgroundImgId: json["backgroundImgId"].toDouble(),
    backgroundUrl: json["backgroundUrl"],
    authority: json["authority"],
    mutual: json["mutual"],
    expertTags: json["expertTags"] == null ? null : List<String>.from(json["expertTags"].map((x) => x)),
    experts: json["experts"] == null ? null : Experts.fromJson(json["experts"]),
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
    "description": description,
    "detailDescription": detailDescription,
    "avatarImgId": avatarImgId,
    "backgroundImgId": backgroundImgId,
    "backgroundUrl": backgroundUrl,
    "authority": authority,
    "mutual": mutual,
    "expertTags": expertTags == null ? null : List<dynamic>.from(expertTags.map((x) => x)),
    "experts": experts == null ? null : experts.toJson(),
    "djStatus": djStatus,
    "vipType": vipType,
    "remarkName": remarkName,
    "avatarImgIdStr": avatarImgIdStr,
    "backgroundImgIdStr": backgroundImgIdStr,
    "avatarImgId_str": creatorAvatarImgIdStr,
  };
}

class Experts {
  String the1;

  Experts({
    this.the1,
  });

  factory Experts.fromJson(Map<String, dynamic> json) => Experts(
    the1: json["1"],
  );

  Map<String, dynamic> toJson() => {
    "1": the1,
  };
}

class TrackId {
  int id;
  int v;
  dynamic alg;

  TrackId({
    this.id,
    this.v,
    this.alg,
  });

  factory TrackId.fromJson(Map<String, dynamic> json) => TrackId(
    id: json["id"],
    v: json["v"],
    alg: json["alg"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "v": v,
    "alg": alg,
  };
}

class Track {
  String name;
  int id;
  int pst;
  int t;
  List<Ar> ar;
  List<String> alia;
  int pop;
  int st;
  Rt rt;
  int fee;
  int v;
  String crbt;
  String cf;
  Al al;
  int dt;
  L h;
  L m;
  L l;
  dynamic a;
  String cd;
  int no;
  dynamic rtUrl;
  int ftype;
  List<dynamic> rtUrls;
  int djId;
  int copyright;
  int sId;
  int mark;
  int originCoverType;
  dynamic noCopyrightRcmd;
  int mst;
  int cp;
  int mv;
  int rtype;
  dynamic rurl;
  int publishTime;
  List<String> tns;

  Track({
    this.name,
    this.id,
    this.pst,
    this.t,
    this.ar,
    this.alia,
    this.pop,
    this.st,
    this.rt,
    this.fee,
    this.v,
    this.crbt,
    this.cf,
    this.al,
    this.dt,
    this.h,
    this.m,
    this.l,
    this.a,
    this.cd,
    this.no,
    this.rtUrl,
    this.ftype,
    this.rtUrls,
    this.djId,
    this.copyright,
    this.sId,
    this.mark,
    this.originCoverType,
    this.noCopyrightRcmd,
    this.mst,
    this.cp,
    this.mv,
    this.rtype,
    this.rurl,
    this.publishTime,
    this.tns,
  });

  factory Track.fromJson(Map<String, dynamic> json) => Track(
    name: json["name"],
    id: json["id"],
    pst: json["pst"],
    t: json["t"],
    ar: List<Ar>.from(json["ar"].map((x) => Ar.fromJson(x))),
    alia: List<String>.from(json["alia"].map((x) => x)),
    pop: json["pop"],
    st: json["st"],
    rt: json["rt"] == null ? null : rtValues.map[json["rt"]],
    fee: json["fee"],
    v: json["v"],
    crbt: json["crbt"] == null ? null : json["crbt"],
    cf: json["cf"],
    al: Al.fromJson(json["al"]),
    dt: json["dt"],
    h: json["h"] == null ? null : L.fromJson(json["h"]),
    m: json["m"] == null ? null : L.fromJson(json["m"]),
    l: L.fromJson(json["l"]),
    a: json["a"],
    cd: json["cd"],
    no: json["no"],
    rtUrl: json["rtUrl"],
    ftype: json["ftype"],
    rtUrls: List<dynamic>.from(json["rtUrls"].map((x) => x)),
    djId: json["djId"],
    copyright: json["copyright"],
    sId: json["s_id"],
    mark: json["mark"],
    originCoverType: json["originCoverType"],
    noCopyrightRcmd: json["noCopyrightRcmd"],
    mst: json["mst"],
    cp: json["cp"],
    mv: json["mv"],
    rtype: json["rtype"],
    rurl: json["rurl"],
    publishTime: json["publishTime"],
    tns: json["tns"] == null ? null : List<String>.from(json["tns"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "id": id,
    "pst": pst,
    "t": t,
    "ar": List<dynamic>.from(ar.map((x) => x.toJson())),
    "alia": List<dynamic>.from(alia.map((x) => x)),
    "pop": pop,
    "st": st,
    "rt": rt == null ? null : rtValues.reverse[rt],
    "fee": fee,
    "v": v,
    "crbt": crbt == null ? null : crbt,
    "cf": cf,
    "al": al.toJson(),
    "dt": dt,
    "h": h == null ? null : h.toJson(),
    "m": m == null ? null : m.toJson(),
    "l": l.toJson(),
    "a": a,
    "cd": cd,
    "no": no,
    "rtUrl": rtUrl,
    "ftype": ftype,
    "rtUrls": List<dynamic>.from(rtUrls.map((x) => x)),
    "djId": djId,
    "copyright": copyright,
    "s_id": sId,
    "mark": mark,
    "originCoverType": originCoverType,
    "noCopyrightRcmd": noCopyrightRcmd,
    "mst": mst,
    "cp": cp,
    "mv": mv,
    "rtype": rtype,
    "rurl": rurl,
    "publishTime": publishTime,
    "tns": tns == null ? null : List<dynamic>.from(tns.map((x) => x)),
  };
}

class Al {
  int id;
  String name;
  String picUrl;
  List<dynamic> tns;
  String picStr;
  double pic;

  Al({
    this.id,
    this.name,
    this.picUrl,
    this.tns,
    this.picStr,
    this.pic,
  });

  factory Al.fromJson(Map<String, dynamic> json) => Al(
    id: json["id"],
    name: json["name"],
    picUrl: json["picUrl"],
    tns: List<dynamic>.from(json["tns"].map((x) => x)),
    picStr: json["pic_str"] == null ? null : json["pic_str"],
    pic: json["pic"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "picUrl": picUrl,
    "tns": List<dynamic>.from(tns.map((x) => x)),
    "pic_str": picStr == null ? null : picStr,
    "pic": pic,
  };
}

class Ar {
  int id;
  String name;
  List<dynamic> tns;
  List<dynamic> alias;

  Ar({
    this.id,
    this.name,
    this.tns,
    this.alias,
  });

  factory Ar.fromJson(Map<String, dynamic> json) => Ar(
    id: json["id"],
    name: json["name"],
    tns: List<dynamic>.from(json["tns"].map((x) => x)),
    alias: List<dynamic>.from(json["alias"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "tns": List<dynamic>.from(tns.map((x) => x)),
    "alias": List<dynamic>.from(alias.map((x) => x)),
  };
}

class L {
  int br;
  int fid;
  int size;
  double vd;

  L({
    this.br,
    this.fid,
    this.size,
    this.vd,
  });

  factory L.fromJson(Map<String, dynamic> json) => L(
    br: json["br"],
    fid: json["fid"],
    size: json["size"],
    vd: json["vd"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "br": br,
    "fid": fid,
    "size": size,
    "vd": vd,
  };
}

enum Rt { EMPTY, THE_600902000005313667, THE_600902000009129443 }

final rtValues = EnumValues({
  "": Rt.EMPTY,
  "600902000005313667": Rt.THE_600902000005313667,
  "600902000009129443": Rt.THE_600902000009129443
});

class Privilege {
  int id;
  int fee;
  int payed;
  int st;
  int pl;
  int dl;
  int sp;
  int cp;
  int subp;
  bool cs;
  int maxbr;
  int fl;
  bool toast;
  int flag;
  bool preSell;
  int playMaxbr;
  int downloadMaxbr;

  Privilege({
    this.id,
    this.fee,
    this.payed,
    this.st,
    this.pl,
    this.dl,
    this.sp,
    this.cp,
    this.subp,
    this.cs,
    this.maxbr,
    this.fl,
    this.toast,
    this.flag,
    this.preSell,
    this.playMaxbr,
    this.downloadMaxbr,
  });

  factory Privilege.fromJson(Map<String, dynamic> json) => Privilege(
    id: json["id"],
    fee: json["fee"],
    payed: json["payed"],
    st: json["st"],
    pl: json["pl"],
    dl: json["dl"],
    sp: json["sp"],
    cp: json["cp"],
    subp: json["subp"],
    cs: json["cs"],
    maxbr: json["maxbr"],
    fl: json["fl"],
    toast: json["toast"],
    flag: json["flag"],
    preSell: json["preSell"],
    playMaxbr: json["playMaxbr"],
    downloadMaxbr: json["downloadMaxbr"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "fee": fee,
    "payed": payed,
    "st": st,
    "pl": pl,
    "dl": dl,
    "sp": sp,
    "cp": cp,
    "subp": subp,
    "cs": cs,
    "maxbr": maxbr,
    "fl": fl,
    "toast": toast,
    "flag": flag,
    "preSell": preSell,
    "playMaxbr": playMaxbr,
    "downloadMaxbr": downloadMaxbr,
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
