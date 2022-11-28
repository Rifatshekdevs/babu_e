import 'dart:convert';

import 'package:agora_test/src/api_caching/api_cache.dart';
import 'package:agora_test/src/api/api_url.dart';
import 'package:agora_test/src/model/study_Model.dart';
import 'package:agora_test/src/model/subcategory.dart';
import 'package:agora_test/src/utils/loader.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

class SorbornoController extends GetxController {
  final dio = Dio();
  final study2 = RxList<StudyModel>();
  final selectedborno = Rxn<Widget>();
  final _audioPlayer = AudioPlayer();

  var argument = Get.arguments;
  @override
  void onInit() {
    super.onInit();
    SubcategoryModel subcategoryModel = argument[0];
    getSorborno(subcategoryModel.sId ?? '');
  }

  // time(){
  //   timer = Timer.periodic(Duration(milliseconds: 100), (Timer t) {
  //     print('hi!!!!!!!!!!');
  //     runner(road);
  //     update();
  //   });
  // }

  @override
  void onClose() {
    // timer.cancle();
    _audioPlayer.dispose();
    super.onClose();
  }

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

  getSorborno(String cId) async {
    try {
      String localStorage = ApiCaching().getFromLocal(ApiUrl.study + cId);
      mmm(localStorage);
      if (localStorage != '') {
        List<dynamic> body = jsonDecode(localStorage);
        var list = body.map((e) => StudyModel.fromJson(e));
        study2.assignAll(list);
      }
      final response = await dio.get(ApiUrl.study + cId);
      if (response.statusCode == 200) {
        ApiCaching().saveToLocal(ApiUrl.study + cId, jsonEncode(response.data));
        List<dynamic> body = response.data;
        var list = body.map((e) => StudyModel.fromJson(e));
        study2.assignAll(list);
      }
    } on DioError catch (e) {
      DioError error = e;
      Get.snackbar('Oops', error.response.toString());
    }
  }
}

