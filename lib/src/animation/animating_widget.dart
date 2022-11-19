// // ignore_for_file: prefer_const_constructors

// import 'package:flutter/material.dart';

// //incomplete
// class AnimatingWidget extends StatefulWidget {
//   final bool slideAnimation;
//   final bool scaleAnimation;
//   final int index;
//   final Widget child;
//   final double scaleAnimationBegin;
//   final double scaleAnimationEnd;
//   final Offset slideAnimationBegin;
//   final Offset slideAnimationEnd;
//   final Widget emptySpace;
//   final int interval;
//   const AnimatingWidget({
//     required this.child,
//     Key? key,
//     this.slideAnimation = false,
//     this.scaleAnimation = false,
//     this.index = 0,
//     this.slideAnimationBegin = const Offset(0, 0),
//     this.scaleAnimationBegin = 1.0,
//     this.scaleAnimationEnd = 1.0,
//     this.slideAnimationEnd = const Offset(0, 0),
//     this.emptySpace = const SizedBox(),
//     this.interval = 500,
//   }) : super(key: key);

//   @override
//   _AnimatingWidgetState createState() => _AnimatingWidgetState();
// }

// class _AnimatingWidgetState extends State<AnimatingWidget> {
//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<Widget>(
//         future: Future<Widget>.delayed(
//             Duration(milliseconds: widget.interval * (widget.index)), () {
//           return SubAnimatingWidget(
//               scaleAnimation: widget.scaleAnimation,
//               slideAnimation: widget.slideAnimation,
//               scaleAnimationBegin: widget.scaleAnimationBegin,
//               scaleAnimationEnd: widget.scaleAnimationEnd,
//               slideAnimationBegin: widget.slideAnimationBegin,
//               slideAnimationEnd: widget.slideAnimationEnd,
//               child: widget.child);
//         }),
//         builder: (context, snapshot) {
//           return snapshot.data ?? widget.emptySpace;
//         });
//   }
// }

// class SubAnimatingWidget extends StatefulWidget {
//   final bool slideAnimation;
//   final bool scaleAnimation;
//   final double scaleAnimationBegin;
//   final double scaleAnimationEnd;
//   final Offset slideAnimationBegin;
//   final Offset slideAnimationEnd;
//   final Widget child;
//   const SubAnimatingWidget(
//       {Key? key,
//       required this.child,
//       required this.slideAnimation,
//       required this.scaleAnimation,
//       required this.scaleAnimationBegin,
//       required this.scaleAnimationEnd,
//       required this.slideAnimationBegin,
//       required this.slideAnimationEnd})
//       : super(key: key);

//   @override
//   _SubAnimatingWidgetState createState() => _SubAnimatingWidgetState();
// }

// class _SubAnimatingWidgetState extends State<SubAnimatingWidget>
//     with TickerProviderStateMixin {
//   late AnimationController controller;
//   late Animation<double> scaleAnimation;
//   late Animation<Offset> slideAnimation;
//   bool animated = false;
//   @override
//   void initState() {
//     controller = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 500),
//     );
//     scaleAnimation =
//         Tween(begin: widget.scaleAnimationBegin, end: widget.scaleAnimationEnd)
//             .animate(controller);
//     slideAnimation = Tween(begin: widget.slideAnimationBegin, end: Offset(0, 0))
//         .animate(controller);

//     super.initState();
//   }

//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (!animated) {
//       controller.reset();
//       controller.forward();
//       animated = true;
//     }
//     return ScaleTransition(
//         scale: scaleAnimation,
//         child: SlideTransition(position: slideAnimation, child: widget.child));
//   }
// }
