// To parse this JSON data, do
//
//     final videoCommentList = videoCommentListFromJson(jsonString);

import 'dart:convert';

VideoCommentList videoCommentListFromJson(String str) => VideoCommentList.fromJson(json.decode(str));

String videoCommentListToJson(VideoCommentList data) => json.encode(data.toJson());

class VideoCommentList {
  bool isMusician;
  int cnum;
  int userId;
  List<dynamic> topComments;
  bool moreHot;
  List<Comment> hotComments;
  dynamic commentBanner;
  int code;
  List<Comment> comments;
  int total;
  bool more;

  VideoCommentList({
    this.isMusician,
    this.cnum,
    this.userId,
    this.topComments,
    this.moreHot,
    this.hotComments,
    this.commentBanner,
    this.code,
    this.comments,
    this.total,
    this.more,
  });

  factory VideoCommentList.fromJson(Map<String, dynamic> json) => VideoCommentList(
    isMusician: json["isMusician"],
    cnum: json["cnum"],
    userId: json["userId"],
    topComments: List<dynamic>.from(json["topComments"].map((x) => x)),
    moreHot: json["moreHot"],
    hotComments: List<Comment>.from(json["hotComments"].map((x) => Comment.fromJson(x))),
    commentBanner: json["commentBanner"],
    code: json["code"],
    comments: List<Comment>.from(json["comments"].map((x) => Comment.fromJson(x))),
    total: json["total"],
    more: json["more"],
  );

  Map<String, dynamic> toJson() => {
    "isMusician": isMusician,
    "cnum": cnum,
    "userId": userId,
    "topComments": List<dynamic>.from(topComments.map((x) => x)),
    "moreHot": moreHot,
    "hotComments": List<dynamic>.from(hotComments.map((x) => x.toJson())),
    "commentBanner": commentBanner,
    "code": code,
    "comments": List<dynamic>.from(comments.map((x) => x.toJson())),
    "total": total,
    "more": more,
  };
}

class Comment {
  User user;
  List<BeReplied> beReplied;
  PendantData pendantData;
  dynamic showFloorComment;
  int status;
  int commentId;
  String content;
  int time;
  int likedCount;
  dynamic expressionUrl;
  int commentLocationType;
  int parentCommentId;
  Decoration decoration;
  dynamic repliedMark;
  bool liked;

  Comment({
    this.user,
    this.beReplied,
    this.pendantData,
    this.showFloorComment,
    this.status,
    this.commentId,
    this.content,
    this.time,
    this.likedCount,
    this.expressionUrl,
    this.commentLocationType,
    this.parentCommentId,
    this.decoration,
    this.repliedMark,
    this.liked,
  });

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
    user: User.fromJson(json["user"]),
    beReplied: List<BeReplied>.from(json["beReplied"].map((x) => BeReplied.fromJson(x))),
    pendantData: json["pendantData"] == null ? null : PendantData.fromJson(json["pendantData"]),
    showFloorComment: json["showFloorComment"],
    status: json["status"],
    commentId: json["commentId"],
    content: json["content"],
    time: json["time"],
    likedCount: json["likedCount"],
    expressionUrl: json["expressionUrl"],
    commentLocationType: json["commentLocationType"],
    parentCommentId: json["parentCommentId"],
    decoration: Decoration.fromJson(json["decoration"]),
    repliedMark: json["repliedMark"],
    liked: json["liked"],
  );

  Map<String, dynamic> toJson() => {
    "user": user.toJson(),
    "beReplied": List<dynamic>.from(beReplied.map((x) => x.toJson())),
    "pendantData": pendantData == null ? null : pendantData.toJson(),
    "showFloorComment": showFloorComment,
    "status": status,
    "commentId": commentId,
    "content": content,
    "time": time,
    "likedCount": likedCount,
    "expressionUrl": expressionUrl,
    "commentLocationType": commentLocationType,
    "parentCommentId": parentCommentId,
    "decoration": decoration.toJson(),
    "repliedMark": repliedMark,
    "liked": liked,
  };
}

class BeReplied {
  User user;
  int beRepliedCommentId;
  String content;
  int status;
  dynamic expressionUrl;

