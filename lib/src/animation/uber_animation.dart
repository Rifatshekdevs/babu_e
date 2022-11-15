import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class UberAnimation extends StatefulWidget {
  final Widget child;
  const UberAnimation({Key? key, required this.child}) : super(key: key);

  @override
  State<UberAnimation> createState() => _UberAnimationState();
}

class _UberAnimationState extends State<UberAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  bool opened = false;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this,
        duration: Duration(
          milliseconds: 300,
        ));
    animation = CurveTween(curve: Curves.easeIn).animate(controller);
    Future.delayed(
        Duration(
          milliseconds: 300,
        ), () {
      opened = true;
      setState(() {});
    });
    controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#A092DB'),
      body: opened
          ? widget.child
          : Center(
              child: ScaleTransition(
                scale: animation,
                child: Container(
                  width: 1500,
                  height: 1500,
                  decoration: BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                ),
              ),
            ),
    );
  }
}
