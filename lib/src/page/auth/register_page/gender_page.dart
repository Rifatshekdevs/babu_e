// ignore_for_file: prefer_const_constructors, unused_local_variable, unnecessary_null_comparison

import 'package:agora_test/src/config/constants.dart';
import 'package:agora_test/src/api/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import 'register_page.dart';

class GenderPage extends StatefulWidget {
  const GenderPage({Key? key, required this.nextPage}) : super(key: key);
  final Function nextPage;

  @override
  State<GenderPage> createState() => _GenderPageState();
}

class _GenderPageState extends State<GenderPage> {
  final authC = Get.put(AuthController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    int flex1 = 2;
    int flex2 = 2;
    int flex3 = 1;
    int flex4 = 3;
    int flex5 = 1;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFFeff3f6),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Spacer(
            flex: flex1,
          ),
          Text(
            "What's Your Gender?",
            style: registerPageTextStyle,
          ),
          Spacer(
            flex: flex1,
          ),
          Obx(() {
            return SizedBox(
              height: respectiveHeight(size, 130),
              child: Stack(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        authC.isMaleSelected.value = true;
                      });
                    },
                    child: Container(
                      height: respectiveHeight(size, 120),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage('assets/images/male.png'))),
                    ),
                  ),
                  Align(
                    alignment: Alignment(0, 1.4),
                    child: Text("Male"),
                  ),
                  if (authC.isMaleSelected.value)
                    Align(
                      alignment: Alignment(0.25, -1.0),
                      child: Icon(
                        Icons.check_circle,
                        color: Colors.green,
                        size: 30,
                      ),
                    ),
                ],
              ),
            );
          }),
          Spacer(
            flex: flex1,
          ),
          Obx(() {
            return SizedBox(
              height: respectiveHeight(size, 130),
              child: Stack(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        authC.isMaleSelected.value = false;
                      });
                    },
                    child: Container(
                      height: respectiveHeight(size, 120),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage('assets/images/female.png'),
                          )),
                    ),
                  ),
                  Align(
                    alignment: Alignment(0, 1.4),
                    child: Text("Female"),
                  ),
                  if (!authC.isMaleSelected.value)
                    GestureDetector(
                      onTap: () {},
                      child: Align(
                        alignment: Alignment(0.25, -1.0),
                        child: Icon(
                          Icons.check_circle,
                          color: Colors.green,
                          size: 30,
                        ),
                      ),
                    ),
                ],
              ),
            );
          }),
          Spacer(
            flex: flex1,
          ),
          Center(
            child: OutlinedButton(
              style: ButtonStyle(
                foregroundColor: getColor(
                  HexColor('#A092DB'),
                  Color(0xFFeff3f6),
                ),
                backgroundColor:
                    getColor(Color(0xFFeff3f6), HexColor('#A092DB')),
                side: getBorder(HexColor('#89B0FF'), Colors.transparent),
                shape: MaterialStateProperty.all(StadiumBorder()),
                fixedSize:
                    MaterialStateProperty.all(Size(size.width * 0.90, 50)),
              ),
              child: Text(
                "Next",
              ),
              onPressed: () {
                widget.nextPage();
              },
            ),
          ),
          Container(),
          SizedBox(
            height: respectiveHeight(size, 50),
          ),
        ],
      ),
    );
  }
}
