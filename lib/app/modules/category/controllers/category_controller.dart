import 'dart:convert';

import 'package:agora_test/src/api_caching/api_cache.dart';
import 'package:agora_test/src/api/api_url.dart';
import 'package:agora_test/src/model/category_model.dart';
import 'package:agora_test/src/model/popular_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../src/utils/loader.dart';

class CategoryController extends GetxController {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  final PageController sliderController = PageController(initialPage: 0);
  final _dio = Dio();
  @override
  void onInit() {
    super.onInit();
  getCategory();
  getPopularCategory();
  }

  final category = RxList<CategoryModel>();
  final popularC = RxList<PopularCategory>();

  getCategory() async {
    try {
      String localStorage = ApiCaching().getFromLocal(ApiUrl.category);
      if (localStorage != '') {
        List<dynamic> body = jsonDecode(localStorage);
        var list = body.map((e) => CategoryModel.fromJson(e));
        category.assignAll(list);
      }
      final response = await _dio.get(ApiUrl.category);
      ApiCaching().saveToLocal(ApiUrl.category, jsonEncode(response.data));
      List<dynamic> body = response.data;
      mmm('body L');
      var list = body.map((e) => CategoryModel.fromJson(e));
      category.assignAll(list);
    } catch (e) {
      print(e);
    }
  }
  
  getPopularCategory() async {
    try {
      String localStorage = ApiCaching().getFromLocal(ApiUrl.pcategory);
      if (localStorage != '') {
        List<dynamic> body = jsonDecode(localStorage);
        var list = body.map((e) => PopularCategory.fromJson(e));
        popularC.assignAll(list);
      }
      final response = await _dio.get(ApiUrl.pcategory);
      ApiCaching().saveToLocal(ApiUrl.pcategory, jsonEncode(response.data));
      List<dynamic> body = response.data;
      mmm('body');
      var list = body.map((e) => PopularCategory.fromJson(e));
      popularC.assignAll(list);
    } catch (e) {
      print(e);
    }
  }

  String getDayMessage() {
    DateTime c = DateTime.now();
    int timeOfDay = c.hour;
    // ignore: unused_local_variable
    int min = c.minute;

    if (timeOfDay < 5) {
      return "Good Mid Night";
    } else if (timeOfDay < 6) {
      return "Good Late Night";
    } else if (timeOfDay < 12) {
      return "Good Morning";
    } else if (timeOfDay < 14) {
      return "Good Noon";
    } else if (timeOfDay < 16) {
      return " Good Afternoon";
    } else if (timeOfDay < 21) {
      return "Good Evening";
    } else {
      return "Good Night";
    }
  }

}
