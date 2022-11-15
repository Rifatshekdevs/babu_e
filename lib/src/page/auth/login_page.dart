
import 'package:agora_test/src/config/constants.dart';
import 'package:agora_test/src/api/base_controller.dart';
import 'package:agora_test/src/page/auth/forget_password.dart';
import 'package:agora_test/src/page/auth/register_page/register_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with BaseController {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  int index = -1;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 40,
        ),
        child: SafeArea(
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome To ",
                        style: TextStyle(
                          fontSize: 26,
                        ),
                      ),
                      Lottie.asset(
                        "assets/logo/logo.json",
                        height: respectiveHeight(
                          size,
                          40,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          height: 1,
                          width: respectiveWidth(size, 20),
                          color: Color(0xFFa4a3ef)),
                      Text(
                        "  Login  ",
                        style: TextStyle(
                          fontSize: 22,
                          color: Color(0xFFa4a3ef),
                        ),
                      ),
                      Container(
                          height: 1,
                          width: respectiveWidth(size, 40),
                          color: Color(0xFFa4a3ef)),
                    ],
                  ),
                  SizedBox(
                    height: respectiveHeight(size, 40),
                  ),
                  Image.asset(
                    "assets/images/login.png",
                    height: respectiveHeight(size, 200),
                  ),
                  SizedBox(
                    height: respectiveHeight(size, 40),
                  ),
                  TextFormField(
                    onChanged: authC.emailT,
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Icon(
                          Icons.email_outlined,
                          color: Color(0xFFa4a3ef),
                        ),
                      ),
                      hintText: "Your Email or Phone",
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
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        borderSide: BorderSide(
                          color: Color(0xFFa4a3ef),
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: respectiveHeight(size, 20),
                  ),
                  TextFormField(
                    onChanged: authC.pass,
                    obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Icon(
                          Icons.lock_outline_rounded,
                          color: Color(0xFFa4a3ef),
                        ),
                      ),
                      hintText: "Your password",
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
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        borderSide: BorderSide(
                          color: Color(0xFFa4a3ef),
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ForgetPasswordPage()));
                    },
                    child: Text(
                      "Forget your password?",
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFFa4a3ef),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: respectiveHeight(size, 50),
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
                        side: getBorder(
                            HexColor('#89B0FF'), Colors.transparent),
                        shape: MaterialStateProperty.all(StadiumBorder()),
                        fixedSize: MaterialStateProperty.all(
                            Size(size.width * 0.90, 50)),
                      ),
                      child: Text(
                        "Login",
                      ),
                      onPressed: () {
                        print('object');
                        authC.login(context);
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have a account?",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.to(RegisterPage());
                        },
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFFa4a3ef),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: respectiveHeight(size, 10),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
