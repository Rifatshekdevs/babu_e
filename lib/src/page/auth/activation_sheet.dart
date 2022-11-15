// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

// import 'package:flutter/material.dart';

// class ActivationSheet extends StatefulWidget {
//   const ActivationSheet({Key? key}) : super(key: key);

//   @override
//   _ActivationSheetState createState() => _ActivationSheetState();
// }

// class _ActivationSheetState extends State<ActivationSheet> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.amber[50],
//       body: SingleChildScrollView(
//         child: SizedBox(
//           height: 400,
//           child: Column(
//             children: [
//               Spacer(
//                 flex: 2,
//               ),
//               Text(
//                 "Enter the code which is sent on your email",
//                 style: TextStyle(
//                   fontSize: 16,
//                 ),
//               ),
//               Spacer(
//                 flex: 2,
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 40,
//                 ),
//                 child: TextFormField(
//                   // controller: password2Controller,
//                   // style: TextStyle(fontFamily: kFontFamily),
//                   // obscureText: showPassword1 ? false : true,
//                   onChanged: (value) {
//                     //Do something with the user input.
//                   },
//                   decoration: InputDecoration(
//                     fillColor: Color(0xFFFFFFFF),
//                     filled: true,
//                     hintText: 'Enter the code',
//                     contentPadding: const EdgeInsets.symmetric(
//                         vertical: 10.0, horizontal: 20),
//                     border: const OutlineInputBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(16)),
//                     ),
//                     enabledBorder: const OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.white, width: 1.0),
//                       borderRadius: BorderRadius.all(Radius.circular(16)),
//                     ),
//                     focusedBorder: const OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.white, width: 2.0),
//                       borderRadius: BorderRadius.all(Radius.circular(16)),
//                     ),
//                   ),
//                 ),
//               ),
//               Spacer(
//                 flex: 2,
//               ),
//               ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                       backgroundColor: Color(0xFFe15968),
//                       shape: const StadiumBorder(),
//                       elevation: 0,
//                       minimumSize: const Size(300, 60)),
//                   onPressed: () async {},
//                   child: const Text(
//                     "Activate Account",
//                     style: TextStyle(
//                       fontSize: 20,
//                     ),
//                   )),
//               Spacer(
//                 flex: 2,
//               ),
//               Text("Wrong Email?"),
//               Spacer(
//                 flex: 2,
//               ),
//               ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                       backgroundColor: Color(0xFFe15968),
//                       shape: const StadiumBorder(),
//                       elevation: 0,
//                       minimumSize: const Size(300, 60)),
//                   onPressed: () async {},
//                   child: const Text(
//                     "Delete Account",
//                     style: TextStyle(
//                       fontSize: 20,
//                     ),
//                   )),
//               Spacer(
//                 flex: 2,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
