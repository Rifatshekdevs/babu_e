import 'package:agora_test/app/routes/app_pages.dart';
import 'package:agora_test/src/config/constants.dart';
import 'package:agora_test/src/api/local_cash_controller.dart';
import 'package:agora_test/src/drawer/zoom_drawer.dart';
import 'package:agora_test/src/page/auth/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
void main() async {
WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(
     GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: kThemedata,
          smartManagement: SmartManagement.onlyBuilder,
          home:LocalStorage.isLoggedIn() ? DrawerWidget() : WelcomeScreen(),
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
        ),
  );
  AndroidInitializationSettings androidInitializationSettings =
      AndroidInitializationSettings('@mipmap/ic_launcher');
  InitializationSettings initializationSettings =
      InitializationSettings(android: androidInitializationSettings);
  await flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onDidReceiveNotificationResponse: (payload) async {
  });
}
