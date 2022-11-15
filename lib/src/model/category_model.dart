class CategoryModel {
  String? sId;
  String? title;
  String? name;
  String? cover;
  String? createdBy;
  int? iV;

  CategoryModel(
      {this.sId, this.title, this.name, this.cover, this.createdBy, this.iV});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    name = json['name'];
    cover = json['cover'];
    createdBy = json['createdBy'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['name'] = this.name;
    data['cover'] = this.cover;
    data['createdBy'] = this.createdBy;
    data['__v'] = this.iV;
    return data;
  }
}
