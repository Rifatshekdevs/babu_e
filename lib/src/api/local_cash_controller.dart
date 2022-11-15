import 'package:agora_test/src/page/auth/welcome_screen.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

const String idKey = "idKey";
const String nameKey = "nameKey";
const String emailKey = "emailKey";
const String passwordKey = "passwordKey";
const String isDataLoadedKey = "isDataLoadedKey";
const String isLoggedInKey = "isLoggedInKey";
const String isOnBoardDoneKey = "isOnBoardDoneKey";
const String imageKey = "imageKey";

class LocalStorage {
  static Future<void> saveId({required String id}) async {
    final box = GetStorage();
    await box.write(idKey, id);
  }

  static Future<void> saveName({required String name}) async {
    final box = GetStorage();
    await box.write(nameKey, name);
  }
  // static Future<void> saveImage({required String image}) async {
  //   final box = GetStorage();
  //   await box.write(imageKey,ApiUrl.baseUrl+ image);
  // }

  static Future<void> saveEmail({required String email}) async {
    final box = GetStorage();
    await box.write(emailKey, email);
  }

  static Future<void> savePass({required String pass}) async {
    final box = GetStorage();
    await box.write(passwordKey, pass);
  }

  static Future<void> isLoginSuccess({required bool isLoogedIn}) async {
    final box = GetStorage();
    await box.write(isLoggedInKey, isLoogedIn);
  }

  static Future<void> dataLoaded({required bool isDataLoad}) async {
    final box = GetStorage();
    await box.write(isDataLoadedKey, isDataLoad);
  }

  static Future<void> saveOnboardDoneOrNot(
      {required bool isOnBoardDone}) async {
    final box = GetStorage();
    await box.write(isOnBoardDoneKey, isOnBoardDone);
  }

  static String? getId() {
    return GetStorage().read(idKey);
  }

  static String? getName() {
    return GetStorage().read(nameKey);
  }

  static String? getImage() {
    return GetStorage().read(imageKey);
  }

  static String? savedEmail() {
    return GetStorage().read(emailKey);
  }

  static String? savedPass() {
    return GetStorage().read(passwordKey);
  }

  static bool isLoggedIn() {
    return GetStorage().read(isLoggedInKey) ?? false;
  }

  static bool isDataloaded() {
    return GetStorage().read(isDataLoadedKey) ?? false;
  }

  static bool isOnBoardDone() {
    return GetStorage().read(isOnBoardDoneKey) ?? false;
  }

  static Future<void> logout() async {
    final box = GetStorage();
    await box.remove(idKey);
    await box.remove(emailKey);
    await box.remove(passwordKey);
    await box.remove(isDataLoadedKey);
    await box.remove(isLoggedInKey);
    await box.remove(isOnBoardDoneKey);
    Get.offAll(WelcomeScreen());
  }
}
