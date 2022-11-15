import 'package:get_storage/get_storage.dart';

class ApiCaching {
  saveToLocal(String path, String value) {
    GetStorage().write(path, value);
  }

  String getFromLocal(String path) {
    return GetStorage().read(path) ?? '';
  }
}
