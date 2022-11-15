import 'package:agora_test/src/api/api_url.dart';
import 'package:agora_test/src/model/study_Model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
 
class StudyController extends GetxController {

  
  final selectedBorno = Rxn<Widget>();
  final selectedValue = Rxn<Widget>();
  final presentWidget = Rxn<Widget>();
  final _dio = Dio();
  final loading2 = false.obs;

  final study = RxList<StudyModel>();

  getStudy(String cId, ) async {
    print(cId);
    try {
      loading2.value = true;
      final response = await _dio.get(ApiUrl.study + cId);
      List<dynamic> body = response.data;
      var list = body.map((e) => StudyModel.fromJson(e));
      study.assignAll(list);
      print(list);
    } catch (e) {
      print(e);
    } finally{
      loading2.value = false;
    }
  }
}
