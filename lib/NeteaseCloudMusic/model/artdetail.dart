// To parse this JSON data, do
//
//     final artDetail = artDetailFromJson(jsonString);

import 'dart:convert';

ArtDetail artDetailFromJson(String str) => ArtDetail.fromJson(json.decode(str));

String artDetailToJson(ArtDetail data) => json.encode(data.toJson());

class ArtDetail {
  List<Introduction> introduction;
  String briefDesc;
  int count;
  List<TopicDatum> topicData;
  int code;

  ArtDetail({
    this.introduction,
    this.briefDesc,
    this.count,
    this.topicData,
    this.code,
  });

  factory ArtDetail.fromJson(Map<String, dynamic> json) => ArtDetail(
    introduction: List<Introduction>.from(json["introduction"].map((x) => Introduction.fromJson(x))),
    briefDesc: json["briefDesc"],
    count: json["count"],
    topicData: List<TopicDatum>.from(json["topicData"].map((x) => TopicDatum.fromJson(x))),
    code: json["code"],
  );

  Map<String, dynamic> toJson() => {
    "introduction": List<dynamic>.from(introduction.map((x) => x.toJson())),
    "briefDesc": briefDesc,
    "count": count,
    "topicData": List<dynamic>.from(topicData.map((x) => x.toJson())),
    "code": code,
  };
}

class Introduction {
  String ti;
  String txt;

  Introduction({
    this.ti,
    this.txt,
  });

  factory Introduction.fromJson(Map<String, dynamic> json) => Introduction(
    ti: json["ti"],
    txt: json["txt"],
  );

  Map<String, dynamic> toJson() => {
    "ti": ti,
    "txt": txt,
  };
}

class TopicDatum {
  Topic topic;
  Creator creator;
  int shareCount;
  int commentCount;
  int likedCount;
  bool liked;
  int rewardCount;
  int rewardMoney;
  dynamic relatedResource;
  String rectanglePicUrl;
  String coverUrl;
  int categoryId;
  String categoryName;
  String url;
  String title;
  String commentThreadId;
  String mainTitle;
  int addTime;
  bool reward;
  String shareContent;
  String wxTitle;
  int seriesId;
  int readCount;
  bool showComment;
  bool showRelated;
  dynamic memo;
  String summary;
  String recmdTitle;
  String recmdContent;
  List<String> tags;
  int id;
  int number;

  TopicDatum({
    this.topic,
    this.creator,
    this.shareCount,
    this.commentCount,
    this.likedCount,
    this.liked,
    this.rewardCount,
    this.rewardMoney,
    this.relatedResource,
    this.rectanglePicUrl,
    this.coverUrl,
    this.categoryId,
    this.categoryName,
    this.url,
    this.title,
    this.commentThreadId,
    this.mainTitle,
    this.addTime,
    this.reward,
    this.shareContent,
    this.wxTitle,
    this.seriesId,
    this.readCount,
    this.showComment,
    this.showRelated,
    this.memo,
    this.summary,
    this.recmdTitle,
    this.recmdContent,
    this.tags,
    this.id,
    this.number,
  });

  factory TopicDatum.fromJson(Map<String, dynamic> json) => TopicDatum(
    topic: Topic.fromJson(json["topic"]),
    creator: Creator.fromJson(json["creator"]),
    shareCount: json["shareCount"],
    commentCount: json["commentCount"],
    likedCount: json["likedCount"],
    liked: json["liked"],
    rewardCount: json["rewardCount"],
    rewardMoney: json["rewardMoney"],
    relatedResource: json["relatedResource"],
    rectanglePicUrl: json["rectanglePicUrl"],
    coverUrl: json["coverUrl"],
    categoryId: json["categoryId"],
    categoryName: json["categoryName"],
    url: json["url"],
    title: json["title"],
    commentThreadId: json["commentThreadId"],
    mainTitle: json["mainTitle"],
    addTime: json["addTime"],
    reward: json["reward"],
    shareContent: json["shareContent"],
    wxTitle: json["wxTitle"],
    seriesId: json["seriesId"],
    readCount: json["readCount"],
    showComment: json["showComment"],
    showRelated: json["showRelated"],
    memo: json["memo"],
    summary: json["summary"],
    recmdTitle: json["recmdTitle"],
    recmdContent: json["recmdContent"],
    tags: List<String>.from(json["tags"].map((x) => x)),
    id: json["id"],
    number: json["number"],
  );

