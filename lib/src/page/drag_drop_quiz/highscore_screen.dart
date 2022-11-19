// // ignore_for_file: prefer_const_constructors

// import 'package:flutter/material.dart';

// import 'player_score.dart';

// class HighScoreScreen extends StatefulWidget {
//   const HighScoreScreen({Key? key}) : super(key: key);

//   @override
//   State<HighScoreScreen> createState() => _HighScoreScreenState();
// }

// class _HighScoreScreenState extends State<HighScoreScreen> {
// //  Box<PlayerScore> scoreBox = Hive.box<PlayerScore>(SCORE_BOXS);

//   List<Player> top5 = [];

//   // Map<dynamic, PlayerScore> deletedBox = {};
//   // undoReset() async {
//   //   await scoreBox.putAll(deletedBox);
//   //   top5update();
//   //   print(scoreBox.length);
//   // }

//   // resetScores() async {
//   //   scoreBox.toMap().forEach((key, value) {
//   //     deletedBox[key] = value;
//   //   });
//   //   await scoreBox.clear();
//   //   top5update();
//   // }

//   // top5update() {
//   //   List<PlayerScore> emptyLP = [];
//   //   scoreBox.toMap().forEach((key, value) {
//   //     emptyLP.add(value);
//   //   });
//   //   emptyLP = emptyLP..sort((a, b) => b.score.compareTo(a.score));
//   //   if (emptyLP.length < 5) {
//   //     top5 = emptyLP.sublist(0, emptyLP.length);
//   //   } else {
//   //     top5 = emptyLP.sublist(0, 5);
//   //   }
//   //   setState(() {});
//   // }

//   @override
//   void initState() {
//     //  top5update();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFF58627a),
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Color(0xFF222941),
//         actions: [
//           InkWell(
//             onTap: () {
//               // if (scoreBox.isNotEmpty) {
//               //   resetScores();
//               // } else {
//               //   undoReset();
//               // }
//               // setState(() {});
//             },
//             child: //scoreBox.isNotEmpty ? Icon(Icons.delete) :
//                 Icon(Icons.undo),
//           ),
//         ],
//         title: Text("High Scores"),
//       ),
//       body: SafeArea(
//         child: Column(
//           children: [
//             SizedBox(
//               height: 20,
//             ),
//             Text(
//               "Top 5 only",
//               style: TextStyle(
//                 color: Colors.yellow,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 24,
//               ),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 Column(
//                   children: [
//                     Text(
//                       "Rank",
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 20,
//                       ),
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     ...top5.map((e) {
//                       int index = top5.indexWhere((p) => p == e);
//                       return Padding(
//                         padding: const EdgeInsets.all(3.0),
//                         child: Text(
//                           "${index + 1}",
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 16,
//                           ),
//                         ),
//                       );
//                     }).toList()
//                   ],
//                 ),
//                 Column(
//                   children: [
//                     Text(
//                       "Name",
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 20,
//                       ),
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     ...top5.map((e) {
//                       return Padding(
//                         padding: const EdgeInsets.all(3.0),
//                         child: Text(
//                           e.name,
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 16,
//                           ),
//                         ),
//                       );
//                     }).toList()
//                   ],
//                 ),
//                 Column(
//                   children: [
//                     Text(
//                       "Date",
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 20,
//                       ),
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     ...top5.map((e) {
//                       return Padding(
//                         padding: const EdgeInsets.all(3.0),
//                         child: Text(
//                           e.date,
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 16,
//                           ),
//                         ),
//                       );
//                     }).toList()
//                   ],
//                 ),
//                 Column(
//                   children: [
//                     Text(
//                       "Score",
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 20,
//                       ),
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     ...top5.map((e) {
//                       return Padding(
//                         padding: const EdgeInsets.all(3.0),
//                         child: Text(
//                           "${e.score}",
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 16,
//                           ),
//                         ),
//                       );
//                     }).toList()
//                   ],
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
