import 'package:agora_test/src/config/constants.dart';
import 'package:agora_test/src/config/ktext.dart';
import 'package:agora_test/src/api/category_controller.dart';
import 'package:agora_test/src/model/subcategory.dart';
import 'package:agora_test/src/utils/constrants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'grid_view_card.dart';
import 'grid_view_object_details_page.dart';

class GridViewPalyGround extends StatefulWidget {
  final String id;
  final SubcategoryModel subcategoryModel;
  GridViewPalyGround({required this.id, required this.subcategoryModel});

  @override
  _GridViewPalyGroundState createState() => _GridViewPalyGroundState();
}

class _GridViewPalyGroundState extends State<GridViewPalyGround> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        backgroundColor: Color.fromARGB(255, 252, 244, 243),
        appBar: AppBar(
            title: KText(
              text: widget.subcategoryModel.name.toString(),
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
        body: SafeArea(
          child: LayoutBuilder(builder: (context, contraints) {
            return GetX<StudyController>(
                init: StudyController(),
                initState: (state) {
                  state.controller?.getStudy(widget.id);
                },
                builder: (controller) {
                  if (controller.loading2.value) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (controller.study.isEmpty) {
                    return Center(child: KText(text: 'No found data'));
                  }
                  return Column(
                    children: [
                      SizedBox(
                        height: contraints.maxHeight,
                        width: contraints.maxWidth,
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: SingleChildScrollView(
                            child: Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              alignment: WrapAlignment.spaceEvenly,
                              // runAlignment: WrapAlignment.spaceAround,
                              runSpacing: 10,
                              children: [
                                ...controller.study.map((object) {
                                  return InkWell(
                                    onTap: () {
                                      int index = controller.study.indexWhere(
                                        (o) => o == object,
                                      );
                                      controller.study.forEach((element) {
                                        element.isSelected = false;
                                      });
                                      if (controller.study.last == object) {
                                        controller.study[0].isSelected = true;
                                      } else {
                                        controller.study[index + 1].isSelected =
                                            true;
                                      }
                                      setState(() {});
                                      Navigator.of(context).push(
                                          MaterialPageRoute(builder: (context) {
                                        return GridViewObjectsDetailsPage(
                                          path: object.image.toString(),
                                          tag: object.image.toString(),
                                          title: object.name.toString(),
                                          objectIndex: index,
                                          objects: controller.study,
                                          subtitle:
                                              object.description.toString(),
                                          audioPath: object.audio.toString(),
                                        );
                                      }));
                                    },
                                    child: Container(
                                      margin:
                                          EdgeInsets.fromLTRB(20, 20, 20, 20),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.transparent,
                                        boxShadow: [
                                          BoxShadow(
                                              color: Color(0xff632133)
                                                  .withOpacity(0.08),
                                              spreadRadius: 4),
                                        ],
                                      ),
                                      child: CircleAnimation(
                                        play: object.isSelected,
                                        size: size,
                                        child: ClipOval(
                                          child: CachedNetworkImage(
                                            imageUrl:object.image.toString(),
                                            fit: BoxFit.contain,
                                            height: respectiveHeight(size, 50),
                                            width: respectiveWidth(size, 50),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                });
          }),
        ),
      );
    });
  }
}
