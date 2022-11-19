// // ignore_for_file: prefer_const_constructors, avoid_function_literals_in_foreach_calls

// import 'package:flutter/material.dart';

// import 'items.dart';

// class ReportScreen extends StatelessWidget {
//   final Items items;
//   const ReportScreen({Key? key, required this.items}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(builder: (context, constraints) {
//       return Scaffold(
//         backgroundColor: Color(0xFF1c1f3c),
//         appBar: AppBar(
//           backgroundColor: Color(0xff446a6f),
//           title: Text("Report Screen"),
//         ),
//         body: SingleChildScrollView(
//           child: Column(
//             children: [
//               SizedBox(
//                 height: 10,
//               ),
//               ReportElement(
//                 constraints: constraints,
//                 name: 'Total Quiz',
//                 value: '${items.items.length}',
//               ),
//               ReportElement(
//                 constraints: constraints,
//                 name: 'Score',
//                 value: '${calRight() * 10}',
//               ),
//               ReportElement(
//                 constraints: constraints,
//                 name: 'Correct Answer',
//                 value: '${calRight()}/${items.items.length}',
//               ),
//               ReportElement(
//                 constraints: constraints,
//                 name: 'Incorrect Answer',
//                 value: '${calWrong()}/${items.items.length}',
//               ),
//               ReportElement(
//                 constraints: constraints,
//                 name: 'Not Answered',
//                 value: '${calNotAnswered()}/${items.items.length}',
//               ),
//             ],
//           ),
//         ),
//       );
//     });
//   }

//   calRight() {
//     int i = 0;
//     for (var element in items.items) {
//       if (element.answerState == AnswerState.right) {
//         i++;
//       }
//     }
//     return i;
//   }

//   calWrong() {
//     int i = 0;
//     for (var element in items.items) {
//       if (element.answerState == AnswerState.wrong) {
//         i++;
//       }
//     }
//     return i;
//   }

//   calNotAnswered() {
//     int i = 0;
//     items.items.forEach((element) {
//       if (element.answerState == AnswerState.nothing) {
//         i++;
//       }
//     });
//     return i;
//   }
// }

// class ReportElement extends StatelessWidget {
//   final BoxConstraints constraints;
//   final String name;
//   final String value;
//   const ReportElement({
//     Key? key,
//     required this.constraints,
//     required this.name,
//     required this.value,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(15),
//           color: Color(0xFF6d7d7d).withOpacity(0.4)),
//       margin: EdgeInsets.all(20),
//       height: constraints.maxHeight * 0.12,
//       padding: EdgeInsets.all(10),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             name,
//             style: TextStyle(fontSize: 16, color: Colors.white),
//           ),
//           Text(
//             value,
//             style: TextStyle(fontSize: 16, color: Colors.white),
//           ),
//         ],
//       ),
//     );
//   }
// }
