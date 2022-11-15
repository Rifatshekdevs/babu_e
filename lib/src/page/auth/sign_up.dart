// // ignore_for_file: prefer_const_constructors

// import 'package:babu_e/utils/constrants.dart';
// import 'package:flutter/material.dart';

// class SignUp extends StatefulWidget {
//   final VoidCallback signIn;
//   final VoidCallback forgetPass;
//   // ignore: use_key_in_widget_constructors
//   const SignUp({required this.signIn, required this.forgetPass});
//   @override
//   State<SignUp> createState() => _SignUpState();
// }

// class _SignUpState extends State<SignUp> {
//   bool showPassword1 = false;
//   bool showPassword2 = false;
//   late AuthService authService;
//   TextEditingController nameController = TextEditingController();
//   TextEditingController password1Controller = TextEditingController();
//   TextEditingController password2Controller = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//   @override
//   void initState() {
//     authService = AuthService();
//     super.initState();
//   }

//   showAction(List list) {
//     return showDialog(
//         context: context,
//         builder: (context) {
//           return AlertDialog(
//             title: Text(
//               "Your Registration",
//               textAlign: TextAlign.center,
//             ),
//             content: SizedBox(
//               height: 300,
//               width: double.infinity - 100,
//               child: SingleChildScrollView(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     ...list
//                         .map(
//                           (e) => Text(
//                             e.toString(),
//                           ),
//                         )
//                         .toList()
//                   ],
//                 ),
//               ),
//             ),
//           );
//         });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color.fromARGB(255, 252, 244, 243),
//       body: Form(
//           child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 35),
//         child: SingleChildScrollView(
//           child: SizedBox(
//             height: 500,
//             child: Column(
//               children: [
//                 const Spacer(
//                   flex: 10,
//                 ),
//                 TextFormField(
//                   controller: nameController,
//                   style: TextStyle(fontFamily: kFontFamily),
//                   onChanged: (value) {
//                     //Do something with the user input.
//                   },
//                   decoration: const InputDecoration(
//                     fillColor: Color(0xFFFFFFFF),
//                     filled: true,
//                     hintText: 'Enter your name',
//                     contentPadding:
//                         EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(32.0)),
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.white, width: 1.0),
//                       borderRadius: BorderRadius.all(Radius.circular(32.0)),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.white, width: 2.0),
//                       borderRadius: BorderRadius.all(Radius.circular(32.0)),
//                     ),
//                   ),
//                 ),
//                 const Spacer(
//                   flex: 2,
//                 ),
//                 TextFormField(
//                   controller: emailController,
//                   textAlign: TextAlign.start,
//                   style: TextStyle(
//                     fontFamily: kFontFamily,
//                   ),
//                   onChanged: (value) {
//                     //Do something with the user input.
//                   },
//                   decoration: const InputDecoration(
//                     fillColor: Color(0xFFFFFFFF),
//                     filled: true,
//                     hintText: 'Enter your Email',
//                     contentPadding:
//                         EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(32.0)),
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.white, width: 1.0),
//                       borderRadius: BorderRadius.all(Radius.circular(32.0)),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.white, width: 2.0),
//                       borderRadius: BorderRadius.all(Radius.circular(32.0)),
//                     ),
//                   ),
//                 ),
//                 const Spacer(
//                   flex: 2,
//                 ),
//                 TextFormField(
//                   controller: password1Controller,
//                   textAlign: TextAlign.start,
//                   style: TextStyle(
//                     fontFamily: kFontFamily,
//                   ),
//                   obscureText: showPassword1 ? false : true,
//                   onChanged: (value) {
//                     //Do something with the user input.
//                   },
//                   decoration: InputDecoration(
//                     fillColor: Color(0xFFFFFFFF),
//                     filled: true,
//                     suffixIcon: InkWell(
//                       onTap: () {
//                         showPassword1 = !showPassword1;
//                         setState(() {});
//                       },
//                       child: showPassword1
//                           ? Icon(Icons.close)
//                           : Icon(Icons.remove_red_eye),
//                     ),
//                     hintText: 'New password.',
//                     contentPadding: const EdgeInsets.symmetric(
//                         vertical: 10.0, horizontal: 20.0),
//                     border: const OutlineInputBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(32.0)),
//                     ),
//                     enabledBorder: const OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.white, width: 1.0),
//                       borderRadius: BorderRadius.all(Radius.circular(32.0)),
//                     ),
//                     focusedBorder: const OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.white, width: 2.0),
//                       borderRadius: BorderRadius.all(Radius.circular(32.0)),
//                     ),
//                   ),
//                 ),
//                 const Spacer(
//                   flex: 2,
//                 ),
//                 TextFormField(
//                   controller: password2Controller,
//                   style: TextStyle(fontFamily: kFontFamily),
//                   obscureText: showPassword1 ? false : true,
//                   onChanged: (value) {
//                     //Do something with the user input.
//                   },
//                   decoration: InputDecoration(
//                     fillColor: Color(0xFFFFFFFF),
//                     filled: true,
//                     suffixIcon: InkWell(
//                       onTap: () {
//                         showPassword2 = !showPassword2;
//                         setState(() {});
//                       },
//                       child: showPassword2
//                           ? Icon(Icons.close)
//                           : Icon(Icons.remove_red_eye),
//                     ),
//                     hintText: 'Confrim password.',
//                     contentPadding: const EdgeInsets.symmetric(
//                         vertical: 10.0, horizontal: 20.0),
//                     border: const OutlineInputBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(32.0)),
//                     ),
//                     enabledBorder: const OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.white, width: 1.0),
//                       borderRadius: BorderRadius.all(Radius.circular(32.0)),
//                     ),
//                     focusedBorder: const OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.white, width: 2.0),
//                       borderRadius: BorderRadius.all(Radius.circular(32.0)),
//                     ),
//                   ),
//                 ),
//                 const Spacer(
//                   flex: 2,
//                 ),
//                 Row(
//                   children: [
//                     Spacer(),
//                     TextButton(
//                       style: TextButton.styleFrom(
//                         foregroundColor: Color(0xFFe15968),
//                       ),
//                       onPressed: widget.forgetPass,
//                       child: const Text(
//                         "Forget PassWord?",
//                         style: TextStyle(fontFamily: kFontFamily, fontSize: 16),
//                       ),
//                     ),
//                   ],
//                 ),
//                 const Spacer(
//                   flex: 2,
//                 ),
//                 ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                         backgroundColor: Color(0xFFe15968),
//                         shape: const StadiumBorder(),
//                         elevation: 0,
//                         minimumSize: const Size(300, 60)),
//                     onPressed: () async {
//                       if (password1Controller.text ==
//                           password2Controller.text) {
//                         List list = await authService.register(
//                           username: nameController.text,
//                           password: password1Controller.text,
//                           email: emailController.text,
//                         );
//                         print(list);
//                         showAction(list);
//                       } else {
//                         showAction(["Password do not match"]);
//                       }
//                     },
//                     child: Text(
//                       "Create",
//                       style: TextStyle(
//                         fontFamily: kFontFamily,
//                         fontSize: 20,
//                       ),
//                     )),
//                 const Spacer(
//                   flex: 2,
//                 ),
//                 Row(
//                   children: [
//                     const Spacer(),
//                     const Text(
//                       "Already have an account?",
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontFamily: kFontFamily,
//                         fontSize: 16,
//                       ),
//                     ),
//                     TextButton(
//                       style: TextButton.styleFrom(
//                         foregroundColor: Color(0xFFe15968),
//                       ),
//                       onPressed: widget.signIn,
//                       child: const Text(
//                         "Sign In",
//                         style: TextStyle(fontFamily: kFontFamily, fontSize: 16),
//                       ),
//                     ),
//                     const Spacer(),
//                   ],
//                 ),
//                 const Spacer(
//                   flex: 25,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       )),
//     );
//   }
// }
