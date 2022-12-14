class Category {
  int? id;
  String? name;
  String? photo;
  List<Category>? children;

  Category({this.id, this.name, this.photo, this.children});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    photo = json['photo'];
    if (json['children'] != null) {
      children = <Category>[];
      json['children'].forEach((v) {
        children!.add(Category.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['name'] = this.name;
    data['photo'] = this.photo;
    if (this.children != null) {
      data['children'] = this.children!.map((v) => v.toJson()).toList();
    }
    return data;
  }


}