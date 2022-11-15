// ignore_for_file: unnecessary_getters_setters

class McqModel {
  String? _sId;
  String? _option1;
  String? _option2;
  String? _option3;
  String? _option4;
  String? _image;
  String? _name;
  String? _subcategory;
  int? _level;
  String? _createdAt;
  String? _updatedAt;
  int? _iV;
  McqModel(
      {String? sId,
      String? option1,
      String? option2,
      String? option3,
      String? option4,
      String? image,
      String? name,
      String? subcategory,
      int? level,
      String? createdAt,
      String? updatedAt,
      int? iV}) {
    if (sId != null) {
      this._sId = sId;
    }
    if (option1 != null) {
      this._option1 = option1;
    }
    if (option2 != null) {
      this._option2 = option2;
    }
    if (option3 != null) {
      this._option3 = option3;
    }
    if (option4 != null) {
      this._option4 = option4;
    }
    if (image != null) {
      this._image = image;
    }
    if (name != null) {
      this._name = name;
    }
    if (subcategory != null) {
      this._subcategory = subcategory;
    }
    if (level != null) {
      this._level = level;
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
  String? get option1 => _option1;
  set option1(String? option1) => _option1 = option1;
  String? get option2 => _option2;
  set option2(String? option2) => _option2 = option2;
  String? get option3 => _option3;
  set option3(String? option3) => _option3 = option3;
  String? get option4 => _option4;
  set option4(String? option4) => _option4 = option4;
  String? get image => _image;
  set image(String? image) => _image = image;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get subcategory => _subcategory;
  set subcategory(String? subcategory) => _subcategory = subcategory;
  int? get level => _level;
  set level(int? level) => _level = level;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  String? get updatedAt => _updatedAt;
  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;
  int? get iV => _iV;
  set iV(int? iV) => _iV = iV;

  McqModel.fromJson(Map<String, dynamic> json) {
    _sId = json['_id'];
    _option1 = json['option1'];
    _option2 = json['option2'];
    _option3 = json['option3'];
    _option4 = json['option4'];
    _image = json['image'];
    _name = json['name'];
    _subcategory = json['subcategory'];
    _level = json['level'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this._sId;
    data['option1'] = this._option1;
    data['option2'] = this._option2;
    data['option3'] = this._option3;
    data['option4'] = this._option4;
    data['image'] = this._image;
    data['name'] = this._name;
    data['subcategory'] = this._subcategory;
    data['level'] = this._level;
    data['createdAt'] = this._createdAt;
    data['updatedAt'] = this._updatedAt;
    data['__v'] = this._iV;
    return data;
  }
}
