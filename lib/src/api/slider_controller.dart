import 'package:agora_test/src/api/api_url.dart';
import 'package:agora_test/src/model/slider_model.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class SliderController extends GetxController {

  
  final _dio = Dio();
    final sliderList = <SliderModel>[].obs;

     int current = 0;
  getSlider() async {
    try {
      final response = await _dio.get(ApiUrl.slider);
      List<dynamic> body = response.data;
      var list = body.map((e) => SliderModel.fromJson(e));
      sliderList.assignAll(list);
    } catch (e) {
      print(e);
  }
  }
}
