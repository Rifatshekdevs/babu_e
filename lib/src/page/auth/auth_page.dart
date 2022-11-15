// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'package:agora_test/src/config/constants.dart';
import 'package:agora_test/src/page/auth/register_page/register_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lottie/lottie.dart';

import 'login_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int flex1 = 8;
    int flex2 = 12;
    int flex3 = 1;
    int flex4 = 8;

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFFeff3f6),
      body: Column(
        children: [
          Spacer(
            flex: flex1,
          ),
          Text(
            "Hello Babu_e!",
            style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: respectiveHeight(size, 150),
            child: Lottie.asset("assets/logo/logo.json"),
          ),
          Spacer(
            flex: flex2,
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
                "Login",
              ),
              onPressed: () {
                Get.to(LoginPage());
              },
            ),
          ),
          Spacer(
            flex: flex3,
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
                "Sign Up",
              ),
              onPressed: () {
                Get.to(RegisterPage());
              },
            ),
          ),
          SizedBox(
            height: respectiveHeight(size, 50),
          ),
          Container(),
        ],
      ),
    );
  }
}






// enum AuthState { signIn, signUp, forgetPassword }

// class AuthPage extends StatefulWidget {
//   const AuthPage({Key? key}) : super(key: key);

//   @override
//   State<AuthPage> createState() => _AuthPageState();
// }

// class _AuthPageState extends State<AuthPage> {
//   AuthState authState = AuthState.signIn;
//   @override
//   Widget build(BuildContext context) {
//     switch (authState) {
//       case AuthState.signIn:
//         return SignIn(
//           forgetPass: () {
//             authState = AuthState.forgetPassword;
//             setState(() {});
//           },
//           signUp: () {
//             authState = AuthState.signUp;
//             setState(() {});
//           },
//           authSucess: () {
//             setState(() {});
//           },
//         );

//       case AuthState.signUp:
//         return SignUp(
//           forgetPass: () {
//             authState = AuthState.forgetPassword;
//             setState(() {});
//           },
//           signIn: () {
//             authState = AuthState.signIn;
//             setState(() {});
//           },
//         );

//       case AuthState.forgetPassword:
//         return ForgetPassword(
//           signIn: () {
//             authState = AuthState.signIn;
//             setState(() {});
//           },
//           signUp: () {
//             authState = AuthState.signUp;
//             setState(() {});
//           },
//         );
//     }
//   }
// }
