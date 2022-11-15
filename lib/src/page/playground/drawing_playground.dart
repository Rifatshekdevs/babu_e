// ignore_for_file: prefer_const_constructors

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_easy_permission/easy_permissions.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:screenshot/screenshot.dart';

class DrawinArea {
  Offset? point;
  Paint? areaPaint;

  DrawinArea({this.areaPaint, this.point});
}

class DrawingBoard extends StatefulWidget {
  const DrawingBoard({Key? key}) : super(key: key);

  @override
  _DrawingBoardState createState() => _DrawingBoardState();
}

class _DrawingBoardState extends State<DrawingBoard> {
  ScreenshotController screenshotController = ScreenshotController();

  List<DrawinArea?> points = [];
  late Color selectedColor;
  late double strokWidth;
  @override
  @override
  void initState() {
    super.initState();
    selectedColor = Colors.black;
    strokWidth = 2.0;
  }

  void changeColor(Color color) {
    setState(() => selectedColor = color);
  }

  takecolor() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: SizedBox(
              height: 450,
              child: ColorPicker(
                pickerColor: selectedColor,
                onColorChanged: changeColor,
                pickerAreaHeightPercent: 0.9,
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        backgroundColor: Color.fromARGB(255, 252, 244, 243),
        appBar: AppBar(
          title: Text("Drawing PlayGround"),
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
          backgroundColor: Colors.pink,
          elevation: 0,
        ),
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 252, 244, 243),
              ),
            ),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Screenshot(
                    controller: screenshotController,
                    child: Container(
                      width: 380 * (constraints.maxWidth / 392),
                      height: 560 * (constraints.maxHeight / 781),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.4),
                            blurRadius: 5.0,
                            spreadRadius: 1.0,
                          )
                        ],
                      ),
                      child: GestureDetector(
                        onPanDown: (details) {
                          setState(() {
                            points.add(DrawinArea(
                                point: details.localPosition,
                                areaPaint: Paint()
                                  ..strokeCap = StrokeCap.round
                                  ..isAntiAlias = true
                                  ..color = selectedColor
                                  ..strokeWidth = strokWidth));
                          });
                        },
                        onPanUpdate: (details) {
                          setState(() {
                            points.add(DrawinArea(
                                point: details.localPosition,
                                areaPaint: Paint()
                                  ..strokeCap = StrokeCap.round
                                  ..isAntiAlias = true
                                  ..color = selectedColor
                                  ..strokeWidth = strokWidth));
                          });
                        },
                        onPanEnd: (details) {
                          setState(() {
                            points.add(null);
                          });
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          child: CustomPaint(
                            painter: MyCustomPainter(drawingArea: points),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.all(5),
                    width: 400 * (constraints.maxWidth / 392),
                    height: 60 * (constraints.maxHeight / 781),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.4),
                          blurRadius: 5.0,
                          spreadRadius: 1.0,
                        )
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            takecolor();
                          },
                          icon: Icon(
                            Icons.color_lens,
                            color: selectedColor,
                          ),
                        ),
                        Expanded(
                            child: Slider(
                          min: 1.0,
                          max: 20,
                          activeColor: selectedColor,
                          value: strokWidth,
                          onChanged: (value) {
                            setState(() {
                              strokWidth = value;
                            });
                          },
                        )),
                        IconButton(
                          onPressed: () {
                            points.clear();
                            setState(() {});
                          },
                          icon: Icon(Icons.layers_clear),
                        ),
                        IconButton(
                          onPressed: () async {
                            final image = await screenshotController.capture();

                            if (image == null) return;
                            await saveImage(image);
                          },
                          icon: Icon(Icons.camera_alt_rounded),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}

Future<String> saveImage(bytes) async {
  var permissions = [Permissions.WRITE_EXTERNAL_STORAGE];

  FlutterEasyPermission.request(
      perms: permissions, permsGroup: [PermissionGroup.MediaLibrary]);

  final time = DateTime.now()
      .toIso8601String()
      .replaceAll('.', '-')
      .replaceAll(':', '-');

  final name = 'screenshot_$time';
  final result = await ImageGallerySaver.saveImage(bytes, name: name);

  var androidPlatformSpecifics = AndroidNotificationDetails(
    'PrayerApp',
    'PrayerTimes',
    importance: Importance.max,
    priority: Priority.high,
    icon: 'icon',
    playSound: true,
    largeIcon: DrawableResourceAndroidBitmap('icon'),
  );

  var platformSpecific = NotificationDetails(android: androidPlatformSpecifics);
  var flutterLocalNotificationsPlugin;
  await flutterLocalNotificationsPlugin.show(
      0, 'WOW Nice Drewing', ' Successfully Save', platformSpecific,
      payload: 'Successfully');
  return result['filePath'];
}

class MyCustomPainter extends CustomPainter {
  List<DrawinArea?> drawingArea;

  MyCustomPainter({required this.drawingArea});

  @override
  void paint(Canvas canvas, Size size) {
    Paint background = Paint()..color = Colors.white;
    Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);
    canvas.drawRect(rect, background);

    for (int x = 0; x < drawingArea.length - 1; x++) {
      if (drawingArea[x] != null && drawingArea[(x + 1)] != null) {
        canvas.drawLine(drawingArea[x]!.point!, drawingArea[x + 1]!.point!,
            drawingArea[x]!.areaPaint!);
      } else if (drawingArea[x] != null && drawingArea[x + 1] == null) {
        canvas.drawPoints(PointMode.points, [drawingArea[x]!.point!],
            drawingArea[x]!.areaPaint!);
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
