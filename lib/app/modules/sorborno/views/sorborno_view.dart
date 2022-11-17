// ignore_for_file: unused_local_variable
import 'package:agora_test/src/config/ktext.dart';
import 'package:agora_test/src/model/subcategory.dart';
import 'package:agora_test/src/utils/constrants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/sorborno_controller.dart';

class SorbornoView extends GetView<SorbornoController> {
  SorbornoView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double height = constraints.maxHeight;
        double width = constraints.maxWidth;

        // controller.selectedborno.value ??= CachedNetworkImage(
        //   imageUrl: controller.study2.first.image,
        //   height: 120 * height / 703,
        //   width: 120 * height / 703,
        // );
        // controller.play(controller.study2.first.audio);

        return Scaffold(
            appBar: AppBar(
                title: KText(
                  text: '', // subcategoryModel.name.toString(),
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
                    color: Colors.white,
                  ),
                ),
                elevation: 0,
                backgroundColor: colorDarkPurple),
            body: Obx(
              () => controller.study2.value.length == 0
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : SafeArea(
                      child: Stack(
                        children: [
                          Stack(children: [
                            ...controller.study2.map((
                              e,
                            ) {
                              int index = controller.study2.indexOf(e);
                              return Positioned(
                                left: road[controller.distance * index].dx *
                                    (width / 376),
                                top: road[controller.distance * index].dy *
                                    (height / 703),
                                child: InkWell(
                                  onTap: () {
                                    print("playing ${e.audio}");
                                    controller.play(e.audio.toString());

                                    controller.selectedborno.value =
                                        CachedNetworkImage(
                                      imageUrl: e.image.toString(),
                                      height: 120 * height / 703,
                                      width: 120 * height / 703,
                                    );
                                  },
                                  child: CachedNetworkImage(
                                    imageUrl: e.image.toString(),
                                    height: 40 * (height / 703),
                                  ),
                                ),
                              );
                            }).toList(),
                            GestureDetector(
                                onTap: () {},
                                child: Center(
                                    child: controller.selectedborno.value)),
                          ]),
                        ],
                      ),
                    ),
            ));
      },
    );
  }
}
