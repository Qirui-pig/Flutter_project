// To parse this JSON data, do
//
//     final topList = topListFromJson(jsonString);

import 'dart:convert';

TopList topListFromJson(String str) => TopList.fromJson(json.decode(str));

String topListToJson(TopList data) => json.encode(data.toJson());

class TopList {
  int code;
  List<ListElement> list;
  ArtistToplist artistToplist;
  RewardToplist rewardToplist;

  TopList({
    this.code,
    this.list,
    this.artistToplist,
    this.rewardToplist,
  });

  factory TopList.fromJson(Map<String, dynamic> json) => TopList(
    code: json["code"],
    list: List<ListElement>.from(json["list"].map((x) => ListElement.fromJson(x))),
    artistToplist: ArtistToplist.fromJson(json["artistToplist"]),
    rewardToplist: RewardToplist.fromJson(json["rewardToplist"]),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "list": List<dynamic>.from(list.map((x) => x.toJson())),
    "artistToplist": artistToplist.toJson(),
    "rewardToplist": rewardToplist.toJson(),
  };
}

class ArtistToplist {
  String coverUrl;
  List<ArtistToplistArtist> artists;
  String name;
  AteFrequency upateFrequency;
  int position;
  AteFrequency updateFrequency;

  ArtistToplist({
    this.coverUrl,
    this.artists,
    this.name,
    this.upateFrequency,
    this.position,
    this.updateFrequency,
  });

  factory ArtistToplist.fromJson(Map<String, dynamic> json) => ArtistToplist(
    coverUrl: json["coverUrl"],
    artists: List<ArtistToplistArtist>.from(json["artists"].map((x) => ArtistToplistArtist.fromJson(x))),
    name: json["name"],
    upateFrequency: ateFrequencyValues.map[json["upateFrequency"]],
    position: json["position"],
    updateFrequency: ateFrequencyValues.map[json["updateFrequency"]],
  );

  Map<String, dynamic> toJson() => {
    "coverUrl": coverUrl,
    "artists": List<dynamic>.from(artists.map((x) => x.toJson())),
    "name": name,
    "upateFrequency": ateFrequencyValues.reverse[upateFrequency],
    "position": position,
    "updateFrequency": ateFrequencyValues.reverse[updateFrequency],
  };
}

class ArtistToplistArtist {
  String first;
  String second;
  int third;

  ArtistToplistArtist({
    this.first,
    this.second,
    this.third,
  });

  factory ArtistToplistArtist.fromJson(Map<String, dynamic> json) => ArtistToplistArtist(
    first: json["first"],
    second: json["second"],
    third: json["third"],
  );

  Map<String, dynamic> toJson() => {
    "first": first,
    "second": second,
    "third": third,
  };
}

enum AteFrequency { EMPTY, ATE_FREQUENCY, PURPLE, FLUFFY, TENTACLED }

final ateFrequencyValues = EnumValues({
  "每周四更新": AteFrequency.ATE_FREQUENCY,
  "每天更新": AteFrequency.EMPTY,
  "每周一更新": AteFrequency.FLUFFY,
  "每周五更新": AteFrequency.PURPLE,
  "每周三更新": AteFrequency.TENTACLED
});

class ListElement {
  List<dynamic> subscribers;
  dynamic subscribed;
  dynamic creator;
  dynamic artists;
  List<Track> tracks;
  AteFrequency updateFrequency;
  int backgroundCoverId;
  dynamic backgroundCoverUrl;
  int titleImage;
  dynamic titleImageUrl;
  dynamic englishTitle;
  bool opRecommend;
  dynamic recommendInfo;
  String description;
  bool ordered;
  int status;
  List<String> tags;
  int userId;
  int adType;
  int trackNumberUpdateTime;
  int subscribedCount;
  int cloudTrackCount;
  int updateTime;
  String commentThreadId;
  String coverImgUrl;
  int privacy;
  int trackUpdateTime;
  int totalDuration;
  int trackCount;
  double coverImgId;
  bool newImported;
  bool anonimous;
  int specialType;
  int createTime;
  bool highQuality;
  int playCount;
  String name;
  int id;
  String coverImgIdStr;
  String toplistType;

