import 'package:agora_test/app/modules/poem/views/poemdetails_view.dart';
import 'package:agora_test/src/config/ktext.dart';
import 'package:agora_test/src/page/grid_view/poem_card_view.dart';
import 'package:agora_test/src/utils/constrants.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/poem_controller.dart';

class PoemView extends GetView<PoemController> {
  const PoemView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
        Size size = MediaQuery.of(context).size;

    return LayoutBuilder(builder: (context, constraints) {
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
            backgroundColor: colorDarkPurple),
        body: SafeArea(
          child: LayoutBuilder(builder: (context, contraints) {
            return  Column(
                    children: [
                      SizedBox(
                        height: contraints.maxHeight,
                        width: contraints.maxWidth,
                        child: Padding(
                          padding: EdgeInsets.all(6.0),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              // runAlignment: WrapAlignment.spaceAround,
                              children: [
                                ...controller.study5.map((object) {
                                  return InkWell(
                                    onTap: () {
                                      int index = controller.study5.indexWhere(
                                        (o) => o == object,
                                      );
                                      controller.study5.forEach((element) {
                                        element.isSelected = false;
                                      });
                                      if (controller.study5.last == object) {
                                        controller.study5[0].isSelected = true;
                                      } else {
                                        controller.study5[index + 1].isSelected =
                                            true;
                                      }
                                      // setState(() {});
                                      Navigator.of(context).push(
                                          MaterialPageRoute(builder: (context) {
                                        return PoemdetailsView(
                                          audio: object.audio.toString(),
                                          title: object.name.toString(),
                                          objectIndex: index,
                                          objects: controller.study5,
                                          poem: object.poem,
                                        );
                                      }));
                                    },
                                    child: PoemcircleAnimation(
                                      play: object.isSelected,
                                      size: size,
                                      child: Center(
                                        child: KText(
                                          text: object.name.toString(),
                                          fontSize: 20,
                                          fontFamily: kFontFamily,
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
                })
        ),
      );
    });
  }
}
