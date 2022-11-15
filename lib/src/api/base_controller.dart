
import 'package:agora_test/src/api/auth_controller.dart';
import 'package:get/get.dart';

import '../../app/modules/category/controllers/category_controller.dart';

class BaseController {
  var categoryC = Get.put(CategoryController());
  var authC = Get.put(AuthController(),permanent: true);

}