  ListElement({
    this.subscribers,
    this.subscribed,
    this.creator,
    this.artists,
    this.tracks,
    this.updateFrequency,
    this.backgroundCoverId,
    this.backgroundCoverUrl,
    this.titleImage,
    this.titleImageUrl,
    this.englishTitle,
    this.opRecommend,
    this.recommendInfo,
    this.description,
    this.ordered,
    this.status,
    this.tags,
    this.userId,
    this.adType,
    this.trackNumberUpdateTime,
    this.subscribedCount,
    this.cloudTrackCount,
    this.updateTime,
    this.commentThreadId,
    this.coverImgUrl,
    this.privacy,
    this.trackUpdateTime,
    this.totalDuration,
    this.trackCount,
    this.coverImgId,
    this.newImported,
    this.anonimous,
    this.specialType,
    this.createTime,
    this.highQuality,
    this.playCount,
    this.name,
    this.id,
    this.coverImgIdStr,
    this.toplistType,
  });

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
    subscribers: List<dynamic>.from(json["subscribers"].map((x) => x)),
    subscribed: json["subscribed"],
    creator: json["creator"],
    artists: json["artists"],
    tracks: List<Track>.from(json["tracks"].map((x) => Track.fromJson(x))),
    updateFrequency: ateFrequencyValues.map[json["updateFrequency"]],
    backgroundCoverId: json["backgroundCoverId"],
    backgroundCoverUrl: json["backgroundCoverUrl"],
    titleImage: json["titleImage"],
    titleImageUrl: json["titleImageUrl"],
    englishTitle: json["englishTitle"],
    opRecommend: json["opRecommend"],
    recommendInfo: json["recommendInfo"],
    description: json["description"],
    ordered: json["ordered"],
    status: json["status"],
    tags: List<String>.from(json["tags"].map((x) => x)),
    userId: json["userId"],
    adType: json["adType"],
    trackNumberUpdateTime: json["trackNumberUpdateTime"],
    subscribedCount: json["subscribedCount"],
    cloudTrackCount: json["cloudTrackCount"],
    updateTime: json["updateTime"],
    commentThreadId: json["commentThreadId"],
    coverImgUrl: json["coverImgUrl"],
    privacy: json["privacy"],
    trackUpdateTime: json["trackUpdateTime"],
    totalDuration: json["totalDuration"],
    trackCount: json["trackCount"],
    coverImgId: json["coverImgId"].toDouble(),
    newImported: json["newImported"],
    anonimous: json["anonimous"],
    specialType: json["specialType"],
    createTime: json["createTime"],
    highQuality: json["highQuality"],
    playCount: json["playCount"],
    name: json["name"],
    id: json["id"],
    coverImgIdStr: json["coverImgId_str"],
    toplistType: json["ToplistType"] == null ? null : json["ToplistType"],
  );

  Map<String, dynamic> toJson() => {
    "subscribers": List<dynamic>.from(subscribers.map((x) => x)),
    "subscribed": subscribed,
    "creator": creator,
    "artists": artists,
    "tracks": List<dynamic>.from(tracks.map((x) => x.toJson())),
    "updateFrequency": ateFrequencyValues.reverse[updateFrequency],
    "backgroundCoverId": backgroundCoverId,
    "backgroundCoverUrl": backgroundCoverUrl,
    "titleImage": titleImage,
    "titleImageUrl": titleImageUrl,
    "englishTitle": englishTitle,
    "opRecommend": opRecommend,
    "recommendInfo": recommendInfo,
    "description": description,
    "ordered": ordered,
    "status": status,
    "tags": List<dynamic>.from(tags.map((x) => x)),
    "userId": userId,
    "adType": adType,
    "trackNumberUpdateTime": trackNumberUpdateTime,
    "subscribedCount": subscribedCount,
    "cloudTrackCount": cloudTrackCount,
    "updateTime": updateTime,
    "commentThreadId": commentThreadId,
    "coverImgUrl": coverImgUrl,
    "privacy": privacy,
    "trackUpdateTime": trackUpdateTime,
    "totalDuration": totalDuration,
    "trackCount": trackCount,
    "coverImgId": coverImgId,
    "newImported": newImported,
    "anonimous": anonimous,
    "specialType": specialType,
    "createTime": createTime,
    "highQuality": highQuality,
    "playCount": playCount,
    "name": name,
    "id": id,
    "coverImgId_str": coverImgIdStr,
    "ToplistType": toplistType == null ? null : toplistType,
  };
}

