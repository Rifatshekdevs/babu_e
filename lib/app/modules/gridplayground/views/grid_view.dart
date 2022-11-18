import 'package:agora_test/app/modules/gridplayground/views/griddetails_view.dart';
import 'package:agora_test/src/config/constants.dart';
import 'package:agora_test/src/config/ktext.dart';
import 'package:agora_test/src/page/grid_view/grid_view_card.dart';
import 'package:agora_test/src/utils/constrants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/grid_controller.dart';
class GridPlaygroundView extends GetView<GridPlaygroundController> {
  GridPlaygroundView({Key? key}):super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 252, 244, 243),
      appBar: AppBar(
          title: KText(
            text: '',
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
      body: SafeArea(child: LayoutBuilder(
        builder: (context, contraints) {
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
                        ...controller.study4.map((object) {
                          return InkWell(
                            onTap: () {
                              int index = controller.study4.indexWhere(
                                (o) => o == object,
                              );
                              controller.study4.forEach((element) {
                                element.isSelected = false;
                              });
                              if (controller.study4.last == object) {
                                controller.study4[0].isSelected = true;
                              } else {
                                controller.study4[index + 1].isSelected = true;
                              }
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return GriddetailsView(
                                  path: object.image.toString(),
                                  tag: object.image.toString(),
                                  title: object.name.toString(),
                                  objectIndex: index,
                                  objects: controller.study4,
                                  subtitle: object.description.toString(),
                                  audioPath: object.audio.toString(),
                                );
                              }));
                            },
                            child: Container(
                              margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.transparent,
                                boxShadow: [
                                  BoxShadow(
                                      color:
                                          Color(0xff632133).withOpacity(0.08),
                                      spreadRadius: 4),
                                ],
                              ),
                              child: CircleAnimation(
                                play: object.isSelected,
                                size: size,
                                child: ClipOval(
                                  child: CachedNetworkImage(
                                    imageUrl: object.image.toString(),
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
        },
      ),
      ),
    );
  }
}
