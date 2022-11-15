import 'package:get/get.dart';

import '../controllers/grid_controller.dart';

class GridPlaygroundBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GridPlaygroundController>(
      () => GridPlaygroundController(),
    );
  }
}