class Track {
  String first;
  String second;

  Track({
    this.first,
    this.second,
  });

  factory Track.fromJson(Map<String, dynamic> json) => Track(
    first: json["first"],
    second: json["second"],
  );

  Map<String, dynamic> toJson() => {
    "first": first,
    "second": second,
  };
}

class RewardToplist {
  String coverUrl;
  List<Song> songs;
  String name;
  int position;

  RewardToplist({
    this.coverUrl,
    this.songs,
    this.name,
    this.position,
  });

  factory RewardToplist.fromJson(Map<String, dynamic> json) => RewardToplist(
    coverUrl: json["coverUrl"],
    songs: List<Song>.from(json["songs"].map((x) => Song.fromJson(x))),
    name: json["name"],
    position: json["position"],
  );

  Map<String, dynamic> toJson() => {
    "coverUrl": coverUrl,
    "songs": List<dynamic>.from(songs.map((x) => x.toJson())),
    "name": name,
    "position": position,
  };
}

class Song {
  String name;
  int id;
  int position;
  List<dynamic> alias;
  int status;
  int fee;
  int copyrightId;
  String disc;
  int no;
  List<AlbumArtist> artists;
  Album album;
  bool starred;
  int popularity;
  int score;
  int starredNum;
  int duration;
  int playedNum;
  int dayPlays;
  int hearTime;
  String ringtone;
  dynamic crbt;
  dynamic audition;
  String copyFrom;
  String commentThreadId;
  dynamic rtUrl;
  int ftype;
  List<dynamic> rtUrls;
  int copyright;
  dynamic transName;
  dynamic sign;
  int mark;
  dynamic noCopyrightRcmd;
  Music hMusic;
  Music mMusic;
  Music lMusic;
  Music bMusic;
  int rtype;
  dynamic rurl;
  int mvid;
  dynamic mp3Url;

  Song({
    this.name,
    this.id,
    this.position,
    this.alias,
    this.status,
    this.fee,
    this.copyrightId,
    this.disc,
    this.no,
    this.artists,
    this.album,
    this.starred,
    this.popularity,
    this.score,
    this.starredNum,
    this.duration,
    this.playedNum,
    this.dayPlays,
    this.hearTime,
    this.ringtone,
    this.crbt,
    this.audition,
    this.copyFrom,
    this.commentThreadId,
    this.rtUrl,
    this.ftype,
    this.rtUrls,
    this.copyright,
    this.transName,
    this.sign,
    this.mark,
    this.noCopyrightRcmd,
    this.hMusic,
    this.mMusic,
    this.lMusic,
    this.bMusic,
    this.rtype,
    this.rurl,
    this.mvid,
    this.mp3Url,
  });

