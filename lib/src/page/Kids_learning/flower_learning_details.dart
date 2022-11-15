import 'package:agora_test/src/config/ktext.dart';
import 'package:agora_test/src/model/study_Model.dart';
import 'package:agora_test/src/utils/constrants.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class FlowerLearningDetail extends StatelessWidget {
  final StudyModel studyModel;

  FlowerLearningDetail({required this.studyModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: KText(
          text: studyModel.name.toString(),
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
          fontFamily: kFontFamily,
        ),
        backgroundColor: Colors.red,
        iconTheme: IconThemeData(
          color: HexColor('#A092DB'),
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              height: 250,
              decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  )),
              child: GestureDetector(
                child: Hero(
                  tag: studyModel.image.toString(),
                  child: Center(
                    child: Image(
                      image: NetworkImage(studyModel.image.toString()),
                      width: 200,
                      height: 200,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 300,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      KText(
                        text: studyModel.name.toString(),
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        fontFamily: kFontFamily,
                      ),
                      // Opacity(
                      //   opacity: 0.7,
                      //   child: Html(
                      //     data: studyModel.description,

                      //     // style: {
                      //     //   'html': Style(
                      //     //     fontFamily: kFontFamily,
                      //     //   ),
                      //     // }
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