  Map<String, dynamic> toJson() => {
    "topic": topic.toJson(),
    "creator": creator.toJson(),
    "shareCount": shareCount,
    "commentCount": commentCount,
    "likedCount": likedCount,
    "liked": liked,
    "rewardCount": rewardCount,
    "rewardMoney": rewardMoney,
    "relatedResource": relatedResource,
    "rectanglePicUrl": rectanglePicUrl,
    "coverUrl": coverUrl,
    "categoryId": categoryId,
    "categoryName": categoryName,
    "url": url,
    "title": title,
    "commentThreadId": commentThreadId,
    "mainTitle": mainTitle,
    "addTime": addTime,
    "reward": reward,
    "shareContent": shareContent,
    "wxTitle": wxTitle,
    "seriesId": seriesId,
    "readCount": readCount,
    "showComment": showComment,
    "showRelated": showRelated,
    "memo": memo,
    "summary": summary,
    "recmdTitle": recmdTitle,
    "recmdContent": recmdContent,
    "tags": List<dynamic>.from(tags.map((x) => x)),
    "id": id,
    "number": number,
  };
}

class Creator {
  int userId;
  int userType;
  String nickname;
  double avatarImgId;
  String avatarUrl;
  int backgroundImgId;
  String backgroundUrl;
  String signature;
  int createTime;
  String userName;
  int accountType;
  String shortUserName;
  int birthday;
  int authority;
  int gender;
  int accountStatus;
  int province;
  int city;
  int authStatus;
  dynamic description;
  dynamic detailDescription;
  bool defaultAvatar;
  List<String> expertTags;
  Experts experts;
  int djStatus;
  int locationStatus;
  int vipType;
  bool followed;
  bool mutual;
  bool authenticated;
  int lastLoginTime;
  String lastLoginIp;
  dynamic remarkName;
  int viptypeVersion;

  Creator({
    this.userId,
    this.userType,
    this.nickname,
    this.avatarImgId,
    this.avatarUrl,
    this.backgroundImgId,
    this.backgroundUrl,
    this.signature,
    this.createTime,
    this.userName,
    this.accountType,
    this.shortUserName,
    this.birthday,
    this.authority,
    this.gender,
    this.accountStatus,
    this.province,
    this.city,
    this.authStatus,
    this.description,
    this.detailDescription,
    this.defaultAvatar,
    this.expertTags,
    this.experts,
    this.djStatus,
    this.locationStatus,
    this.vipType,
    this.followed,
    this.mutual,
    this.authenticated,
    this.lastLoginTime,
    this.lastLoginIp,
    this.remarkName,
    this.viptypeVersion,
  });