  factory Song.fromJson(Map<String, dynamic> json) => Song(
    name: json["name"],
    id: json["id"],
    position: json["position"],
    alias: List<dynamic>.from(json["alias"].map((x) => x)),
    status: json["status"],
    fee: json["fee"],
    copyrightId: json["copyrightId"],
    disc: json["disc"],
    no: json["no"],
    artists: List<AlbumArtist>.from(json["artists"].map((x) => AlbumArtist.fromJson(x))),
    album: Album.fromJson(json["album"]),
    starred: json["starred"],
    popularity: json["popularity"],
    score: json["score"],
    starredNum: json["starredNum"],
    duration: json["duration"],
    playedNum: json["playedNum"],
    dayPlays: json["dayPlays"],
    hearTime: json["hearTime"],
    ringtone: json["ringtone"] == null ? null : json["ringtone"],
    crbt: json["crbt"],
    audition: json["audition"],
    copyFrom: json["copyFrom"],
    commentThreadId: json["commentThreadId"],
    rtUrl: json["rtUrl"],
    ftype: json["ftype"],
    rtUrls: List<dynamic>.from(json["rtUrls"].map((x) => x)),
    copyright: json["copyright"],
    transName: json["transName"],
    sign: json["sign"],
    mark: json["mark"],
    noCopyrightRcmd: json["noCopyrightRcmd"],
    hMusic: Music.fromJson(json["hMusic"]),
    mMusic: Music.fromJson(json["mMusic"]),
    lMusic: Music.fromJson(json["lMusic"]),
    bMusic: Music.fromJson(json["bMusic"]),
    rtype: json["rtype"],
    rurl: json["rurl"],
    mvid: json["mvid"],
    mp3Url: json["mp3Url"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "id": id,
    "position": position,
    "alias": List<dynamic>.from(alias.map((x) => x)),
    "status": status,
    "fee": fee,
    "copyrightId": copyrightId,
    "disc": disc,
    "no": no,
    "artists": List<dynamic>.from(artists.map((x) => x.toJson())),
    "album": album.toJson(),
    "starred": starred,
    "popularity": popularity,
    "score": score,
    "starredNum": starredNum,
    "duration": duration,
    "playedNum": playedNum,
    "dayPlays": dayPlays,
    "hearTime": hearTime,
    "ringtone": ringtone == null ? null : ringtone,
    "crbt": crbt,
    "audition": audition,
    "copyFrom": copyFrom,
    "commentThreadId": commentThreadId,
    "rtUrl": rtUrl,
    "ftype": ftype,
    "rtUrls": List<dynamic>.from(rtUrls.map((x) => x)),
    "copyright": copyright,
    "transName": transName,
    "sign": sign,
    "mark": mark,
    "noCopyrightRcmd": noCopyrightRcmd,
    "hMusic": hMusic.toJson(),
    "mMusic": mMusic.toJson(),
    "lMusic": lMusic.toJson(),
    "bMusic": bMusic.toJson(),
    "rtype": rtype,
    "rurl": rurl,
    "mvid": mvid,
    "mp3Url": mp3Url,
  };
}

class Album {
  String name;
  int id;
  String type;
  int size;
  double picId;
  String blurPicUrl;
  int companyId;
  double pic;
  String picUrl;
  int publishTime;
  String description;
  String tags;
  dynamic company;
  String briefDesc;
  AlbumArtist artist;
  List<dynamic> songs;
  List<dynamic> alias;
  int status;
  int copyrightId;
  String commentThreadId;
  List<AlbumArtist> artists;
  String subType;
  dynamic transName;
  int mark;
  String picIdStr;

  Album({
    this.name,
    this.id,
    this.type,
    this.size,
    this.picId,
    this.blurPicUrl,
    this.companyId,
    this.pic,
    this.picUrl,
    this.publishTime,
    this.description,
    this.tags,
    this.company,
    this.briefDesc,
    this.artist,
    this.songs,
    this.alias,
    this.status,
    this.copyrightId,
    this.commentThreadId,
    this.artists,
    this.subType,
    this.transName,
    this.mark,
    this.picIdStr,
  });

