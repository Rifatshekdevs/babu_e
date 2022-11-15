import 'dart:convert';

import 'package:agora_test/src/api_caching/api_cache.dart';
import 'package:agora_test/src/api/api_url.dart';
import 'package:agora_test/src/model/study_Model.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

class GridPlaygroundController extends GetxController {

  @override
  void onInit() {
    super.onInit();
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
  final study4 = RxList<StudyModel>();

  getGrid(String cId) async {
    study4.clear();
    try {
      String localStorage = ApiCaching().getFromLocal(ApiUrl.study + cId);
      if (localStorage != '') {
        List<dynamic> body = jsonDecode(localStorage);
        var list = body.map((e) => StudyModel.fromJson(e));
        study4.assignAll(list);
      }
      final response = await _dio.get(ApiUrl.study + cId);
      if (response.statusCode == 200) {
        ApiCaching().saveToLocal(ApiUrl.study + cId, jsonEncode(response.data));
        List<dynamic> body = response.data;
        var list = body.map((e) => StudyModel.fromJson(e));
        study4.assignAll(list);
        update();
      }
    } on DioError catch (e) {
      DioError error = e;
      Get.snackbar('Oops', error.response.toString());
    }
    update();
  }
}
