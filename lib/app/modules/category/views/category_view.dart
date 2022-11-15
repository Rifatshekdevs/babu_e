import 'package:agora_test/app/routes/app_pages.dart';
import 'package:agora_test/src/config/ktext.dart';
import 'package:agora_test/src/api/slider_controller.dart';
import 'package:agora_test/src/utils/constrants.dart';
import 'package:agora_test/src/widget/custom_card.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../../src/config/constants.dart';
import '../../../../src/drawer/menu_widget.dart';
import '../controllers/category_controller.dart';

class CategoryView extends GetView<CategoryController> {
  const CategoryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Get.put(CategoryController());
    return Obx(
      () => controller.category.isEmpty
          ? CircularProgressIndicator()
          : Scaffold(
              backgroundColor: Colors.white,
              body: SafeArea(
                child: Padding(
                  padding: EdgeInsets.only(
                      left: rgPadding, right: rgPadding, top: rgPadding),
                  child: CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MenuWidget(),
                            SizedBox(
                              width: respectiveWidth(size, size.width * 0.05),
                            ),
                            KText(
                              text: controller.getDayMessage() + ", Name",
                              fontSize: 15,
                              fontFamily: sFontFamily,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: respectiveWidth(size, size.width * 0.24),
                            ),
                            CircleAvatar(
                              radius: 18,
                              backgroundImage:
                                  AssetImage('assets/images/Banner.png'),
                            )
                          ],
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: EdgeInsets.only(top: rgPadding),
                          child: GetX<SliderController>(
                            init: SliderController(),
                            initState: (state) {
                              state.controller?.getSlider();
                            },
                            builder: (controllerx) {
                              return Container(
                                height: 150,
                                width: double.infinity,
                                child: PageView.builder(
                                    itemCount: controllerx.sliderList.length,
                                    controller: controller.sliderController,
                                    pageSnapping: true,
                                    allowImplicitScrolling: true,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      final item =
                                          controllerx.sliderList[index];
                                      return Container(
                                        decoration: BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          image: DecorationImage(
                                            image: NetworkImage(
                                                item.image.toString()),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      );
                                    }),
                              );
                            },
                          ),
                        ),
                      ),
                      Obx(
                        () => controller.popularC.isEmpty
                            ? SliverToBoxAdapter(
                                child:
                                    Center(child: CircularProgressIndicator()))
                            : SliverToBoxAdapter(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 15),
                                  child: Container(
                                    height: 100,
                                    child: ListView.separated(
                                      separatorBuilder: (context, index) =>
                                          SizedBox(
                                        width: respectiveWidth(
                                            size, size.width * 0.09),
                                      ),
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      itemCount: controller.popularC.length,
                                      itemBuilder: (context, index) {
                                        final pList =
                                            controller.popularC[index];
                                        return Container(
                                          height: 100,
                                          width: 100,
                                          decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            borderRadius:
                                                BorderRadius.circular(50),
                                          ),
                                          child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              child: CachedNetworkImage(
                                             imageUrl: pList
                                                    .subcategory!.frontImage
                                                    .toString(),
                                                fit: BoxFit.cover,
                                              )),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),
                      ),
                      SliverToBoxAdapter(
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: controller.category.length,
                          itemBuilder: (context, index) {
                            final categoryList = controller.category[index];
                            return Container(
                              padding: EdgeInsets.fromLTRB(0, 3, 0, 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(rgPadding),
                                  topRight: Radius.circular(rgPadding),
                                ),
                                color: Colors.white,
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  print(categoryList.sId);
                                  // Get.to(
                                  //   SubPage(
                                  //     id: categoryList.sId.toString(),
                                  //   ),
                                  // );
                                  Get.toNamed(Routes.SUBCATEGORY,
                                      arguments: [categoryList.sId.toString()]);
                                },
                                child: CustomCard(
                                  color: HexColor('#E2F9FE').withOpacity(.3),
                                  color1: HexColor('#E2F9FE').withOpacity(.3),
                                  color2: HexColor('#C8EDFF').withOpacity(.3),
                                  title: categoryList.title.toString(),
                                  subtitle: categoryList.name.toString(),
                                  fontFamily: sFontFamily,
                                  size: size,
                                  iconPath: categoryList.cover.toString(),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
