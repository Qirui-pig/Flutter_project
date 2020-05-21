// To parse this JSON data, do
//
//     final homeBanner = homeBannerFromJson(jsonString);

import 'dart:convert';

HomeBanner homeBannerFromJson(String str) => HomeBanner.fromJson(json.decode(str));

String homeBannerToJson(HomeBanner data) => json.encode(data.toJson());

class HomeBanner {
  List<Banner> banners;
  int code;

  HomeBanner({
    this.banners,
    this.code,
  });

  factory HomeBanner.fromJson(Map<String, dynamic> json) => HomeBanner(
    banners: List<Banner>.from(json["banners"].map((x) => Banner.fromJson(x))),
    code: json["code"],
  );

  Map<String, dynamic> toJson() => {
    "banners": List<dynamic>.from(banners.map((x) => x.toJson())),
    "code": code,
  };
}

class Banner {
  String pic;
  int targetId;
  dynamic adid;
  int targetType;
  String titleColor;
  String typeTitle;
  String url;
  dynamic adurlV2;
  bool exclusive;
  dynamic monitorImpress;
  dynamic monitorClick;
  dynamic monitorType;
  List<dynamic> monitorImpressList;
  List<dynamic> monitorClickList;
  dynamic monitorBlackList;
  dynamic extMonitor;
  dynamic extMonitorInfo;
  dynamic adSource;
  dynamic adLocation;
  String encodeId;
  dynamic program;
  dynamic event;
  dynamic video;
  dynamic dynamicVideoData;
  Song song;
  String bannerId;
  dynamic alg;
  String scm;
  String requestId;
  bool showAdTag;
  dynamic pid;
  dynamic showContext;
  dynamic adDispatchJson;

  Banner({
    this.pic,
    this.targetId,
    this.adid,
    this.targetType,
    this.titleColor,
    this.typeTitle,
    this.url,
    this.adurlV2,
    this.exclusive,
    this.monitorImpress,
    this.monitorClick,
    this.monitorType,
    this.monitorImpressList,
    this.monitorClickList,
    this.monitorBlackList,
    this.extMonitor,
    this.extMonitorInfo,
    this.adSource,
    this.adLocation,
    this.encodeId,
    this.program,
    this.event,
    this.video,
    this.dynamicVideoData,
    this.song,
    this.bannerId,
    this.alg,
    this.scm,
    this.requestId,
    this.showAdTag,
    this.pid,
    this.showContext,
    this.adDispatchJson,
  });

  factory Banner.fromJson(Map<String, dynamic> json) => Banner(
    pic: json["pic"],
    targetId: json["targetId"],
    adid: json["adid"],
    targetType: json["targetType"],
    titleColor: json["titleColor"],
    typeTitle: json["typeTitle"],
    url: json["url"] == null ? null : json["url"],
    adurlV2: json["adurlV2"],
    exclusive: json["exclusive"],
    monitorImpress: json["monitorImpress"],
    monitorClick: json["monitorClick"],
    monitorType: json["monitorType"],
    monitorImpressList: List<dynamic>.from(json["monitorImpressList"].map((x) => x)),
    monitorClickList: List<dynamic>.from(json["monitorClickList"].map((x) => x)),
    monitorBlackList: json["monitorBlackList"],
    extMonitor: json["extMonitor"],
    extMonitorInfo: json["extMonitorInfo"],
    adSource: json["adSource"],
    adLocation: json["adLocation"],
    encodeId: json["encodeId"],
    program: json["program"],
    event: json["event"],
    video: json["video"],
    dynamicVideoData: json["dynamicVideoData"],
    song: json["song"] == null ? null : Song.fromJson(json["song"]),
    bannerId: json["bannerId"],
    alg: json["alg"],
    scm: json["scm"],
    requestId: json["requestId"],
    showAdTag: json["showAdTag"],
    pid: json["pid"],
    showContext: json["showContext"],
    adDispatchJson: json["adDispatchJson"],
  );

