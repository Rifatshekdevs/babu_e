import 'package:agora_test/src/utils/constrants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainXackButton extends StatelessWidget {
  const MainXackButton({Key? key, this.bgCol = Colors.white, this.iconCol})
      : super(key: key);
  final Color bgCol;
  final Color? iconCol;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(rgPadding),
      child: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: CircleAvatar(
            radius: rgPadding * 1.15,
            backgroundColor: bgCol,
            child: Icon(
              Icons.arrow_back,
              color: iconCol ?? colorDarkPurple,
            ),
          )),
    );
  }
}
