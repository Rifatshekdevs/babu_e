// ignore_for_file: prefer_const_constructors, unused_local_variable
import 'package:agora_test/src/config/constants.dart';
import 'package:agora_test/src/api/base_controller.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lottie/lottie.dart';

class RegisterCompletePage extends StatefulWidget {
  @override
  State<RegisterCompletePage> createState() => _RegisterCompletePageState();
}

class _RegisterCompletePageState extends State<RegisterCompletePage> with BaseController {
  @override
  Widget build(BuildContext context) {
    int flex1 = 8;
    int flex2 = 6;
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
            "We're all set!",
            style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: respectiveHeight(size, 150),
            child: Lottie.asset("assets/logo/logo.json"),
          ),
          Spacer(
            flex: flex2,
          ),
          Text(
            "Thank You!",
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
          Spacer(
            flex: 2,
          ),
          Text(
            "Are you ready to start the fun journey?",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
          ),
          Spacer(
            flex: 10,
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
                "Yes Please",
                style: TextStyle(
                  color: Color(0xFFa4a3ef),
                ),
              ),
              onPressed: () {
               authC.registation();
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

// class RegisterCompletePage extends StatefulWidget {
//   const RegisterCompletePage({Key? key}) : super(key: key);

//   @override
//   State<RegisterCompletePage> createState() => _RegisterCompletePageState();
// }

// class _RegisterCompletePageState extends State<RegisterCompletePage> {
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
