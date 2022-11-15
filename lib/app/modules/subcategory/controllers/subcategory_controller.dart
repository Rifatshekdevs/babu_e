import 'dart:convert';

import 'package:agora_test/src/api/local_cash_controller.dart';
import 'package:agora_test/src/model/subcategory.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../src/api_caching/api_cache.dart';
import '../../../../src/api/api_url.dart';
import '../../../../src/utils/loader.dart';
import '../../banjonborno/controllers/banjonborno_controller.dart';

class SubcategoryController extends GetxController {
   GlobalKey<ScaffoldState> key = GlobalKey();
  List<AnimationController> controllers = [];

  final _dio = Dio();

  var arguments = Get.arguments;
  @override
  void onInit() {
    super.onInit();
    getSubCategory(arguments[0]);
    getMcq();
    getMcqAdvanced();
    Get.put(BanjonbornoController());
  }

  final subCategoryT = RxList<SubcategoryModel>();

  getSubCategory(String categoryId) async {
    try {
      String localStorage =
          ApiCaching().getFromLocal(ApiUrl.subCategory + categoryId);
      if (localStorage != '') {
        List<dynamic> body = jsonDecode(localStorage);
        var list = body.map((e) => SubcategoryModel.fromJson(e));
        subCategoryT.assignAll(list);
      }
      final response = await _dio.get(ApiUrl.subCategory + categoryId);
      mmm('body');
      ApiCaching().saveToLocal(
          ApiUrl.subCategory + categoryId, jsonEncode(response.data));
      List<dynamic> body = response.data;

      var list = body.map((e) => SubcategoryModel.fromJson(e));
      subCategoryT.assignAll(list);
    } catch (e) {
      print(e);
    }
  }

  getMcq() async {
    var token = LocalStorage.getId();

    try {
      final response = await _dio.get(ApiUrl.mcqCheck,
          options: Options(headers: {
            'content-type': 'application/json',
            'authorization': 'Bearer $token',
          }));
      mmm(jsonEncode(response.data));
      ApiCaching().saveToLocal(ApiUrl.mcqCheck, jsonEncode(response.data));
    } catch (e) {
      print(e);
    }
  }

  getMcqAdvanced() async {
    var token = LocalStorage.getId();
    try {
      final response = await _dio.get(ApiUrl.advanceMcq,
          options: Options(headers: {
            'content-type': 'application/json',
            'authorization': 'Bearer $token',
          }));
      mmm(jsonEncode(response.data));
      ApiCaching().saveToLocal(ApiUrl.advanceMcq, jsonEncode(response.data));
    } catch (e) {
      print(e);
    }
  }
}
