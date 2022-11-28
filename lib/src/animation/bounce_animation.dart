// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class BounceAnimaiton extends StatefulWidget {
  const BounceAnimaiton({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  _BounceAnimaitonState createState() => _BounceAnimaitonState();
}

class _BounceAnimaitonState extends State<BounceAnimaiton>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> animaiton;

  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));

    animaiton =
        Tween(begin: Offset(0.0, 0.3), end: Offset(0, 0)).animate(controller);
    controller.repeat(reverse: true);

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: animaiton,
      child: widget.child,
    );
  }
}
