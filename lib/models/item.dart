class Item {
  String? type;
  int? id;
  ItemAttributes? attributes;

  Item({this.type, this.id, this.attributes});

  Item.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    id = json['id'];
    attributes = json['attributes'] != null
        ? new ItemAttributes.fromJson(json['attributes'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['id'] = this.id;
    if (this.attributes != null) {
      data['attributes'] = this.attributes!.toJson();
    }
    return data;
  }
}

class ItemAttributes {
  String? fullName;
  String? code;
  String? photo;

  ItemAttributes({this.fullName, this.code, this.photo});

  ItemAttributes.fromJson(Map<String, dynamic> json) {
    fullName = json['full_name'];
    code = json['code'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['full_name'] = this.fullName;
    data['code'] = this.code;
    data['photo'] = this.photo;
    return data;
  }
}