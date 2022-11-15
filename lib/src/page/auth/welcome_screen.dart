import 'dart:convert';
import 'package:agora_test/src/config/constants.dart';
import 'package:agora_test/src/api/api_url.dart';
import 'package:agora_test/src/page/auth/auth_page.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../api_caching/api_cache.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    getData();
    super.initState();

    _navigatetowelcomePage();
  }

  final _dio = Dio();
  getData() async {
    final response = await _dio.get(ApiUrl.category);
    ApiCaching().saveToLocal(ApiUrl.category, jsonEncode(response.data));
  }

  _navigatetowelcomePage() async {
    await Future.delayed(Duration(seconds: 2), () {
      Get.to(AuthPage());
    });
  }

  @override
  Widget build(BuildContext context) {
    int flex1 = 1;
    int flex2 = 2;
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Image.asset(
          "assets/images/welcome.png",
          height: size.height,
          width: size.width,
          fit: BoxFit.fill,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Spacer(
                flex: flex1,
              ),
              Center(
                child: SizedBox(
                  height: respectiveHeight(size, 130),
                  child: Lottie.asset("assets/logo/logo.json"),
                ),
              ),
              Spacer(
                flex: flex2,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
