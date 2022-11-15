// ignore_for_file: unnecessary_getters_setters

class SliderModel {
  String? _sId;
  String? _image;
  int? _position;
  String? _description;
  bool? _active;
  String? _createdAt;
  String? _updatedAt;
  int? _iV;

  SliderModel(
      {String? sId,
      String? image,
      int? position,
      String? description,
      bool? active,
      String? createdAt,
      String? updatedAt,
      int? iV}) {
    if (sId != null) {
      this._sId = sId;
    }
    if (image != null) {
      this._image = image;
    }
    if (position != null) {
      this._position = position;
    }
    if (description != null) {
      this._description = description;
    }
    if (active != null) {
      this._active = active;
    }
    if (createdAt != null) {
      this._createdAt = createdAt;
    }
    if (updatedAt != null) {
      this._updatedAt = updatedAt;
    }
    if (iV != null) {
      this._iV = iV;
    }
  }

  String? get sId => _sId;
  set sId(String? sId) => _sId = sId;
  String? get image => _image;
  set image(String? image) => _image = image;
  int? get position => _position;
  set position(int? position) => _position = position;
  String? get description => _description;
  set description(String? description) => _description = description;
  bool? get active => _active;
  set active(bool? active) => _active = active;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  String? get updatedAt => _updatedAt;
  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;
  int? get iV => _iV;
  set iV(int? iV) => _iV = iV;

  SliderModel.fromJson(Map<String, dynamic> json) {
    _sId = json['_id'];
    _image = json['image'];
    _position = json['position'];
    _description = json['description'];
    _active = json['active'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this._sId;
    data['image'] = this._image;
    data['position'] = this._position;
    data['description'] = this._description;
    data['active'] = this._active;
    data['createdAt'] = this._createdAt;
    data['updatedAt'] = this._updatedAt;
    data['__v'] = this._iV;
    return data;
  }
}
