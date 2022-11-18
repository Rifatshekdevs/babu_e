import 'dart:convert';

import 'package:agora_test/src/api/api_url.dart';
import 'package:agora_test/src/api_caching/api_cache.dart';
import 'package:agora_test/src/model/study_Model.dart';
import 'package:agora_test/src/model/subcategory.dart';
import 'package:agora_test/src/utils/loader.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class CasestudyController extends GetxController {
var agrument = Get.arguments;
final _dio = Dio();
  final study6 = RxList<StudyModel>();  @override
  
  
  void onInit() {
    super.onInit();
    SubcategoryModel subcategoryModel= agrument[0];
    getCaseStudy(subcategoryModel.sId ?? '');
  }

 getCaseStudy(String cId) async {
    try {
      String localStorage = ApiCaching().getFromLocal(ApiUrl.study + cId);
      mmm(localStorage);
      if (localStorage != '') {
        List<dynamic> body = jsonDecode(localStorage);
        var list = body.map((e) => StudyModel.fromJson(e));
        study6.assignAll(list);
      }
      final response = await _dio.get(ApiUrl.study + cId);
      if (response.statusCode == 200) {
        ApiCaching().saveToLocal(ApiUrl.study + cId, jsonEncode(response.data));
        List<dynamic> body = response.data;
        var list = body.map((e) => StudyModel.fromJson(e));
        study6.assignAll(list);
      }
    } on DioError catch (e) {
      DioError error = e;
      Get.snackbar('Oops', error.response.toString());
    }
  }
}
