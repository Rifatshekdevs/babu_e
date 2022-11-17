// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'package:agora_test/src/config/constants.dart';
import 'package:agora_test/src/api/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'register_page.dart';

class GuardianPage extends StatefulWidget {
  const GuardianPage({Key? key, required this.nextPage}) : super(key: key);
  final Function nextPage;

  @override
  State<GuardianPage> createState() => _GuardianPageState();
}

class _GuardianPageState extends State<GuardianPage> {
  final authC = Get.put(
    AuthController(),
  );
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  List<String> items = [
    "Day",
    "Night",
  ];
  String selectedGaurdian = "";

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
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Spacer(
              flex: flex1,
            ),
            Text(
              "Who are you?",
              style: registerPageTextStyle,
            ),
            Spacer(
              flex: flex2,
            ),
            Guardian(
              guardianName: "Father",
              switchValue: authC.guardian.value == 'Father',
              onChanged: (b) {
                if (b) {
                  setState(() {
                    authC.guardian.value = "Father";
                  });
                }
              },
            ),
            Spacer(
              flex: flex3,
            ),
            Guardian(
              guardianName: "Mother",
              switchValue: authC.guardian.value == "Mother",
              onChanged: (b) {
                if (b) {
                  setState(() {
                    authC.guardian.value = "Mother";
                  });
                }
              },
            ),
            Spacer(
              flex: flex3,
            ),
            Guardian(
              guardianName: "Brother",
              switchValue: authC.guardian.value == "Brother",
              onChanged: (b) {
                if (b) {
                  setState(() {
                    authC.guardian.value = "Brother";
                  });
                }
              },
            ),
            Spacer(
              flex: flex3,
            ),
            Guardian(
              guardianName: "Sister",
              switchValue: authC.guardian.value == "Sister",
              onChanged: (b) {
                if (b) {
                  setState(() {
                    authC.guardian.value = "Sister";
                  });
                }
              },
            ),
            Spacer(
              flex: flex3,
            ),
            Guardian(
              guardianName: "Others",
              switchValue: authC.guardian.value == "Others",
              onChanged: (b) {
                if (b) {
                  setState(() {
                    authC.guardian.value = "Others";
                  });
                }
              },
            ),
            Spacer(
              flex: flex3,
            ),
            if (authC.guardian.value == "Others")
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: TextFormField(
                  onChanged: authC.guardian,
                  decoration: InputDecoration(
                    hintText: "Please wrute your familiarity ",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 2,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 2,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(
                        color: Color(0xFFa4a3ef),
                        width: 2,
                      ),
                    ),
                  ),
                ),
              ),
            Spacer(
              flex: flex4,
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
      ),
    );
  }
}

class Guardian extends StatelessWidget {
  final String guardianName;
  final bool switchValue;
  final void Function(bool) onChanged;
  const Guardian(
      {Key? key,
      required this.guardianName,
      required this.switchValue,
      required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: switchValue ? Color(0xFFa4a3ef) : Colors.grey.withOpacity(0.2),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: respectiveWidth(size, 10),
          ),
          Text(guardianName),
          Spacer(),
          Switch(
            value: switchValue,
            onChanged: onChanged,
            activeColor: Color(0xFFa4a3ef),
          ),
          SizedBox(
            width: respectiveWidth(size, 10),
          ),
        ],
      ),
    );
  }
}










// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// import 'package:flutter/material.dart';

// import 'package:flutter_gen/gen_l10n/gallery_localizations.dart';
// import 'package:gallery/demos/material/material_demo_types.dart';

// class _SwitchDemo extends StatefulWidget {
//   @override
//   _SwitchDemoState createState() => _SwitchDemoState();
// }

// class _SwitchDemoState extends State<_SwitchDemo> with RestorationMixin {
//   RestorableBool switchValue = RestorableBool(false);

//   @override
//   String get restorationId => 'switch_demo';

//   @override
//   void restoreState(RestorationBucket oldBucket, bool initialRestore) {
//     registerForRestoration(switchValue, 'switch_value');
//   }

//   @override
//   void dispose() {
//     switchValue.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Semantics(
//         container: true,
//         label:
//             GalleryLocalizations.of(context).demoSelectionControlsSwitchTitle,
//         child: Switch(
//           value: switchValue.value,
//           onChanged: (value) {
//             setState(() {
//               switchValue.value = value;
//             });
//           },
//         ),
//       ),
//     );
//   }
// }

