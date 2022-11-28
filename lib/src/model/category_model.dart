// ignore_for_file: unnecessary_getters_setters

class CategoryModel {
  String? _sId;
  String? _title;
  String? _name;
  String? _cover;
  int? _position;
  String? _createdBy;
  int? _iV;

  CategoryModel(
      {String? sId,
      String? title,
      String? name,
      String? cover,
      int? position,
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
    if (position != null) {
      this._position = position;
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
  int? get position => _position;
  set position(int? position) => _position = position;
  String? get createdBy => _createdBy;
  set createdBy(String? createdBy) => _createdBy = createdBy;
  int? get iV => _iV;
  set iV(int? iV) => _iV = iV;

  CategoryModel.fromJson(Map<String, dynamic> json) {
    _sId = json['_id'];
    _title = json['title'];
    _name = json['name'];
    _cover = json['cover'];
    _position = json['position'];
    _createdBy = json['createdBy'];
    _iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this._sId;
    data['title'] = this._title;
    data['name'] = this._name;
    data['cover'] = this._cover;
    data['position'] = this._position;
    data['createdBy'] = this._createdBy;
    data['__v'] = this._iV;
    return data;
  }
}
