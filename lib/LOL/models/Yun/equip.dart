class YEquip {
  List<Data> data;

  YEquip({this.data});

  YEquip.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String equipId;
  String type;
  String name;
  String effect;
  String keywords;
  String formula;
  String imagePath;
  String tFTID;
  String jobId;
  String raceId;
  String proStatus;

  Data(
      {this.equipId,
        this.type,
        this.name,
        this.effect,
        this.keywords,
        this.formula,
        this.imagePath,
        this.tFTID,
        this.jobId,
        this.raceId,
        this.proStatus});

  Data.fromJson(Map<String, dynamic> json) {
    equipId = json['equipId'];
    type = json['type'];
    name = json['name'];
    effect = json['effect'];
    keywords = json['keywords'];
    formula = json['formula'];
    imagePath = json['imagePath'];
    tFTID = json['TFTID'];
    jobId = json['jobId'];
    raceId = json['raceId'];
    proStatus = json['proStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['equipId'] = this.equipId;
    data['type'] = this.type;
    data['name'] = this.name;
    data['effect'] = this.effect;
    data['keywords'] = this.keywords;
    data['formula'] = this.formula;
    data['imagePath'] = this.imagePath;
    data['TFTID'] = this.tFTID;
    data['jobId'] = this.jobId;
    data['raceId'] = this.raceId;
    data['proStatus'] = this.proStatus;
    return data;
  }
}
