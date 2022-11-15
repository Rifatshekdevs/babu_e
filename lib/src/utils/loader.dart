import 'dart:developer';
import 'package:agora_test/src/utils/constrants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:loading_indicator/loading_indicator.dart';

showloadingWidget() {
  loadinGDialog();
}

class Loader extends StatefulWidget {
  const Loader({Key? key}) : super(key: key);

  @override
  _LoaderState createState() => _LoaderState();
}

class _LoaderState extends State<Loader> {
  List<Color>? colors = [colorDarkPurple];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(rgPadding),
      ),
      child: Padding(
        padding: EdgeInsets.all(10 * 2),
        child: LoadingIndicator(
          indicatorType: Indicator.values[33],
          colors: colors,
        ),
      ),
    );
  }
}

loadinGDialog() {
  showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return WillPopScope(
            onWillPop: () async {
              return false;
            },
            child: SizedBox(
                height: 100, width: 100, child: Center(child: Loader())));
      });
}

// Get.defaultDialog(
//   content:
//    WillPopScope(
//       onWillPop: () async {
//         return false;
//       },
//       child:
//           SizedBox(height: 100, width: 100, child: Center(child: Loader()))),
// );
// Get.dialog(
//     Dialog(
//       backgroundColor: Colors.white,
//       child: WillPopScope(
//           onWillPop: () async {
//             return false;
//           },
//           child: SizedBox(
//               height: 100, width: 100, child: Center(child: Loader()))),
//     ),
//     barrierDismissible: false);

closeloadingWidget() {
  // mmm('close dialog');
  Get.back();
}

mmm(dynamic x) {
  log("\u001b[1;32m" + x.toString() + "\u001b[0m");
}

mmm2(dynamic x) {
  log("\u001b[1;31m" + x.toString() + "\u001b[0m");
}

// Widget loadWidget() {
//   return Center(
//       child: CircularProgressIndicator(
//     color: primaryColor,
//   ));
// }
