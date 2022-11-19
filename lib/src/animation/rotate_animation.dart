// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

// import 'package:flutter/material.dart';
// import 'dart:math';

// class RotatingAnimation extends StatefulWidget {
//   final double degreeFrom;
//   final double degreeTo;
//   final Widget child;
//   final double width;
//   final double height;
//   const RotatingAnimation({
//     Key? key,
//     required this.child,
//     required this.degreeFrom,
//     this.degreeTo = 0,
//     required this.width,
//     required this.height,
//   }) : super(key: key);

//   @override
//   _RotatingAnimationState createState() => _RotatingAnimationState();
// }

// class _RotatingAnimationState extends State<RotatingAnimation>
//     with SingleTickerProviderStateMixin {
//   Offset center = Offset(60, 60);
//   late Animation animation;
//   late AnimationController animationController;
//   final GlobalKey _key = GlobalKey();
//   _getCenter() {
//     RenderBox box = _key.currentContext!.findRenderObject() as RenderBox;
//     Size size = box.size;
//     center = Offset(size.width / 2, size.height / 2);
//     setState(() {});
//   }

//   @override
//   void initState() {
//     animationController = AnimationController(
//         vsync: this, duration: Duration(milliseconds: 3000));
//     animation = Tween(begin: widget.degreeFrom, end: widget.degreeTo)
//         .animate(animationController);
//     Future.delayed(Duration(milliseconds: 6), () {
//       _getCenter();
//     });

//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     // Future.delayed(Duration(milliseconds: 6), () {
//     //   _getCenter();
//     // });
//     animationController.reset();
//     animationController.forward();
//     return AnimatedBuilder(
//         key: _key,
//         animation: animation,
//         builder: (context, child) {
//           return Transform(
//               transform: Matrix4.identity()
//                 ..setEntry(3, 2, 0.003)
//                 ..rotateY(pi * animation.value),
//               origin:
//                   Offset((widget.width / 2) + 7.5, (widget.height / 2) + 7.5),
//               child: Container(
//                   padding: EdgeInsets.all(15),
//                   decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(20),
//                       boxShadow: [
//                         BoxShadow(blurRadius: 2, color: Colors.black12),
//                       ]),
//                   child: widget.child));
//         });
//   }

//   @override
//   void dispose() {
//     animationController.reset();
//     animationController.dispose();
//     super.dispose();
//   }
// }
