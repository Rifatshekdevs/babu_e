// ignore_for_file: unnecessary_getters_setters

class SubcategoryModel {
  String? _sId;
  String? _name;
  String? _frontImage;
  String? _backImage;
  String? _membership;
  String? _layout;
  int? _position;
  String? _category;
  String? _createdBy;
  int? _iV;

  SubcategoryModel(
      {String? sId,
      String? name,
      String? frontImage,
      String? backImage,
      String? membership,
      String? layout,
      int? position,
      String? category,
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
    if (position != null) {
      this._position = position;
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
  int? get position => _position;
  set position(int? position) => _position = position;
  String? get category => _category;
  set category(String? category) => _category = category;
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
    _position = json['position'];
    _category = json['category'];
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
    data['position'] = this._position;
    data['category'] = this._category;
    data['createdBy'] = this._createdBy;
    data['__v'] = this._iV;
    return data;
  }
}
