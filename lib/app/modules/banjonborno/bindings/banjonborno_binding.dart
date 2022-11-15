import 'package:get/get.dart';

import '../controllers/banjonborno_controller.dart';

class BanjonbornoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BanjonbornoController>(
      () => BanjonbornoController(),
    );
  }
}
