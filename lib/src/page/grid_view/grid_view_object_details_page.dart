
import 'package:agora_test/src/config/constants.dart';
import 'package:agora_test/src/config/ktext.dart';
import 'package:agora_test/src/model/study_Model.dart';
import 'package:agora_test/src/model/subcategory.dart';
import 'package:agora_test/src/utils/constrants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:just_audio/just_audio.dart';

class GridViewObjectsDetailsPage extends StatefulWidget {
  final int objectIndex;
  final String tag;
  final String path;
  final String title;
  final String subtitle;
  final List<StudyModel> objects;
  final String audioPath;
  final SubcategoryModel? subcategoryModel;

  GridViewObjectsDetailsPage(
      {required this.tag,
      required this.path,
      required this.title,
      required this.subtitle,
      required this.objects,
      required this.objectIndex,
      required this.audioPath,
      this.subcategoryModel});

  @override
  State<GridViewObjectsDetailsPage> createState() =>
      _GridViewObjectsDetailsPageState();
}

class _GridViewObjectsDetailsPageState
    extends State<GridViewObjectsDetailsPage> {
  final _audioPlayer = AudioPlayer();
  @override
  void initState() {
    super.initState();
    print(widget.audioPath);
    _playAudio(widget.audioPath);
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  Future _playAudio(String path) async {
    try {
      await _audioPlayer.setUrl(path);
      await _audioPlayer.play();
      await _audioPlayer.setVolume(1.5);
      await _audioPlayer.stop();
    } catch (e) {
      print("Error loading audio source: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // print(objects.length);
    // print(objectIndex);
    // print(objectIndex / objects.length);
    return Scaffold(
      backgroundColor: Color(0xFFeef2f5),
      appBar: AppBar(
          title: KText(text: widget.title),
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
                          widget.title.capitalize(),
                          style: TextStyle(
                              fontSize: respectiveHeight(size, 24),
                              fontFamily: sFontFamily),
                        ),
                        Text(
                          "${widget.objectIndex + 1} / ${widget.objects.length}",
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
                        objectIndex: widget.objectIndex,
                        objectLenth: widget.objects.length,
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
                            tag: widget.tag,
                            child: Padding(
                              padding: EdgeInsets.all(50),
                              child: CachedNetworkImage(
                               imageUrl: widget.path,
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
                              text: widget.title.capitalize(),
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
                          widget.objects[widget.objectIndex - 1];
                      if (object == widget.objects.first) {
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) {
                          return GridViewObjectsDetailsPage(
                            path: widget.objects.last.image.toString(),
                            tag: widget.objects.last.image.toString(),
                            title: widget.objects.last.name
                                .toString()
                                .capitalize(),
                            objects: widget.objects,
                            objectIndex: widget.objects.length - 1,
                            subtitle:
                                widget.objects.last.description.toString(),
                            audioPath: widget.objects.last.audio.toString(),
                          );
                        }));
                      } else {
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) {
                          return GridViewObjectsDetailsPage(
                            path: object.image.toString(),
                            tag: object.image.toString(),
                            title: object.name.toString().capitalize(),
                            objects: widget.objects,
                            objectIndex: widget.objectIndex - 1,
                            subtitle:
                                widget.objects.last.description.toString(),
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
                          widget.objects[widget.objectIndex + 1];
                      if (object == widget.objects.last) {
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) {
                          return GridViewObjectsDetailsPage(
                            path: widget.objects[0].image.toString(),
                            tag: widget.objects[0].image.toString(),
                            title:
                                widget.objects[0].name.toString().capitalize(),
                            objects: widget.objects,
                            objectIndex: 0,
                            subtitle:
                                widget.objects.last.description.toString(),
                            audioPath: widget.objects[0].audio.toString(),
                          );
                        }));
                      } else {
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) {
                          return GridViewObjectsDetailsPage(
                            path: object.image.toString(),
                            tag: object.image.toString(),
                            title: object.name.toString().capitalize(),
                            objects: widget.objects,
                            objectIndex: widget.objectIndex + 1,
                            subtitle:
                                widget.objects.last.description.toString(),
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

extension MyExtension on String {
  String capitalize() {
    return '${this[0].toUpperCase()}${this.substring(1).toLowerCase()}';
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
