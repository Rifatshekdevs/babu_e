import 'dart:developer';
import 'package:agora_test/app/routes/app_pages.dart';
import 'package:agora_test/src/config/ktext.dart';
import 'package:agora_test/src/api/api_url.dart';
import 'package:agora_test/src/api/local_cash_controller.dart';
import 'package:agora_test/src/utils/loader.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart' as diox;

class AuthController extends GetxController {
  final dio = Dio();
  RxBool isMaleSelected = true.obs;

  final name = RxString('');
  final email = RxString('');
  final phone = RxString('');
  final guardian = RxString('');
  final dateOfBirth = RxString('');
  final password = RxString('');
  final image = Rxn<XFile>();

  final emailT = RxString('');
  final pass = RxString('');

  registation() async {
    String fileName = image.value!.path.split('/').last;

    diox.FormData data = diox.FormData.fromMap({
      "image": await diox.MultipartFile.fromFile(image.value!.path,
          filename: fileName, contentType: new MediaType("image", "jpeg")),
      'name': name.value,
      'email': email.value,
      'phone': phone.value,
      'gender': isMaleSelected.value ? 'male' : 'female',
      'guardian': guardian.value,
      'dateOfBirth': dateOfBirth.value,
      'password': password.value,
    });

    try {
      log('ff');
      var response = await dio.post(
        ApiUrl.signUp,
        data: data,
      );

      if (response.statusCode == 201) {
        print(response.data.toString());
        Get.snackbar('successfully', 'register');
        
         Get.offAllNamed(Routes.CATEGORY);
      }
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        DioError error = e;
        String errorMessage = error.response?.data['message'] ?? '';
        if (errorMessage != '') {
          Get.snackbar('Oops', errorMessage);
        }

        log('6');
        return;
      }
      if (e.type == DioErrorType.connectTimeout) {
        print('check your connection');
        return;
      }

      if (e.type == DioErrorType.receiveTimeout) {
        print('unable to connect to the server');
        return;
      }

      if (e.type == DioErrorType.other) {
        print('Something went wrong');
        return;
      }
    }
    // update();
  }

  login(BuildContext context) async {
    try {
      loadinGDialog();
      final res = await dio.post(ApiUrl.login, data: {
        'emailOrPhone': kDebugMode ? "shrikajol@gmail.com" : emailT.value,
        'password': kDebugMode ? "1122" : pass.value,
      });
      closeloadingWidget();
      if (res.statusCode == 200) {
        print(res.data);
        // Get.snackbar(
        //   'Success',
        //   'Login Success',
        //   backgroundColor: Colors.red,
        //   colorText: Colors.white,
        // );

        print(res.data);
        print('User login success');
        LocalStorage.isLoginSuccess(isLoogedIn: true);
        LocalStorage.saveId(id: res.data['token']);

        Get.offAllNamed(Routes.CATEGORY);
        // Get.put(HomeController());

        // return res.data;
      } else {
        Get.snackbar('Failed', 'Failed to login');
      }
    } catch (e) {
      closeloadingWidget();
      print(e.toString());
      final snackbar = SnackBar(
        backgroundColor: Colors.red,
        content: KText(
          text: 'Please give correct email and password',
          color: Colors.white,
          maxLines: 5,
        ),
      );
      return ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }
  }
}
