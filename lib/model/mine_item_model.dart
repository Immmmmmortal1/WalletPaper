
class MineItemModel {
  String? title;
  String? subTitle;
  String? subImage;
  String? arrowImage;

  MineItemModel({this.title, this.subTitle, this.subImage, this.arrowImage});

  MineItemModel.fromJson(Map<String, dynamic> json) {
    if(json["title"] is String) {
      title = json["title"];
    }
    if(json["subTitle"] is String) {
      subTitle = json["subTitle"];
    }
    if(json["subImage"] is String) {
      subImage = json["subImage"];
    }
    if(json["arrowImage"] is String) {
      arrowImage = json["arrowImage"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["title"] = title;
    _data["subTitle"] = subTitle;
    _data["subImage"] = subImage;
    _data["arrowImage"] = arrowImage;
    return _data;
  }
}