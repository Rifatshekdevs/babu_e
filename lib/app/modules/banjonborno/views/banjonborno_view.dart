import 'package:agora_test/src/config/ktext.dart';
import 'package:agora_test/src/model/subcategory.dart';
import 'package:agora_test/src/utils/constrants.dart';
import 'package:agora_test/src/widget/tile_card.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/banjonborno_controller.dart';

class BanjonbornoView extends GetView<BanjonbornoController> {
  final String id;
  final SubcategoryModel subcategoryModel;
  BanjonbornoView({required this.id,required this.subcategoryModel});
  @override
  Widget build(BuildContext context) {
    controller.getBanjonborno(id);
    return Scaffold(
      appBar: AppBar(
          title: KText(
            text: subcategoryModel.name.toString(),
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
          backgroundColor: colorDarkPurple),
      body: Obx(
        () => controller.selectedImage.value == ''
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Center(
                child: CachedNetworkImage(
                imageUrl: controller.selectedImage.value,
              )),
      ),
      bottomNavigationBar: Obx(
        () => Container(
          height: Get.height / 6.5,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: controller.study.length,
            itemBuilder: (BuildContext context, int index) {
              final item = controller.study[index];
              return GestureDetector(
                onTap: () {
                  controller.selectedImage.value = item.image;
                  controller.play(item.audio);
                },
                child: TileCard(
                  imagePath: item.image,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
