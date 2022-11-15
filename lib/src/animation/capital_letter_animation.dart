// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CapitalLetterAnimation extends StatefulWidget {
  final Offset offsetBegin;
  final int? index;
  final Widget child;
  final bool animate;
  const CapitalLetterAnimation(
      {Key? key,
      required this.child,
      this.index,
      this.offsetBegin = const Offset(0, 1.5),
      required this.animate})
      : super(key: key);

  @override
  State<CapitalLetterAnimation> createState() => _CapitalLetterAnimationState();
}

class _CapitalLetterAnimationState extends State<CapitalLetterAnimation> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Widget>(
        future: Future.delayed(
            Duration(milliseconds: 500 * (widget.index ?? 0)),
            () => SubAnimatingWidget(
                offsetBegin: widget.offsetBegin,
                animate: widget.animate,
                child: widget.child)),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return snapshot.data!;
          }
          return SizedBox();
        });
  }
}

class SubAnimatingWidget extends StatefulWidget {
  final Offset offsetBegin;
  final Widget child;
  final bool animate;

  const SubAnimatingWidget(
      {Key? key,
      required this.child,
      required this.offsetBegin,
      required this.animate})
      : super(key: key);

  @override
  _SubAnimatingWidgetState createState() => _SubAnimatingWidgetState();
}

class _SubAnimatingWidgetState extends State<SubAnimatingWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;
  late Animation<Offset> slideAnimation;
  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    scaleAnimation = Tween(begin: 1.3, end: 1.0).animate(controller);
    slideAnimation =
        Tween(begin: widget.offsetBegin, end: Offset(0, 0)).animate(controller);
    controller.reset();
    controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.animate) {
      controller.reset();
      controller.forward();
    }
    return ScaleTransition(
        scale: scaleAnimation,
        child: SlideTransition(position: slideAnimation, child: widget.child));
  }
}
