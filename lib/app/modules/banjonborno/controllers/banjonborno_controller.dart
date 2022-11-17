import 'dart:convert';

import 'package:agora_test/src/api_caching/api_cache.dart';
import 'package:agora_test/src/model/study_Model.dart';
import 'package:agora_test/src/model/subcategory.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

import '../../../../src/api/api_url.dart';

class BanjonbornoController extends GetxController {
  var argument = Get.arguments;
  @override
  void onInit() {
    super.onInit();
    SubcategoryModel subcategoryModel = argument[0];
    getBanjonborno(subcategoryModel.sId ?? '');
  }

  final _audioPlayer = AudioPlayer();
  play(String path) async {
    try {
      await _audioPlayer.setUrl(path);
      await _audioPlayer.play();
      await _audioPlayer.setVolume(1.5);
      await _audioPlayer.stop();
    } catch (e) {
      print("Error loading audio source: $e");
    }
  }

  final _dio = Dio();
  final loading2 = false.obs;
  final study = RxList<StudyModel>();
  var selectedImage = ''.obs;

  getBanjonborno(String cId) async {
    try {
      loading2.value = true;
      String localStorage = ApiCaching().getFromLocal(ApiUrl.study + cId);
      if (localStorage != '') {
        List<dynamic> body = jsonDecode(localStorage);
        var list = body.map((e) => StudyModel.fromJson(e));
        study.assignAll(list);
      }
      final response = await _dio.get(ApiUrl.study + cId);
      loading2.value = false;
      if (response.statusCode == 200) {
        ApiCaching().saveToLocal(ApiUrl.study + cId, jsonEncode(response.data));
        List<dynamic> body = response.data;
        var list = body.map((e) => StudyModel.fromJson(e));
        study.assignAll(list);
      }
    } on DioError catch (e) {
      DioError error = e;
      Get.snackbar('Oops', error.response.toString());
    }
  }
}
