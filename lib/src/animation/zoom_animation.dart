// import 'package:flutter/material.dart';

// class ZoomAnimaiton extends StatefulWidget {
//   const ZoomAnimaiton({Key? key, required this.child}) : super(key: key);

//   final Widget child;

//   @override
//   _ZoomAnimaitonState createState() => _ZoomAnimaitonState();
// }

// class _ZoomAnimaitonState extends State<ZoomAnimaiton>
//     with SingleTickerProviderStateMixin {
//   late AnimationController controller;
//   late Animation<double> animaiton;

//   @override
//   void initState() {
//     controller =
//         AnimationController(vsync: this, duration: Duration(seconds: 1));

//     animaiton = Tween(begin: 1.0, end: 0.8).animate(controller);
//     controller.repeat(reverse: true);

//     super.initState();
//   }

//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ScaleTransition(
//       scale: animaiton,
//       child: widget.child,
//     );
//   }
// }
