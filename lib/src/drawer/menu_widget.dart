import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class MenuWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) => IconButton(
    onPressed: ()=> ZoomDrawer.of(context)?.toggle(),
    icon: Image.asset('assets/images/menu-bar.png'));
}