  Map<String, dynamic> toJson() => {
    "pic": pic,
    "targetId": targetId,
    "adid": adid,
    "targetType": targetType,
    "titleColor": titleColor,
    "typeTitle": typeTitle,
    "url": url == null ? null : url,
    "adurlV2": adurlV2,
    "exclusive": exclusive,
    "monitorImpress": monitorImpress,
    "monitorClick": monitorClick,
    "monitorType": monitorType,
    "monitorImpressList": List<dynamic>.from(monitorImpressList.map((x) => x)),
    "monitorClickList": List<dynamic>.from(monitorClickList.map((x) => x)),
    "monitorBlackList": monitorBlackList,
    "extMonitor": extMonitor,
    "extMonitorInfo": extMonitorInfo,
    "adSource": adSource,
    "adLocation": adLocation,
    "encodeId": encodeId,
    "program": program,
    "event": event,
    "video": video,
    "dynamicVideoData": dynamicVideoData,
    "song": song == null ? null : song.toJson(),
    "bannerId": bannerId,
    "alg": alg,
    "scm": scm,
    "requestId": requestId,
    "showAdTag": showAdTag,
    "pid": pid,
    "showContext": showContext,
    "adDispatchJson": adDispatchJson,
  };
}

class Song {
  String name;
  int id;
  int pst;
  int t;
  List<Ar> ar;
  List<String> alia;
  int pop;
  int st;
  String rt;
  int fee;
  int v;
  dynamic crbt;
  String cf;
  Al al;
  int dt;
  H h;
  H m;
  H l;
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
  int rtype;
  dynamic rurl;
  int mst;
  int cp;
  int mv;
  int publishTime;
  Privilege privilege;

  Song({
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
    this.rtype,
    this.rurl,
    this.mst,
    this.cp,
    this.mv,
    this.publishTime,
    this.privilege,
  });

  factory Song.fromJson(Map<String, dynamic> json) => Song(
    name: json["name"],
    id: json["id"],
    pst: json["pst"],
    t: json["t"],
    ar: List<Ar>.from(json["ar"].map((x) => Ar.fromJson(x))),
    alia: List<String>.from(json["alia"].map((x) => x)),
    pop: json["pop"],
    st: json["st"],
    rt: json["rt"],
    fee: json["fee"],
    v: json["v"],
    crbt: json["crbt"],
    cf: json["cf"],
    al: Al.fromJson(json["al"]),
    dt: json["dt"],
    h: H.fromJson(json["h"]),
    m: H.fromJson(json["m"]),
    l: H.fromJson(json["l"]),
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
    rtype: json["rtype"],
    rurl: json["rurl"],
    mst: json["mst"],
    cp: json["cp"],
    mv: json["mv"],
    publishTime: json["publishTime"],
    privilege: Privilege.fromJson(json["privilege"]),
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
    "rt": rt,
    "fee": fee,
    "v": v,
    "crbt": crbt,
    "cf": cf,
    "al": al.toJson(),
    "dt": dt,
    "h": h.toJson(),
    "m": m.toJson(),
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
    "rtype": rtype,
    "rurl": rurl,
    "mst": mst,
    "cp": cp,
    "mv": mv,
    "publishTime": publishTime,
    "privilege": privilege.toJson(),
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
    picStr: json["pic_str"],
    pic: json["pic"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "picUrl": picUrl,
    "tns": List<dynamic>.from(tns.map((x) => x)),
    "pic_str": picStr,
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

class H {
  int br;
  int fid;
  int size;
  int vd;

  H({
    this.br,
    this.fid,
    this.size,
    this.vd,
  });

  factory H.fromJson(Map<String, dynamic> json) => H(
    br: json["br"],
    fid: json["fid"],
    size: json["size"],
    vd: json["vd"],
  );

  Map<String, dynamic> toJson() => {
    "br": br,
    "fid": fid,
    "size": size,
    "vd": vd,
  };
}

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
  };
}
