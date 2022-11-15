// ignore_for_file: prefer_const_constructors


import 'package:agora_test/src/config/constants.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';


class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({
    Key? key,
  }) : super(key: key);

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPasswordPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Color(0xFFa4a3ef),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            "Forget Password",
            style: TextStyle(
              color: Color(0xFFa4a3ef),
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Spacer(),
            Image.asset(
              "assets/images/forget.png",
              height: respectiveHeight(size, 200),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              child: Text(
                "Don't Worry! Just fill in your registered email and we'll help you reset your password.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(
              height: respectiveHeight(size, 50),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 10),
                    child: Icon(
                      Icons.email_outlined,
                      color: Color(0xFFa4a3ef),
                    ),
                  ),
                  hintText: "Your Email",
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    borderSide: BorderSide(
                      color: Colors.grey.withOpacity(0.4),
                      width: 2,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    borderSide: BorderSide(
                      color: Colors.grey.withOpacity(0.4),
                      width: 2,
                    ),
                  ),
                  focusedBorder:  OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    borderSide: BorderSide(
                      color: Color(0xFFa4a3ef),
                      width: 2,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: respectiveHeight(size, 15),
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
                  "Reset Password",
                ),
                onPressed: () {
                 
                },
              ),
            ),
            Spacer(
              flex: 1,
            ),
          ],
        ),
        );
  }
}