  BeReplied({
    this.user,
    this.beRepliedCommentId,
    this.content,
    this.status,
    this.expressionUrl,
  });

  factory BeReplied.fromJson(Map<String, dynamic> json) => BeReplied(
    user: User.fromJson(json["user"]),
    beRepliedCommentId: json["beRepliedCommentId"],
    content: json["content"] == null ? null : json["content"],
    status: json["status"],
    expressionUrl: json["expressionUrl"],
  );

  Map<String, dynamic> toJson() => {
    "user": user.toJson(),
    "beRepliedCommentId": beRepliedCommentId,
    "content": content == null ? null : content,
    "status": status,
    "expressionUrl": expressionUrl,
  };
}

class User {
  String locationInfo;
  dynamic liveInfo;
  int anonym;
  VipRights vipRights;
  int userType;
  String nickname;
  dynamic experts;
  String avatarUrl;
  int authStatus;
  int vipType;
  dynamic remarkName;
  dynamic expertTags;
  int userId;

  User({
    this.locationInfo,
    this.liveInfo,
    this.anonym,
    this.vipRights,
    this.userType,
    this.nickname,
    this.experts,
    this.avatarUrl,
    this.authStatus,
    this.vipType,
    this.remarkName,
    this.expertTags,
    this.userId,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    locationInfo: json["locationInfo"] == null ? null : json["locationInfo"],
    liveInfo: json["liveInfo"],
    anonym: json["anonym"],
    vipRights: json["vipRights"] == null ? null : VipRights.fromJson(json["vipRights"]),
    userType: json["userType"],
    nickname: json["nickname"],
    experts: json["experts"],
    avatarUrl: json["avatarUrl"],
    authStatus: json["authStatus"],
    vipType: json["vipType"],
    remarkName: json["remarkName"],
    expertTags: json["expertTags"],
    userId: json["userId"],
  );

  Map<String, dynamic> toJson() => {
    "locationInfo": locationInfo == null ? null : locationInfo,
    "liveInfo": liveInfo,
    "anonym": anonym,
    "vipRights": vipRights == null ? null : vipRights.toJson(),
    "userType": userType,
    "nickname": nickname,
    "experts": experts,
    "avatarUrl": avatarUrl,
    "authStatus": authStatus,
    "vipType": vipType,
    "remarkName": remarkName,
    "expertTags": expertTags,
    "userId": userId,
  };
}

class VipRights {
  Associator associator;
  Associator musicPackage;
  int redVipAnnualCount;

  VipRights({
    this.associator,
    this.musicPackage,
    this.redVipAnnualCount,
  });

  factory VipRights.fromJson(Map<String, dynamic> json) => VipRights(
    associator: json["associator"] == null ? null : Associator.fromJson(json["associator"]),
    musicPackage: json["musicPackage"] == null ? null : Associator.fromJson(json["musicPackage"]),
    redVipAnnualCount: json["redVipAnnualCount"],
  );

  Map<String, dynamic> toJson() => {
    "associator": associator == null ? null : associator.toJson(),
    "musicPackage": musicPackage == null ? null : musicPackage.toJson(),
    "redVipAnnualCount": redVipAnnualCount,
  };
}

class Associator {
  int vipCode;
  bool rights;

  Associator({
    this.vipCode,
    this.rights,
  });

  factory Associator.fromJson(Map<String, dynamic> json) => Associator(
    vipCode: json["vipCode"],
    rights: json["rights"],
  );

  Map<String, dynamic> toJson() => {
    "vipCode": vipCode,
    "rights": rights,
  };
}

class Decoration {
  Decoration();

  factory Decoration.fromJson(Map<String, dynamic> json) => Decoration(
  );

  Map<String, dynamic> toJson() => {
  };
}

class PendantData {
  int id;
  String imageUrl;

  PendantData({
    this.id,
    this.imageUrl,
  });

  factory PendantData.fromJson(Map<String, dynamic> json) => PendantData(
    id: json["id"],
    imageUrl: json["imageUrl"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "imageUrl": imageUrl,
  };
}
