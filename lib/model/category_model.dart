
class CategoryModel {
  String? id;
  String? name;
  String? orderNum;
  String? tag;
  String? createTime;

  CategoryModel({this.id, this.name, this.orderNum, this.tag, this.createTime});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    if(json["id"] is String) {
      id = json["id"];
    }
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["order_num"] is String) {
      orderNum = json["order_num"];
    }
    if(json["tag"] is String) {
      tag = json["tag"];
    }
    if(json["create_time"] is String) {
      createTime = json["create_time"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["order_num"] = orderNum;
    _data["tag"] = tag;
    _data["create_time"] = createTime;
    return _data;
  }
}