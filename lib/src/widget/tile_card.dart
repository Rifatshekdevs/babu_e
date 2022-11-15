import 'package:agora_test/src/utils/constrants.dart';
import 'package:flutter/material.dart';

class TileCard extends StatelessWidget {
  final String imagePath;

  const TileCard({
    Key? key,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(rgPadding),
      margin: EdgeInsets.only(left: rgPadding, bottom: rgPadding),
      // height: Get.height / 5,
      // width: Get.height / 5,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1.5),
        borderRadius: BorderRadius.circular(rgPadding),
      ),
      child: Image.network(
         imagePath,
        // height: Get.height / 5,
        // width: Get.height / 5,
      ),
    );
  }
}
