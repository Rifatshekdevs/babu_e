// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_field, unused_local_variable, division_optimization, invalid_use_of_visible_for_testing_member

import 'dart:io';
import 'package:agora_test/src/config/constants.dart';
import 'package:agora_test/src/config/ktext.dart';
import 'package:agora_test/src/api/auth_controller.dart';
import 'package:agora_test/src/utils/constrants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'register_page.dart';

class NamePage extends StatefulWidget {
  final Function nextPage;
  const NamePage({Key? key, required this.nextPage}) : super(key: key);

  @override
  State<NamePage> createState() => _NamePageState();
}

class _NamePageState extends State<NamePage>
    with SingleTickerProviderStateMixin {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final authC = Get.put(
    AuthController(),
  );

  // XFile? _image;
  // getImage() async {
  //   final image =
  //       await ImagePicker.platform.getImage(source: ImageSource.camera);
  //   setState(() {
  //     _image = image;
  //   });
  // }

  // getImage2() async {
  //   final image =
  //       await ImagePicker.platform.getImage(source: ImageSource.gallery);
  //   setState(() {
  //     _image = image;
  //   });
  // }
  final _picker = ImagePicker();
  Future getImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    print(pickedFile);
    // if (pickedFile != null) {
    //   authC.image.value = pickedFile;
    // }
    authC.image.value = pickedFile;
  }

  DateTime? _dateTime;
  @override
  void initState() {
    _dateTime = _dateTime;
    print(authC.dateOfBirth);

    super.initState();
  }

  getDate() async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime(DateTime.now().year),
      firstDate: DateTime(DateTime.now().year - 20),
      lastDate: DateTime(DateTime.now().year + 2),
    );
    setState(() {
      authC.dateOfBirth.value =
          DateFormat.yMMMMEEEEd().format(date!).toString();

      print(authC.dateOfBirth);
    });
  }

  @override
  Widget build(BuildContext context) {
    int flex1 = 2;
    int flex2 = 2;
    int flex3 = 3;
    int flex4 = 1;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFFeff3f6),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Spacer(
              //             flex: flex1,
              //        ),
              Text(
                "What's your name?",
                style: registerPageTextStyle,
              ),
              // Spacer(
              //   flex: flex2,
              // ),
              SizedBox(
                height: 200,
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 83,
                      backgroundColor: colorDarkPurple,
                      child: CircleAvatar(
                        radius: 79,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 75,
                          backgroundImage: NetworkImage(placeHolderImage),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: GestureDetector(
                        onTap: () {
                          // controller.getMultiImage();
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.upload,
                            color: colorDarkPurple,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: respectiveHeight(size, 130),
                child: Stack(
                  children: [
                    Positioned(
                      left: respectiveWidth(size, size.width * 0.33),
                      child: Obx(
                        () => GestureDetector(
                          onTap: showBottomSheet,
                          child: authC.image.value == null
                              ? Container(
                                  height: respectiveHeight(size, 120),
                                  width: respectiveHeight(size, 120),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: Color(0xFFa4a3ef), width: 4),
                                    // image: DecorationImage(
                                    //     fit: BoxFit.cover,
                                    //     image: NetworkImage(
                                    //         authC.image.value!.path)
                                    //         ),
                                  ),
                                )
                              : Container(
                                  height: respectiveHeight(size, 120),
                                  width: respectiveHeight(size, 120),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: Color(0xFFa4a3ef), width: 4),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: FileImage(
                                        File(authC.image.value!.path).absolute,
                                      ),
                                    ),
                                  ),
                                ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(0.26, -1.0),
                      child: IconButton(
                        onPressed: showBottomSheet,
                        icon: Icon(
                          Icons.camera_alt_rounded,
                          size: 40,
                        ),
                        color: Color(0xFFa4a3ef),
                      ),
                    ),
                  ],
                ),
              ),
              // Spacer(
              //   flex: 2,
              // ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                    onChanged: authC.name,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.person_outline,
                        color: Color(0xFFa4a3ef),
                      ),
                      hintText: "Enter your name",
                      filled: true,
                      fillColor: Colors.white,
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 2,
                        ),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 2,
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        borderSide: BorderSide(
                          color: Color(0xFFa4a3ef),
                          width: 2,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Username cannot be empty";
                      }
                      return null;
                    }),
              ),
              // Spacer(
              //   flex: flex2,
              // ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    minimumSize: MaterialStateProperty.all(size * 50),
                    backgroundColor:
                        MaterialStateProperty.all(Colors.transparent),
                    // elevation: MaterialStateProperty.all(3),
                    shadowColor: MaterialStateProperty.all(Colors.transparent),
                  ),
                  onPressed: () {
                    getDate();
                  },
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 10,
                      bottom: 10,
                    ),
                    child: KText(
                      text: authC.dateOfBirth.value.isEmpty
                          ? 'Choose date'
                          : authC.dateOfBirth.value,
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              // Spacer(
              //   flex: flex2,
              // ),
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
                    if (_formKey.currentState!.validate()) {
                      widget.nextPage();
                    }
                  },
                ),
              ),

              SizedBox(
                height: respectiveHeight(size, 50),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showBottomSheet() => showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    IconButton(
                      onPressed: getImage,
                      icon: Icon(
                        Icons.collections_outlined,
                        size: 40,
                      ),
                      color: Color(0xFFa4a3ef),
                    ),
                    KText(
                      text: 'Gallery',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    )
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      onPressed: getImage,
                      icon: Icon(
                        Icons.add_a_photo_outlined,
                        size: 40,
                      ),
                      color: Color(0xFFa4a3ef),
                    ),
                    KText(
                      text: 'Camera',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      });
}

class AgeWidgetPainter extends CustomPainter {
  final double width;
  AgeWidgetPainter({
    required this.width,
  });
  @override
  void paint(Canvas canvas, Size size) async {
// Grey line
    Paint paint2 = Paint();
    paint2.color = Colors.grey.withOpacity(0.4);
    paint2.strokeWidth = 5;
    canvas.drawLine(Offset(0, 10), Offset(size.width, 10), paint2);

//purple line
    Paint paint = Paint();
    paint.color = Colors.deepPurple;
    paint.strokeWidth = 5;
    canvas.drawLine(Offset(0, 10), Offset(width, 10), paint);

//Circle
    Paint paint3 = Paint();
    paint3.color = Colors.white;
    paint3.strokeWidth = 5;

    canvas.drawCircle(Offset(width, 10), 13, paint);
    canvas.drawCircle(Offset(width, 10), 10, paint3);

    //Image
    //  Image image = Image.asset("name");
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
