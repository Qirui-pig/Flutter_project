// To parse this JSON data, do
//
//     final artSongs = artSongsFromJson(jsonString);

import 'dart:convert';

ArtSongs artSongsFromJson(String str) => ArtSongs.fromJson(json.decode(str));

String artSongsToJson(ArtSongs data) => json.encode(data.toJson());

class ArtSongs {
  int code;
  bool more;
  List<Song> songs;

  ArtSongs({
    this.code,
    this.more,
    this.songs,
  });

  factory ArtSongs.fromJson(Map<String, dynamic> json) => ArtSongs(
    code: json["code"],
    more: json["more"],
    songs: List<Song>.from(json["songs"].map((x) => Song.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "more": more,
    "songs": List<dynamic>.from(songs.map((x) => x.toJson())),
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
  int mv;
  dynamic rurl;
  int mst;
  int cp;
  int rtype;
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
    this.mv,
    this.rurl,
    this.mst,
    this.cp,
    this.rtype,
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
    rt: json["rt"] == null ? null : json["rt"],
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
    mv: json["mv"],
    rurl: json["rurl"],
    mst: json["mst"],
    cp: json["cp"],
    rtype: json["rtype"],
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
    "rt": rt == null ? null : rt,
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
    "mv": mv,
    "rurl": rurl,
    "mst": mst,
    "cp": cp,
    "rtype": rtype,
    "publishTime": publishTime,
    "privilege": privilege.toJson(),
  };
}

class Al {
  int id;
  String name;
  String picUrl;
  List<String> tns;
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
    tns: List<String>.from(json["tns"].map((x) => x)),
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
