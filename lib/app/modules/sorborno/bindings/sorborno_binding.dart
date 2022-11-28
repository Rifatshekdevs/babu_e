import 'package:get/get.dart';

import '../controllers/sorborno_controller.dart';

class SorbornoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SorbornoController>(
      () => SorbornoController(),
    
    );
  
  }
}
