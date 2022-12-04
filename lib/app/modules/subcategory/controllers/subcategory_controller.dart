import 'dart:convert';
import 'package:agora_test/app/routes/app_pages.dart';
import 'package:agora_test/src/api/local_cash_controller.dart';
import 'package:agora_test/src/config/ktext.dart';
import 'package:agora_test/src/model/subcategory.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../src/api_caching/api_cache.dart';
import '../../../../src/api/api_url.dart';

class SubcategoryController extends GetxController {
    GlobalKey<ScaffoldState> key = GlobalKey();

  List<AnimationController> controllers = [];

  final _dio = Dio();
  final page = RxInt(1);
  final perPage = RxInt(10);

  final isAddedLoad = RxBool(true);
  final isLoading = RxBool(false);
  final subCategoryT = RxList<SubcategoryModel>();

  ScrollController scrollController = ScrollController();
  var arguments = Get.arguments;
  @override
  void onInit() {
    print(arguments[0]);
    getSubCategory(arguments[0]);
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels == 0) {
        } else {
          loadMoreUserData(arguments[0]);
          print('Bottom');
          // print(perPage.value);
        }
      }
    });
    getMcq();
    getMcqAdvanced();
    super.onInit();
  }

  getSubCategory(String categoryId) async {
    try {
      if (subCategoryT.isEmpty) {
        String localStorage = ApiCaching().getFromLocal(
            'https://admin.babue.me/subcategory/category/$categoryId/?per_page=$perPage&page=${page.value}');
        if (localStorage != '') {
          List<dynamic> body = jsonDecode(localStorage);
          var list = body.map((e) => SubcategoryModel.fromJson(e));
          subCategoryT.assignAll(list);
        }
        final response = await _dio.get(
            'https://admin.babue.me/subcategory/category/$categoryId/?per_page=$perPage&page=${page.value}');

        ApiCaching().saveToLocal(
            '${ApiUrl.category}?per_page=$perPage&page=${page.value}',
            jsonEncode(response.data));
        List<dynamic> body = response.data;
        // print('body');
        var list = body.map((e) => SubcategoryModel.fromJson(e));
        if (response.statusCode == 200) {
          subCategoryT.assignAll(list);
        } // print('body'
      }
    } catch (e) {
      print(e);
    }
  }

  void loadMoreUserData(String categoryId) async {
    try {
      if (isAddedLoad.value == true) {
        isLoading.value = true;
        page.value++;
        final response = await _dio.get(
            'https://admin.babue.me/subcategory/category/$categoryId/?per_page=$perPage&page=${page.value}');

        final List<SubcategoryModel> list = response.data
            .map((json) => SubcategoryModel.fromJson(json))
            .toList()
            .cast<SubcategoryModel>();
        if (list.length > 0) {
          subCategoryT.addAll(list);
          isLoading.value = false;
          scrollController.animateTo(
            scrollController.offset + 750 ,
            duration: Duration(seconds: 1),
            curve: Curves.easeInOut,
          );
        } else {
          print('---No More Data---');
          Get.defaultDialog(
              title: 'Nothing',
              content: KText(
                text: 'There is no data',
                color: Colors.black,
              ));
          isLoading.value = false;
          isAddedLoad.value = false;
        }
      }
    } catch (e) {
      print(e);
      // final snackbar = SnackBar(
      //   backgroundColor: Colors.red,
      //   content: KText(
      //     text: e.toString(),
      //     color: Colors.white,
      //     maxLines: 5,
      //   ),
      // );
      // return ScaffoldMessenger.of(context).showSnackBar(snackbar);
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
      print(jsonEncode(response.data));
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
      print(jsonEncode(response.data));
      ApiCaching().saveToLocal(ApiUrl.advanceMcq, jsonEncode(response.data));
    } catch (e) {
      print(e);
    }
  }

   gotoPage(SubcategoryModel subItem) {
    if (subItem.layout == 'vowel') {
      Get.toNamed(Routes.SORBORNO, arguments: [subItem]);
      return;
    }
    if (subItem.layout == 'consonant') {
      Get.toNamed(Routes.BANJONBORNO, arguments: [subItem]);
      return;
    }
    if (subItem.layout == 'number') {
      Get.toNamed(Routes.NUMBER, arguments: [subItem]);
      return;
    }
    if (subItem.layout == 'grid') {
      Get.toNamed(Routes.GRID, arguments: [subItem]);
      return;
    }
    if (subItem.layout == 'poem') {
      Get.toNamed(Routes.POEM, arguments: [subItem]);
      return;
    }
    if (subItem.layout =='caseStudy') {
      Get.toNamed(Routes.CASESTUDY, arguments: [subItem]);
      return;
    }
    if (subItem.layout =='alphabetic') {
      Get.toNamed(Routes.CAPITALLATTER);
      return;
    }
  }
}
