import 'dart:convert';
import 'package:agora_test/src/api_caching/api_cache.dart';
import 'package:agora_test/src/api/api_url.dart';
import 'package:agora_test/src/model/study_Model.dart';
import 'package:get/get.dart';

class Latters {
  List<CapitalLetter> capitalLetter = [];
  final latterList = <StudyModel>[];
  initialize(String cId) {
    String response = ApiCaching().getFromLocal(ApiUrl.study+cId);
    if (response == '') {
      Get.snackbar('Error', 'No data found');
      return;
    }
    List<dynamic> body = jsonDecode(response);
    var list = body.map((e) => StudyModel.fromJson(e));
    latterList.assignAll(list);
    List<CapitalLetter> _capitalLatter = [];
    for (int i = 0; i <latterList.length; i++) {
      List<String> l = [];

      l.add(latterList[i].image);

      CapitalLetter ie = CapitalLetter(i, latterList[i]);
      ie.initialize();
      _capitalLatter.add(ie);
    }
    _capitalLatter.shuffle();
    capitalLetter = _capitalLatter;
  }
}

class CapitalLetter {
  int index;
  StudyModel studyModel;
  CapitalLetter(this.index, this.studyModel,);
  String get image => studyModel.image;
  String get sound => '';

  initialize() {
    List l = [];
    if (studyModel.image != null) {
      l.add(studyModel.image);
  }
}
}
// List words = [
//   "Lili",
//   "Lotus",
//   "Rose",
//   "Sunflower",
// ];
