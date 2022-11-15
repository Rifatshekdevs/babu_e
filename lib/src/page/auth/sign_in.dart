// // ignore_for_file: prefer_const_constructors

// import 'package:babu_e/hive_objects/hive_boxs.dart';
// import 'package:babu_e/hive_objects/tokens.dart';
// import 'package:babu_e/utils/constrants.dart';
// import 'package:flutter/material.dart';
// import 'package:hive_flutter/hive_flutter.dart';

// class SignIn extends StatefulWidget {
//   final VoidCallback forgetPass;
//   final VoidCallback signUp;
//   final VoidCallback authSucess;
//   // ignore: use_key_in_widget_constructors
//   const SignIn(
//       {required this.forgetPass,
//       required this.signUp,
//       required this.authSucess});
//   @override
//   State<SignIn> createState() => _SignInState();
// }

// class _SignInState extends State<SignIn> {
//   bool showPassword = false;
//   late AuthService authService;
//   Box<Tokens> box = Hive.box<Tokens>(tokenBoxName);
//   Box<String> stringBox = Hive.box<String>(stringBoxName);
//   late Tokens tokens;
//   late TextEditingController nameController;
//   TextEditingController passwordController = TextEditingController();
//   @override
//   void initState() {
//     nameController = TextEditingController(
//       text: stringBox.get("username"),
//     );
//     authService = AuthService();

//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color.fromARGB(255, 252, 244, 243),
//       body: Form(
//           child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 35),
//         child: Column(
//           children: [
//             const Spacer(
//               flex: 10,
//             ),
//             TextFormField(
//               controller: nameController,
//               style: TextStyle(fontFamily: kFontFamily),
//               onChanged: (value) {
//                 //Do something with the user input.
//               },
//               decoration: const InputDecoration(
//                 fillColor: Color(0xFFFFFFFF),
//                 filled: true,
//                 hintText: 'Enter your name',
//                 contentPadding:
//                     EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(32.0)),
//                 ),
//                 enabledBorder: OutlineInputBorder(
//                   borderSide: BorderSide(color: Colors.white, width: 1.0),
//                   borderRadius: BorderRadius.all(Radius.circular(32.0)),
//                 ),
//                 focusedBorder: OutlineInputBorder(
//                   borderSide: BorderSide(color: Colors.white, width: 2.0),
//                   borderRadius: BorderRadius.all(Radius.circular(32.0)),
//                 ),
//               ),
//             ),
//             const Spacer(
//               flex: 2,
//             ),
//             TextFormField(
//               controller: passwordController,
//               style: TextStyle(fontFamily: kFontFamily),
//               obscureText: showPassword ? false : true,
//               onChanged: (value) {
//                 //Do something with the user input.
//               },
//               decoration: InputDecoration(
//                 fillColor: Color(0xFFFFFFFF),
//                 filled: true,
//                 suffixIcon: InkWell(
//                   onTap: () {
//                     showPassword = !showPassword;
//                     setState(() {});
//                   },
//                   child: showPassword
//                       ? Icon(Icons.close)
//                       : Icon(Icons.remove_red_eye),
//                 ),
//                 hintText: 'Enter your password.',
//                 contentPadding: const EdgeInsets.symmetric(
//                     vertical: 10.0, horizontal: 20.0),
//                 border: const OutlineInputBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(32.0)),
//                 ),
//                 enabledBorder: const OutlineInputBorder(
//                   borderSide: BorderSide(color: Colors.white, width: 1.0),
//                   borderRadius: BorderRadius.all(Radius.circular(32.0)),
//                 ),
//                 focusedBorder: const OutlineInputBorder(
//                   borderSide: BorderSide(color: Colors.white, width: 2.0),
//                   borderRadius: BorderRadius.all(Radius.circular(32.0)),
//                 ),
//               ),
//             ),
//             const Spacer(
//               flex: 2,
//             ),
//             Row(
//               children: [
//                 Spacer(),
//                 TextButton(
//                     style: TextButton.styleFrom(foregroundColor: Color(0xFFf98b98)),
//                     onPressed: widget.forgetPass,
//                     child: Text(
//                       "Forget PassWord?",
//                       style: TextStyle(fontFamily: kFontFamily, fontSize: 16),
//                     )),
//               ],
//             ),
//             const Spacer(
//               flex: 2,
//             ),
//             ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                     backgroundColor: Color(0xFFe15968),
//                     shape: const StadiumBorder(),
//                     elevation: 0,
//                     minimumSize: const Size(300, 60)),
//                 onPressed: () async {
//                   if (nameController.text.isNotEmpty &&
//                       passwordController.text.isNotEmpty) {
//                     await stringBox.put("username", nameController.text);
//                     tokens = await authService.getToken(
//                         username: nameController.text,
//                         password: passwordController.text);
//                     print(tokens.access);
//                     print(tokens.refresh);

//                     await box.put("tokens", tokens);
//                   }
//                 },
//                 child: const Text(
//                   "Go",
//                   style: TextStyle(fontSize: 20, fontFamily: kFontFamily),
//                 )),
//             const Spacer(
//               flex: 2,
//             ),
//             Row(
//               children: [
//                 const Spacer(),
//                 const Text(
//                   "Don't have account yet?",
//                   style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 16,
//                       fontFamily: kFontFamily),
//                 ),
//                 TextButton(
//                   style: TextButton.styleFrom(
//                     foregroundColor: Color(0xFFf98b98), textStyle: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                         fontFamily: kFontFamily),
//                   ),
//                   onPressed: widget.signUp,
//                   child: const Text("Sign Up"),
//                 ),
//                 const Spacer(),
//               ],
//             ),
//             const Spacer(
//               flex: 25,
//             ),
//           ],
//         ),
//       )),
//     );
//   }
// }
