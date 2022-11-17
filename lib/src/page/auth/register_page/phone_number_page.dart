// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'package:agora_test/src/config/constants.dart';
import 'package:agora_test/src/config/ktext.dart';
import 'package:agora_test/src/config/regex.dart';
import 'package:agora_test/src/config/validator.dart';
import 'package:agora_test/src/api/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class PhoneNumberPage extends StatefulWidget {
  const PhoneNumberPage({Key? key, required this.nextPage}) : super(key: key);
  final Function nextPage;

  @override
  State<PhoneNumberPage> createState() => _PhoneNumberPageState();
}

class _PhoneNumberPageState extends State<PhoneNumberPage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final authC = Get.put(AuthController());

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
        child: Column(
          children: [
            Spacer(
              flex: 1,
            ),
            Text(
              "Give your phone number",
            ),
            Spacer(
              flex: flex1,
            ),
            Image.asset(
              'assets/images/phone.png',
              height: respectiveHeight(size, 200),
            ),
            Spacer(
              flex: 1,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                onChanged: authC.phone,
                inputFormatters: [
                  ValidatorInputFormatter(
                    editingValidator: EmailEditingRegexValidator(
                      regexSource: r'(^(?:[+0]9)?[0-9]{0,11}$)',
                    ),
                  ),
                ],
                validator: (value) {
                  String pattern = r'(^(?:[+0]9)?[0-9]{0,11}$)';
                  RegExp regExp = new RegExp(pattern);
                  if (value!.length == 0) {
                    return 'Please enter mobile number';
                  } else if (!regExp.hasMatch(value)) {
                    return 'Please enter valid mobile number';
                  }
                  return null;
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.phone_android_outlined,
                    color: Color(0xFFa4a3ef),
                  ),
                  prefix: KText(text: '+88   '),
                  hintText: "Enter your number",
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 2,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 2,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    borderSide: BorderSide(
                      color: Color(0xFFa4a3ef),
                      width: 2,
                    ),
                  ),
                ),
              ),
            ),
            Spacer(
              flex: flex1,
            ),
            Center(
              child: OutlinedButton(
                style: ButtonStyle(
                  textStyle: MaterialStateProperty.resolveWith((states) {
                    Color textColor = states.contains(MaterialState.disabled)
                        ? HexColor('#A092DB')
                        : Color(0xFFeff3f6);
                    return TextStyle(fontSize: 18, color: textColor);
                  }),
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
