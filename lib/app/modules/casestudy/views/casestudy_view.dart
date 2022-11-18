import 'dart:math';

import 'package:agora_test/app/modules/casestudy/views/casestudydetails_view.dart';
import 'package:agora_test/src/config/ktext.dart';
import 'package:agora_test/src/model/study_Model.dart';
import 'package:agora_test/src/utils/constrants.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/casestudy_controller.dart';

class CasestudyView extends GetView<CasestudyController> {
  const CasestudyView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
          child: LayoutBuilder(
            builder: (context, constraints) {
              return  ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.study6.length,
                    itemBuilder: (context, index) {
                      final caseStudy = controller.study6[index];
                      return GestureDetector(
                        onTap: () {
                          Get.to(CasestudydetailsView(
                              studyModel: StudyModel(
                                  id: caseStudy.id,
                                  name: caseStudy.name,
                                  showName: caseStudy.showName,
                                  description: caseStudy.description,
                                  images: caseStudy.images,
                                  audio: caseStudy.audio,
                                  poem: caseStudy.poem,
                                  subcategory: caseStudy.subcategory,
                                  createdAt: caseStudy.createdAt,
                                  updatedAt: caseStudy.updatedAt,
                                  v: caseStudy.v,
                                  image: caseStudy.image)));
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          width: double.infinity,
                          height: 230,
                          child: Stack(clipBehavior: Clip.antiAlias, children: [
                            Positioned(
                              left: 50,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.primaries[Random()
                                        .nextInt(controller.study6.length)],
                                    borderRadius: BorderRadius.circular(10)),
                                constraints: BoxConstraints(
                                    maxWidth: 330, maxHeight: 200),
                              ),
                            ),
                            Positioned(
                                top: 25,
                                child: Hero(
                                    tag: caseStudy.image.toString(),
                                    child: Image(
                                      image: NetworkImage(
                                          caseStudy.image.toString()),
                                      width: 120,
                                      height: 120,
                                    ))),
                            Positioned(
                              top: 25,
                              left: 160,
                              child: KText(
                                text: caseStudy.name.toString(),
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                fontFamily: kFontFamily,
                              ),
                            ),
                            Positioned(
                              top: 80,
                              left: 115,
                              child: Container(
                                  width: 200,
                                  height: 200,
                                  child: Opacity(
                                    opacity: 0.8,
                                    child: Wrap(
                                      crossAxisAlignment:
                                          WrapCrossAlignment.start,
                                      alignment: WrapAlignment.start,
                                      children: [
                                        // Html(
                                        //   data: '${caseStudy.description}..',
                                        // style: {
                                        //   'html': Style(
                                        //     color: Colors.white,
                                        //     maxLines: 2,
                                        //     textOverflow:
                                        //         TextOverflow.ellipsis,
                                        //     fontSize: FontSize(18),
                                        //     fontFamily: kFontFamily,
                                        //     textDecorationColor:
                                        //         Colors.white,
                                        //   ),
                                        // }
                                        // ),
                                      ],
                                    ),
                                  )),
                            ),
                          ]),
                        ),
                      );
                    },
                  );
                },
          )
        )
              );
  }

}