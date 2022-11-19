// ignore_for_file: unused_local_variable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
class NumberButton extends StatelessWidget {
  final VoidCallback onTap;
  final String imagePath;
  const NumberButton({
    Key? key,
    required this.width,
    required this.onTap,
    required this.imagePath,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: CachedNetworkImage(
        imageUrl:imagePath,
        width: width / 4,
      ),
    );
  }
}

// class NumberAnimation extends StatefulWidget {
//   final Widget child;
//   const NumberAnimation({Key? key, required this.child}) : super(key: key);

//   @override
//   _NumberAnimationState createState() => _NumberAnimationState();
// }

// class _NumberAnimationState extends State<NumberAnimation>
//     with SingleTickerProviderStateMixin {
//   @override
//   Widget build(BuildContext context) {
//     return widget.child;
//   }
// }
