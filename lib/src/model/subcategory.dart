// ignore_for_file: unnecessary_getters_setters

class SubcategoryModel {
  String? _sId;
  String? _name;
  String? _frontImage;
  String? _backImage;
  String? _membership;
  String? _layout;
  Category? _category;
  String? _createdBy;
  int? _iV;

  SubcategoryModel(
      {String? sId,
      String? name,
      String? frontImage,
      String? backImage,
      String? membership,
      String? layout,
      Category? category,
      String? createdBy,
      int? iV}) {
    if (sId != null) {
      this._sId = sId;
    }
    if (name != null) {
      this._name = name;
    }
    if (frontImage != null) {
      this._frontImage = frontImage;
    }
    if (backImage != null) {
      this._backImage = backImage;
    }
    if (membership != null) {
      this._membership = membership;
    }
    if (layout != null) {
      this._layout = layout;
    }
    if (category != null) {
      this._category = category;
    }
    if (createdBy != null) {
      this._createdBy = createdBy;
    }
    if (iV != null) {
      this._iV = iV;
    }
  }

  String? get sId => _sId;
  set sId(String? sId) => _sId = sId;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get frontImage => _frontImage;
  set frontImage(String? frontImage) => _frontImage = frontImage;
  String? get backImage => _backImage;
  set backImage(String? backImage) => _backImage = backImage;
  String? get membership => _membership;
  set membership(String? membership) => _membership = membership;
  String? get layout => _layout;
  set layout(String? layout) => _layout = layout;
  Category? get category => _category;
  set category(Category? category) => _category = category;
  String? get createdBy => _createdBy;
  set createdBy(String? createdBy) => _createdBy = createdBy;
  int? get iV => _iV;
  set iV(int? iV) => _iV = iV;

  SubcategoryModel.fromJson(Map<String, dynamic> json) {
    _sId = json['_id'];
    _name = json['name'];
    _frontImage = json['frontImage'];
    _backImage = json['backImage'];
    _membership = json['membership'];
    _layout = json['layout'];
    _category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    _createdBy = json['createdBy'];
    _iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this._sId;
    data['name'] = this._name;
    data['frontImage'] = this._frontImage;
    data['backImage'] = this._backImage;
    data['membership'] = this._membership;
    data['layout'] = this._layout;
    if (this._category != null) {
      data['category'] = this._category!.toJson();
    }
    data['createdBy'] = this._createdBy;
    data['__v'] = this._iV;
    return data;
  }
}

class Category {
  String? _sId;
  String? _title;
  String? _name;
  String? _cover;
  String? _createdBy;
  int? _iV;

  Category(
      {String? sId,
      String? title,
      String? name,
      String? cover,
      String? createdBy,
      int? iV}) {
    if (sId != null) {
      this._sId = sId;
    }
    if (title != null) {
      this._title = title;
    }
    if (name != null) {
      this._name = name;
    }
    if (cover != null) {
      this._cover = cover;
    }
    if (createdBy != null) {
      this._createdBy = createdBy;
    }
    if (iV != null) {
      this._iV = iV;
    }
  }

  String? get sId => _sId;
  set sId(String? sId) => _sId = sId;
  String? get title => _title;
  set title(String? title) => _title = title;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get cover => _cover;
  set cover(String? cover) => _cover = cover;
  String? get createdBy => _createdBy;
  set createdBy(String? createdBy) => _createdBy = createdBy;
  int? get iV => _iV;
  set iV(int? iV) => _iV = iV;

  Category.fromJson(Map<String, dynamic> json) {
    _sId = json['_id'];
    _title = json['title'];
    _name = json['name'];
    _cover = json['cover'];
    _createdBy = json['createdBy'];
    _iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this._sId;
    data['title'] = this._title;
    data['name'] = this._name;
    data['cover'] = this._cover;
    data['createdBy'] = this._createdBy;
    data['__v'] = this._iV;
    return data;
  }
}
