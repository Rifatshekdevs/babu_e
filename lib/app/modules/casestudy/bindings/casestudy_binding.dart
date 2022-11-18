import 'package:get/get.dart';

import '../controllers/casestudy_controller.dart';

class CasestudyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CasestudyController>(
      () => CasestudyController(),
    );
  }
}
