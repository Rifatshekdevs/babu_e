import 'package:get/get.dart';

import '../controllers/poem_controller.dart';

class PoemBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PoemController>(
      () => PoemController(),
    );
  }
}
