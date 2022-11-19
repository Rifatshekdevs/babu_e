// ignore_for_file: invalid_use_of_protected_member
import 'package:agora_test/src/config/ktext.dart';
import 'package:agora_test/src/page/playground/number_play_ground.dart';
import 'package:agora_test/src/utils/constrants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/number_controller.dart';

class NumberView extends GetView<NumberController> {
    NumberView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
           var width = constraints.maxWidth;
              // controller.presentWidget.value ??= CachedNetworkImage(
              //   imageUrl: controller.study3.first.image.toString(),
              //   width: width / 1.5,
              // );
              // controller.play(controller.study3.first.audio);
              return Scaffold(
                backgroundColor: Color.fromARGB(255, 252, 244, 243),
                appBar: AppBar(
                    title: KText(
                      text: "",
                      fontFamily: kFontFamily,
                      fontSize: 24,
                      color: Colors.white,
                    ),
                    centerTitle: true,
                    iconTheme: IconThemeData(color: colorLightPurple),
                    leading: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(
                        Icons.arrow_back,
                      ),
                    ),
                    elevation: 0,
                    backgroundColor: colorDarkPurple
                    ),
                extendBodyBehindAppBar: true,
                body:Obx(()=> controller.study3.value.length==0? 
                Center(child: CircularProgressIndicator(),):
                 SafeArea(
                    child: Column(
                  children: [
                    Expanded(
                      child: Align(child: controller.presentWidget.value),
                    ),
                    Container(
                      width: width,
                      height: width / 5 * 3,
                      color: Colors.white,
                      child: Wrap(
                        children: [
                          ...controller.study3.map((num) {
                            // int index = controller.study3.indexOf(num);
                            return NumberButton(
                              width: width,
                              onTap: () {
                                controller.presentWidget.value =
                                    CachedNetworkImage(
                                      imageUrl: num.image.toString(),
                                      width: 250,
                                    );
                              },
                              imagePath: num.image.toString(),
                            );
                          }).toList(),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),
                ),
                ),
              );  
    });
  }
}