  factory Creator.fromJson(Map<String, dynamic> json) => Creator(
    userId: json["userId"],
    userType: json["userType"],
    nickname: json["nickname"],
    avatarImgId: json["avatarImgId"].toDouble(),
    avatarUrl: json["avatarUrl"],
    backgroundImgId: json["backgroundImgId"],
    backgroundUrl: json["backgroundUrl"],
    signature: json["signature"],
    createTime: json["createTime"],
    userName: json["userName"],
    accountType: json["accountType"],
    shortUserName: json["shortUserName"],
    birthday: json["birthday"],
    authority: json["authority"],
    gender: json["gender"],
    accountStatus: json["accountStatus"],
    province: json["province"],
    city: json["city"],
    authStatus: json["authStatus"],
    description: json["description"],
    detailDescription: json["detailDescription"],
    defaultAvatar: json["defaultAvatar"],
    expertTags: json["expertTags"] == null ? null : List<String>.from(json["expertTags"].map((x) => x)),
    experts: json["experts"] == null ? null : Experts.fromJson(json["experts"]),
    djStatus: json["djStatus"],
    locationStatus: json["locationStatus"],
    vipType: json["vipType"],
    followed: json["followed"],
    mutual: json["mutual"],
    authenticated: json["authenticated"],
    lastLoginTime: json["lastLoginTime"],
    lastLoginIp: json["lastLoginIP"],
    remarkName: json["remarkName"],
    viptypeVersion: json["viptypeVersion"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "userType": userType,
    "nickname": nickname,
    "avatarImgId": avatarImgId,
    "avatarUrl": avatarUrl,
    "backgroundImgId": backgroundImgId,
    "backgroundUrl": backgroundUrl,
    "signature": signature,
    "createTime": createTime,
    "userName": userName,
    "accountType": accountType,
    "shortUserName": shortUserName,
    "birthday": birthday,
    "authority": authority,
    "gender": gender,
    "accountStatus": accountStatus,
    "province": province,
    "city": city,
    "authStatus": authStatus,
    "description": description,
    "detailDescription": detailDescription,
    "defaultAvatar": defaultAvatar,
    "expertTags": expertTags == null ? null : List<dynamic>.from(expertTags.map((x) => x)),
    "experts": experts == null ? null : experts.toJson(),
    "djStatus": djStatus,
    "locationStatus": locationStatus,
    "vipType": vipType,
    "followed": followed,
    "mutual": mutual,
    "authenticated": authenticated,
    "lastLoginTime": lastLoginTime,
    "lastLoginIP": lastLoginIp,
    "remarkName": remarkName,
    "viptypeVersion": viptypeVersion,
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

class Topic {
  int id;
  int addTime;
  String mainTitle;
  String title;
  List<Content> content;
  int userId;
  double cover;
  int headPic;
  String shareContent;
  String wxTitle;
  bool showComment;
  int status;
  int seriesId;
  int pubTime;
  int readCount;
  List<String> tags;
  bool pubImmidiatly;
  String auditor;
  int auditTime;
  int auditStatus;
  String startText;
  String delReason;
  bool showRelated;
  bool fromBackend;
  double rectanglePic;
  int updateTime;
  bool reward;
  String summary;
  dynamic memo;
  String adInfo;
  int categoryId;
  int hotScore;
  String recomdTitle;
  String recomdContent;
  int number;

  Topic({
    this.id,
    this.addTime,
    this.mainTitle,
    this.title,
    this.content,
    this.userId,
    this.cover,
    this.headPic,
    this.shareContent,
    this.wxTitle,
    this.showComment,
    this.status,
    this.seriesId,
    this.pubTime,
    this.readCount,
    this.tags,
    this.pubImmidiatly,
    this.auditor,
    this.auditTime,
    this.auditStatus,
    this.startText,
    this.delReason,
    this.showRelated,
    this.fromBackend,
    this.rectanglePic,
    this.updateTime,
    this.reward,
    this.summary,
    this.memo,
    this.adInfo,
    this.categoryId,
    this.hotScore,
    this.recomdTitle,
    this.recomdContent,
    this.number,
  });

  factory Topic.fromJson(Map<String, dynamic> json) => Topic(
    id: json["id"],
    addTime: json["addTime"],
    mainTitle: json["mainTitle"],
    title: json["title"],
    content: List<Content>.from(json["content"].map((x) => Content.fromJson(x))),
    userId: json["userId"],
    cover: json["cover"].toDouble(),
    headPic: json["headPic"],
    shareContent: json["shareContent"],
    wxTitle: json["wxTitle"],
    showComment: json["showComment"],
    status: json["status"],
    seriesId: json["seriesId"],
    pubTime: json["pubTime"],
    readCount: json["readCount"],
    tags: List<String>.from(json["tags"].map((x) => x)),
    pubImmidiatly: json["pubImmidiatly"],
    auditor: json["auditor"],
    auditTime: json["auditTime"],
    auditStatus: json["auditStatus"],
    startText: json["startText"],
    delReason: json["delReason"],
    showRelated: json["showRelated"],
    fromBackend: json["fromBackend"],
    rectanglePic: json["rectanglePic"].toDouble(),
    updateTime: json["updateTime"],
    reward: json["reward"],
    summary: json["summary"],
    memo: json["memo"],
    adInfo: json["adInfo"],
    categoryId: json["categoryId"],
    hotScore: json["hotScore"],
    recomdTitle: json["recomdTitle"],
    recomdContent: json["recomdContent"],
    number: json["number"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "addTime": addTime,
    "mainTitle": mainTitle,
    "title": title,
    "content": List<dynamic>.from(content.map((x) => x.toJson())),
    "userId": userId,
    "cover": cover,
    "headPic": headPic,
    "shareContent": shareContent,
    "wxTitle": wxTitle,
    "showComment": showComment,
    "status": status,
    "seriesId": seriesId,
    "pubTime": pubTime,
    "readCount": readCount,
    "tags": List<dynamic>.from(tags.map((x) => x)),
    "pubImmidiatly": pubImmidiatly,
    "auditor": auditor,
    "auditTime": auditTime,
    "auditStatus": auditStatus,
    "startText": startText,
    "delReason": delReason,
    "showRelated": showRelated,
    "fromBackend": fromBackend,
    "rectanglePic": rectanglePic,
    "updateTime": updateTime,
    "reward": reward,
    "summary": summary,
    "memo": memo,
    "adInfo": adInfo,
    "categoryId": categoryId,
    "hotScore": hotScore,
    "recomdTitle": recomdTitle,
    "recomdContent": recomdContent,
    "number": number,
  };
}

class Content {
  int type;
  double id;
  String content;

  Content({
    this.type,
    this.id,
    this.content,
  });

  factory Content.fromJson(Map<String, dynamic> json) => Content(
    type: json["type"],
    id: json["id"].toDouble(),
    content: json["content"] == null ? null : json["content"],
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "id": id,
    "content": content == null ? null : content,
  };
}
