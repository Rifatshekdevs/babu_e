
import 'package:agora_test/app/modules/category/views/category_view.dart';
import 'package:agora_test/src/drawer/menu_screen.dart';
import 'package:agora_test/src/utils/constrants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ZoomDrawer(
    menuBackgroundColor: colorLightPurple,
    menuScreen: MenuScreen(), mainScreen:CategoryView(),
  );
}