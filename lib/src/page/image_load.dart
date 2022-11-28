import 'package:agora_test/src/utils/constrants.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ImageLoad extends StatelessWidget {
  const ImageLoad({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Shimmer.fromColors(
           baseColor: colorLightPurple,
           highlightColor: colorDarkPurple,
           child: Row(children: [
            Container(
              color: Colors.grey,
            width: 130,
            height: 130,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                bottomLeft: Radius.circular(40),
              ),
            ),
          ),
           ],),
           )
        ],
      ),
    );
  }
}