import 'package:agora_test/src/config/constants.dart';
import 'package:agora_test/src/config/ktext.dart';
import 'package:agora_test/src/model/study_Model.dart';
import 'package:agora_test/src/model/subcategory.dart';
import 'package:agora_test/src/utils/constrants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class GriddetailsView extends GetView {
  final int objectIndex;
  final String tag;
  final String path;
  final String title;
  final String subtitle;
  final List<StudyModel> objects;
  final String audioPath;
  final SubcategoryModel? subcategoryModel;

  const GriddetailsView({Key? key,required this.objectIndex, required this.tag, required this.path, required this.title, required this.subtitle, required this.objects, required this.audioPath, this.subcategoryModel,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
        Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(0xFFeef2f5),
      appBar: AppBar(
          title: KText(text: title.toUpperCase()),
          centerTitle: true,
          iconTheme: IconThemeData(
            color: colorWhite,
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
            ),
          ),
          elevation: 0,
          backgroundColor: colorDarkPurple),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          title.toUpperCase(),
                          style: TextStyle(
                              fontSize: respectiveHeight(size, 24),
                              fontFamily: sFontFamily),
                        ),
                        Text(
                          "${objectIndex + 1} / ${objects.length}",
                          style: TextStyle(
                              fontSize: respectiveHeight(size, 24),
                              fontFamily: sFontFamily),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomPaint(
                      foregroundPainter: LinesPainter(
                        objectIndex: objectIndex,
                        objectLenth: objects.length,
                      ),
                      child: SizedBox(
                        width: double.infinity,
                      ),
                    ),
                    // LinearProgressIndicator(
                    //   value: (objectIndex + 1) / objects.length,
                    // ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(
                  top: 10,
                  left: 10,
                  right: 10,
                  bottom: 10,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
                padding: EdgeInsets.all(8.0),
                //  height: respectiveHeight(size, 450),
                //  width: respectiveWidth(size, 370),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment(1, -1),
                      child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.volume_up_outlined)),
                    ),
                    Align(
                      alignment: Alignment(0, -0.7),
                      child: SizedBox(
                        height: size.height * 0.37,
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 5,
                              color: Color(0xFFf3effc),
                            ),
                          ),
                          child: Hero(
                            tag: tag,
                            child: Padding(
                              padding: EdgeInsets.all(50),
                              child: CachedNetworkImage(
                               imageUrl: path,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(0, 0.5),
                      child: RichText(
                        text: TextSpan(
                          style:
                              TextStyle(fontSize: 40, fontFamily: sFontFamily),
                          children: [
                            TextSpan(
                              text: title.toUpperCase(),
                              style: TextStyle(
                                color: HexColor('#A092DB'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(0, 1),
                      child: SizedBox(
                        height: respectiveHeight(size, 80),
                        child: Column(children: [
                          // Html(data: subtitle),
                        ]),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              height: respectiveHeight(size, 80),
              //  width: respectiveWidth(size, 370),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xFFe8e3f9),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RawMaterialButton(
                    shape: StadiumBorder(),
                    fillColor: Colors.white,
                    onPressed: () {
                      StudyModel object =
                          objects[objectIndex - 1];
                      if (object == objects.first) {
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) {
                          return GriddetailsView(
                            path: objects.last.image.toString(),
                            tag: objects.last.image.toString(),
                            title: objects.last.name
                                .toString()
                                .toUpperCase(),
                            objects: objects,
                            objectIndex: objects.length - 1,
                            subtitle:
                                objects.last.description.toString(),
                            audioPath: objects.last.audio.toString(),
                          );
                        }));
                      } else {
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) {
                          return GriddetailsView(
                            path: object.image.toString(),
                            tag: object.image.toString(),
                            title: object.name.toString().toUpperCase(),
                            objects: objects,
                            objectIndex: objectIndex - 1,
                            subtitle:
                              objects.last.description.toString(),
                            audioPath: object.audio.toString(),
                          );
                        }));
                      }
                    },
                    constraints: BoxConstraints(maxWidth: 100, minHeight: 40),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.arrow_back_ios_rounded,
                            color: Color(0xFF9f8fda),
                            size: 20,
                          ),
                          Text(
                            "Back",
                            style: TextStyle(
                                fontSize: 16,
                                color: Color(0xFF9f8fda),
                                fontFamily: sFontFamily),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  SizedBox(
                    height: 60,
                    width: 60,
                    child: RawMaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      fillColor: Colors.white,
                      onPressed: () {},
                      child: Icon(
                        Icons.pause,
                        color: Color(0xFF9f8fda),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  RawMaterialButton(
                    shape: StadiumBorder(),
                    fillColor: Color(0xFF9f8fda),
                    onPressed: () {
                      StudyModel object =
                        objects[objectIndex + 1];
                      if (object == objects.last) {
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) {
                          return GriddetailsView(
                            path: objects[0].image.toString(),
                            tag: objects[0].image.toString(),
                            title:
                                objects[0].name.toString().toUpperCase(),
                            objects: objects,
                            objectIndex: 0,
                            subtitle:
                                objects.last.description.toString(),
                            audioPath: objects[0].audio.toString(),
                          );
                        }));
                      } else {
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) {
                          return GriddetailsView(
                            path: object.image.toString(),
                            tag: object.image.toString(),
                            title: object.name.toString().toUpperCase(),
                            objects: objects,
                            objectIndex: objectIndex + 1,
                            subtitle:
                              objects.last.description.toString(),
                            audioPath: object.audio.toString(),
                          );
                        }));
                      }
                    },
                    constraints: BoxConstraints(maxWidth: 100, minHeight: 40),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Next",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontFamily: sFontFamily,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.white,
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LinesPainter extends CustomPainter {
  final int objectLenth;
  final int objectIndex;

  LinesPainter({
    required this.objectLenth,
    required this.objectIndex,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint1 = Paint();
    paint1..color = Color(0xFFf3effc);
    paint1..strokeWidth = 5.0;
    Paint paint2 = Paint();
    paint2..color = Color(0xFFa491e3);
    paint2..strokeWidth = 5.0;
    double perWidth = size.width / objectLenth;
    for (var i = 0; i < objectLenth; i++) {
      canvas.drawLine(Offset(perWidth * i, 0),
          Offset(((perWidth) * (i + 1)) - 4, 0), paint1);
    }
    for (var i = 0; i < objectIndex + 1; i++) {
      canvas.drawLine(Offset(perWidth * i, 0),
          Offset(((perWidth) * (i + 1)) - 2, 0), paint2);
    }
  }

// a491e3
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

