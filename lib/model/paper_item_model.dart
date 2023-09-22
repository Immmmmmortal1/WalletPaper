
class PaperItemModel {
  String? id;
  String? classId;
  String? resolution;
  String? urlMobile;
  String? url;
  String? urlThumb;
  String? urlMid;
  String? downloadTimes;
  String? imgcut;
  String? tag;
  String? createTime;
  String? updateTime;
  String? adId;
  String? adImg;
  String? adPos;
  String? adUrl;
  String? ext1;
  String? ext2;
  String? utag;
  String? tempdata;
  List<dynamic>? rdata;
  String? img1600900;
  String? img1440900;
  String? img1366768;
  String? img1280800;
  String? img12801024;
  String? img1024768;

  PaperItemModel({this.id, this.classId, this.resolution, this.urlMobile, this.url, this.urlThumb, this.urlMid, this.downloadTimes, this.imgcut, this.tag, this.createTime, this.updateTime, this.adId, this.adImg, this.adPos, this.adUrl, this.ext1, this.ext2, this.utag, this.tempdata, this.rdata, this.img1600900, this.img1440900, this.img1366768, this.img1280800, this.img12801024, this.img1024768});

  PaperItemModel.fromJson(Map<String, dynamic> json) {
    if(json["id"] is String) {
      id = json["id"];
    }
    if(json["class_id"] is String) {
      classId = json["class_id"];
    }
    if(json["resolution"] is String) {
      resolution = json["resolution"];
    }
    if(json["url_mobile"] is String) {
      urlMobile = json["url_mobile"];
    }
    if(json["url"] is String) {
      url = json["url"];
    }
    if(json["url_thumb"] is String) {
      urlThumb = json["url_thumb"];
    }
    if(json["url_mid"] is String) {
      urlMid = json["url_mid"];
    }
    if(json["download_times"] is String) {
      downloadTimes = json["download_times"];
    }
    if(json["imgcut"] is String) {
      imgcut = json["imgcut"];
    }
    if(json["tag"] is String) {
      tag = json["tag"];
    }
    if(json["create_time"] is String) {
      createTime = json["create_time"];
    }
    if(json["update_time"] is String) {
      updateTime = json["update_time"];
    }
    if(json["ad_id"] is String) {
      adId = json["ad_id"];
    }
    if(json["ad_img"] is String) {
      adImg = json["ad_img"];
    }
    if(json["ad_pos"] is String) {
      adPos = json["ad_pos"];
    }
    if(json["ad_url"] is String) {
      adUrl = json["ad_url"];
    }
    if(json["ext_1"] is String) {
      ext1 = json["ext_1"];
    }
    if(json["ext_2"] is String) {
      ext2 = json["ext_2"];
    }
    if(json["utag"] is String) {
      utag = json["utag"];
    }
    if(json["tempdata"] is String) {
      tempdata = json["tempdata"];
    }
    if(json["rdata"] is List) {
      rdata = json["rdata"] ?? [];
    }
    if(json["img_1600_900"] is String) {
      img1600900 = json["img_1600_900"];
    }
    if(json["img_1440_900"] is String) {
      img1440900 = json["img_1440_900"];
    }
    if(json["img_1366_768"] is String) {
      img1366768 = json["img_1366_768"];
    }
    if(json["img_1280_800"] is String) {
      img1280800 = json["img_1280_800"];
    }
    if(json["img_1280_1024"] is String) {
      img12801024 = json["img_1280_1024"];
    }
    if(json["img_1024_768"] is String) {
      img1024768 = json["img_1024_768"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["class_id"] = classId;
    _data["resolution"] = resolution;
    _data["url_mobile"] = urlMobile;
    _data["url"] = url;
    _data["url_thumb"] = urlThumb;
    _data["url_mid"] = urlMid;
    _data["download_times"] = downloadTimes;
    _data["imgcut"] = imgcut;
    _data["tag"] = tag;
    _data["create_time"] = createTime;
    _data["update_time"] = updateTime;
    _data["ad_id"] = adId;
    _data["ad_img"] = adImg;
    _data["ad_pos"] = adPos;
    _data["ad_url"] = adUrl;
    _data["ext_1"] = ext1;
    _data["ext_2"] = ext2;
    _data["utag"] = utag;
    _data["tempdata"] = tempdata;
    if(rdata != null) {
      _data["rdata"] = rdata;
    }
    _data["img_1600_900"] = img1600900;
    _data["img_1440_900"] = img1440900;
    _data["img_1366_768"] = img1366768;
    _data["img_1280_800"] = img1280800;
    _data["img_1280_1024"] = img12801024;
    _data["img_1024_768"] = img1024768;
    return _data;
  }
}