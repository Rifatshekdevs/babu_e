import 'package:agora_test/app/modules/banjonborno/views/banjonborno_view.dart';
import 'package:agora_test/app/modules/gridplayground/views/grid_view.dart';
import 'package:agora_test/app/modules/number/views/number_view.dart';
import 'package:agora_test/src/animation/animating_bottom_to_up.dart';
import 'package:agora_test/src/model/subcategory.dart';
import 'package:agora_test/src/page/Kids_learning/flower_learning.dart';
import 'package:agora_test/src/page/matching_quiz/matching_quiz.dart';
import 'package:agora_test/src/page/playground/poem_playground.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../src/animation/my_animated_play_button.dart';
import '../../../../src/animation/uber_animation.dart';
import '../../../../src/page/drag_drop_quiz/drag_drop_quiz.dart';
import '../../../../src/utils/constrants.dart';
import '../../sorborno/views/sorborno_view.dart';
import '../controllers/subcategory_controller.dart';

class SubcategoryView extends GetView<SubcategoryController> {
  const SubcategoryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: colorDarkPurple,
        body: SafeArea(
          child: Obx(
            () => controller.subCategoryT.isEmpty
                ? Center(child: CircularProgressIndicator.adaptive())
                : CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: Container(
                          height: 250,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/Banner.png'),
                                fit: BoxFit.cover),
                          ),
                          child: Stack(
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon:
                                    Icon(Icons.arrow_back, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Container(
                          decoration: BoxDecoration(
                            color: colorWhite,
                            // borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: GridView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                primary: false,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 0.9,
                                ),
                                itemCount: controller.subCategoryT.length,
                                itemBuilder: (context, index) {
                                  final subItem =
                                      controller.subCategoryT[index];
                                  return AnimatingBottomToUp(
                                    index: index,
                                    child: MyAnimatedPlayButton(
                                      playground: UberAnimation(
                                        child: subItem.layout == 'vowel'
                                            ? SorbornoView(
                                                id: subItem.sId.toString(),
                                                subcategoryModel:
                                                    SubcategoryModel(
                                                  sId: subItem.sId,
                                                  name: subItem.name,
                                                  frontImage:
                                                      subItem.frontImage,
                                                  backImage: subItem.backImage,
                                                ),
                                              )
                                            : subItem.layout == 'consonant'
                                                ? BanjonbornoView(
                                                    id: subItem.sId.toString(),
                                                    subcategoryModel:
                                                        SubcategoryModel(
                                                      sId: subItem.sId,
                                                      name: subItem.name,
                                                      frontImage:
                                                          subItem.frontImage,
                                                      backImage:
                                                          subItem.backImage,
                                                    ),
                                                  )
                                                : subItem.layout == 'number'
                                                    ? NumberView(
                                                        id: subItem.sId
                                                            .toString(),
                                                        subcategoryModel:
                                                            SubcategoryModel(
                                                          sId: subItem.sId,
                                                          name: subItem.name,
                                                          frontImage: subItem
                                                              .frontImage,
                                                          backImage:
                                                              subItem.backImage,
                                                        ),
                                                      )
                                                    : subItem.layout == 'grid'
                                                        ? GridPlaygroundView(
                                                            id: subItem.sId
                                                                .toString(),
                                                            subcategoryModel:
                                                                SubcategoryModel(
                                                              sId: subItem.sId,
                                                              name:
                                                                  subItem.name,
                                                              frontImage: subItem
                                                                  .frontImage,
                                                              backImage: subItem
                                                                  .backImage,
                                                            ),
                                                          )
                                                        : subItem.layout ==
                                                                'caseStudy'
                                                            ? FlowerLearning(
                                                                id: subItem.sId
                                                                    .toString(),
                                                                subcategoryModel:
                                                                    SubcategoryModel(
                                                                  sId: subItem
                                                                      .sId,
                                                                  name: subItem
                                                                      .name,
                                                                  frontImage:
                                                                      subItem
                                                                          .frontImage,
                                                                  backImage: subItem
                                                                      .backImage,
                                                                ),
                                                              )
                                                            : subItem.layout ==
                                                                    'poem'
                                                                ? PoemPlayground(
                                                                    id: subItem
                                                                        .sId
                                                                        .toString(),
                                                                    subcategoryModel:
                                                                        SubcategoryModel(
                                                                      sId: subItem
                                                                          .sId,
                                                                      name: subItem
                                                                          .name,
                                                                      frontImage:
                                                                          subItem
                                                                              .frontImage,
                                                                      backImage:
                                                                          subItem
                                                                              .backImage,
                                                                    ),
                                                                  )
                                                                : subItem.layout ==
                                                                        'mcq'
                                                                    ? DragDropQuiz()
                                                                    : subItem.layout ==
                                                                            'quiz'
                                                                        ? MatchingQuiz()
                                                                        : SorbornoView(
                                                                            id: subItem.sId.toString(),
                                                                            subcategoryModel:
                                                                                SubcategoryModel(
                                                                              sId: subItem.sId,
                                                                              name: subItem.name,
                                                                              frontImage: subItem.frontImage,
                                                                              backImage: subItem.backImage,
                                                                            ),
                                                                          ),
                                      ),
                                      name: subItem.name.toString(),
                                      frontSvgPath:
                                          subItem.frontImage.toString(),
                                      backSvgPath: subItem.backImage.toString(),
                                      getAnimCntr: (AnimationController b) {
                                        if (controller.controllers
                                            .contains(b)) {
                                        } else {
                                          controller.controllers.add(b);
                                        }
                                      },
                                      resetAnimController: () {
                                        for (var element
                                            in controller.controllers) {
                                          element.reverse();
                                        }
                                      },
                                      fontfamily: sFontFamily,
                                    ),
                                  );
                                }),
                          ),
                        ),
                      ),
                    ],
                  ),
          ),
        ));
  }
}