  factory Album.fromJson(Map<String, dynamic> json) => Album(
    name: json["name"],
    id: json["id"],
    type: json["type"],
    size: json["size"],
    picId: json["picId"].toDouble(),
    blurPicUrl: json["blurPicUrl"],
    companyId: json["companyId"],
    pic: json["pic"].toDouble(),
    picUrl: json["picUrl"],
    publishTime: json["publishTime"],
    description: json["description"],
    tags: json["tags"],
    company: json["company"],
    briefDesc: json["briefDesc"],
    artist: AlbumArtist.fromJson(json["artist"]),
    songs: List<dynamic>.from(json["songs"].map((x) => x)),
    alias: List<dynamic>.from(json["alias"].map((x) => x)),
    status: json["status"],
    copyrightId: json["copyrightId"],
    commentThreadId: json["commentThreadId"],
    artists: List<AlbumArtist>.from(json["artists"].map((x) => AlbumArtist.fromJson(x))),
    subType: json["subType"],
    transName: json["transName"],
    mark: json["mark"],
    picIdStr: json["picId_str"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "id": id,
    "type": type,
    "size": size,
    "picId": picId,
    "blurPicUrl": blurPicUrl,
    "companyId": companyId,
    "pic": pic,
    "picUrl": picUrl,
    "publishTime": publishTime,
    "description": description,
    "tags": tags,
    "company": company,
    "briefDesc": briefDesc,
    "artist": artist.toJson(),
    "songs": List<dynamic>.from(songs.map((x) => x)),
    "alias": List<dynamic>.from(alias.map((x) => x)),
    "status": status,
    "copyrightId": copyrightId,
    "commentThreadId": commentThreadId,
    "artists": List<dynamic>.from(artists.map((x) => x.toJson())),
    "subType": subType,
    "transName": transName,
    "mark": mark,
    "picId_str": picIdStr,
  };
}

class AlbumArtist {
  String name;
  int id;
  int picId;
  int img1V1Id;
  String briefDesc;
  String picUrl;
  String img1V1Url;
  int albumSize;
  List<dynamic> alias;
  String trans;
  int musicSize;
  int topicPerson;

  AlbumArtist({
    this.name,
    this.id,
    this.picId,
    this.img1V1Id,
    this.briefDesc,
    this.picUrl,
    this.img1V1Url,
    this.albumSize,
    this.alias,
    this.trans,
    this.musicSize,
    this.topicPerson,
  });

  factory AlbumArtist.fromJson(Map<String, dynamic> json) => AlbumArtist(
    name: json["name"],
    id: json["id"],
    picId: json["picId"],
    img1V1Id: json["img1v1Id"],
    briefDesc: json["briefDesc"],
    picUrl: json["picUrl"],
    img1V1Url: json["img1v1Url"],
    albumSize: json["albumSize"],
    alias: List<dynamic>.from(json["alias"].map((x) => x)),
    trans: json["trans"],
    musicSize: json["musicSize"],
    topicPerson: json["topicPerson"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "id": id,
    "picId": picId,
    "img1v1Id": img1V1Id,
    "briefDesc": briefDesc,
    "picUrl": picUrl,
    "img1v1Url": img1V1Url,
    "albumSize": albumSize,
    "alias": List<dynamic>.from(alias.map((x) => x)),
    "trans": trans,
    "musicSize": musicSize,
    "topicPerson": topicPerson,
  };
}

class Music {
  dynamic name;
  int id;
  int size;
  Extension extension;
  int sr;
  int dfsId;
  int bitrate;
  int playTime;
  int volumeDelta;

  Music({
    this.name,
    this.id,
    this.size,
    this.extension,
    this.sr,
    this.dfsId,
    this.bitrate,
    this.playTime,
    this.volumeDelta,
  });

  factory Music.fromJson(Map<String, dynamic> json) => Music(
    name: json["name"],
    id: json["id"],
    size: json["size"],
    extension: extensionValues.map[json["extension"]],
    sr: json["sr"],
    dfsId: json["dfsId"],
    bitrate: json["bitrate"],
    playTime: json["playTime"],
    volumeDelta: json["volumeDelta"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "id": id,
    "size": size,
    "extension": extensionValues.reverse[extension],
    "sr": sr,
    "dfsId": dfsId,
    "bitrate": bitrate,
    "playTime": playTime,
    "volumeDelta": volumeDelta,
  };
}

enum Extension { MP3 }

final extensionValues = EnumValues({
  "mp3": Extension.MP3
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
