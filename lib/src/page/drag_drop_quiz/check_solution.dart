// // ignore_for_file: prefer_const_constructors

// import 'package:agora_test/src/page/drag_drop_quiz/items.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';

// class CheckSolution extends StatelessWidget {
//   final Items items;
//   const CheckSolution({Key? key, required this.items}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFF24575e),
//       appBar: AppBar(
//         backgroundColor: Color(0xFF18172d),
//         title: Text("Solution"),
//       ),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: SizedBox(
//             width: double.infinity,
//             child: Column(
//               children: items.items
//                   .map((Item e) => FractionallySizedBox(
//                         widthFactor: 0.8,
//                         child: Column(
//                           children: [
//                             SizedBox(
//                               height: 20,
//                             ),
//                             ClipRRect(
//                               borderRadius: BorderRadius.circular(20),
//                               child: Padding(
//                                 padding: const EdgeInsets.all(16),
//                                 child: Text(
//                                   "${e.word}",
//                                   style: TextStyle(
//                                       fontSize: 18, color: Colors.white),
//                                   textAlign: TextAlign.justify,
//                                 ),
//                               ),
//                             ),
//                             SizedBox(
//                               height: 10,
//                             ),
//                             ClipRRect(
//                               borderRadius: BorderRadius.circular(20),
//                               child: CachedNetworkImage(
//                                imageUrl: e.image.toString(),
//                                 height: 50,
//                               ),
//                             ),
//                             SizedBox(
//                               height: 20,
//                             ),
//                           ],
//                         ),
//                       ))
//                   .toList(),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
