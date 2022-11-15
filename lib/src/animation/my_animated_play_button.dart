// ignore_for_file: prefer_const_constructors

import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MyAnimatedPlayButton extends StatefulWidget {
  final Widget playground;
  final String frontSvgPath;
  final String backSvgPath;
  final String name;
  final String fontfamily;
  final void Function(AnimationController) getAnimCntr;
  final VoidCallback resetAnimController;
  const MyAnimatedPlayButton({
    Key? key,
    required this.frontSvgPath,
    required this.backSvgPath,
    required this.name,
    required this.getAnimCntr,
    required this.resetAnimController,
    required this.fontfamily,
    required this.playground,
  });

  @override
  State<MyAnimatedPlayButton> createState() => _MyAnimatedPlayButtonState();
}

class _MyAnimatedPlayButtonState extends State<MyAnimatedPlayButton>
    with SingleTickerProviderStateMixin {
  final GlobalKey _key = GlobalKey();
  Offset center = Offset(0, 0);
  late Animation animation;
  late AnimationController animationController;

  void _getOffset() {
    RenderBox box = _key.currentContext!.findRenderObject() as RenderBox;
    Size size = box.size;
    center = Offset(size.width / 2, size.height / 2);
    setState(() {

    });
  }

  @override
  void initState() {
    animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1500));
    animation = CurveTween(curve: Curves.ease).animate(animationController);
    Future.delayed(Duration(milliseconds: 600), () {
      _getOffset();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final height = size.height;

    final width = size.width;

    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Transform(
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            ..rotateY(pi * animation.value),
          origin: center,
          child: animation.value < 0.5
              ? InkWell(
                  onTap: () {
                    widget.resetAnimController();
                    animationController.forward();
                    widget.getAnimCntr(animationController);
                    setState(() {});
                  },
                  child: Container(
                    margin: EdgeInsets.all(10.0),
                    //padding: const EdgeInsets.all(10),
                    height: 0.25 * height,
                    width: 0.43 * width,

                    clipBehavior: Clip.antiAlias,
                    key: _key,
                    //  padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 2,
                          spreadRadius: 2,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xFFFFFFFF),
                    ),
                    child: Column(
                      children: [
                        Container(
                            height: 0.18 * height,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only()),
                            child: CachedNetworkImage(
                        imageUrl:widget.frontSvgPath,
                              fit: BoxFit.cover,
                            )),
                        Padding(
                          padding:  EdgeInsets.symmetric(
                            vertical: 10,
                          ),
                          child: Text(
                            widget.name,
                            style: TextStyle(
                              fontFamily: widget.fontfamily,
                              fontSize: 15,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              : Transform(
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..rotateY(-pi * 1),
                  origin: center,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => widget.playground,
                      ),
                      );
                      setState(() {});
                      animationController.reset();
                    },
                    child: Padding(
                      padding:  EdgeInsets.all(10.0),
                      child: Container(
                          height: 0.25 * height,
                          width: 0.43 * width,
                          key: _key,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 2,
                                spreadRadius: 2,
                              ),
                            ],
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xFFFFFFFF),
                          ),
                          child: CachedNetworkImage(
                        imageUrl: widget.backSvgPath,
                            fit: BoxFit.cover,
                          )
                          ),
                    ),
                  ),
                ),
        );
      },
    );
  }
}
