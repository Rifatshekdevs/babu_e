// import 'package:agora_test/src/config/ktext.dart';
// import 'package:agora_test/src/model/study_Model.dart';
// import 'package:agora_test/src/utils/constrants.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:hexcolor/hexcolor.dart';
// import 'package:just_audio/just_audio.dart';
// // import 'package:just_audio/just_audio.dart';

// class PoemDetails extends StatefulWidget {
//   final int objectIndex;
//   final String audio;
//   final List<String> poem;
//   final String title;
//   final List<StudyModel> objects;

//   const PoemDetails(
//       {Key? key,
//       required this.audio,
//       required this.poem,
//       required this.title,
//       required this.objects,
//       required this.objectIndex})
//       : super(key: key);

//   @override
//   State<PoemDetails> createState() => _PoemDetailsState();
// }

// class _PoemDetailsState extends State<PoemDetails> {
//   final _audioPlayer = AudioPlayer();
//   @override
//   void initState() {
//     super.initState();
//     print(widget.audio);
//     _playAudio(widget.audio);
//   }

//   @override
//   void dispose() {
//     _audioPlayer.dispose();
//     super.dispose();
//   }

//   Future _playAudio(String path) async {
//     try {
//       await _audioPlayer.setUrl(path);
//       await _audioPlayer.play();
//       await _audioPlayer.setVolume(1.5);
//       await _audioPlayer.stop();
//     } catch (e) {
//       print("Error loading audio source: $e");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFFeef2f5),
//       appBar: AppBar(
//         centerTitle: true,
//         title: KText(
//           text: widget.title,
//           fontSize: 20,
//           fontFamily: sFontFamily,
//           color: Colors.white,
//         ),
//         iconTheme: IconThemeData(
//           color: Colors.white,
//         ),
//         leading: IconButton(
//           onPressed: () {
//             Get.back();
//           },
//           icon: Icon(
//             Icons.arrow_back,
//           ),
//         ),
//         backgroundColor: HexColor('#A092DB'),
//         elevation: 0,
//       ),
//       body: SafeArea(
//         child: Container(
//           decoration: BoxDecoration(
//             image: DecorationImage(
//               image: AssetImage(
//                 'assets/images/poem-background.png',
//               ),
//               fit: BoxFit.fill,
//             ),
//           ),
//           child: LayoutBuilder(
//             builder: (context, contraints) {
//               return SizedBox(
//                 height: contraints.maxHeight,
//                 width: contraints.maxWidth,
//                 child: SingleChildScrollView(
//                   child: Column(
//                     children: [
//                       SizedBox(
//                         height: contraints.maxHeight * 0.02,
//                       ),
//                       Container(
//                         height: 70,
//                         width: 250,
//                         decoration: BoxDecoration(
//                           color: HexColor('#92F4D1'),
//                           borderRadius: BorderRadius.circular(15),
//                         ),
//                         child: Center(
//                             child: KText(
//                           text: widget.title,
//                           fontSize: 20,
//                           fontFamily: sFontFamily,
//                           color: Colors.white,
//                         )),
//                       ),
//                       SizedBox(
//                         height: contraints.maxHeight * 0.05,
//                       ),
//                       Container(
//                         height: 300,
//                         child: ListView.builder(
//                           itemCount: widget.poem.length,
//                           itemBuilder: (context, index) {
//                             var item = widget.poem[index];
//                             return KText(
//                               text: item,
//                               fontSize: 20,
//                               fontFamily: sFontFamily,
//                             );
//                           },
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }

// class LinesPainter extends CustomPainter {
//   final int objectLenth;
//   final int objectIndex;
//   LinesPainter({
//     required this.objectLenth,
//     required this.objectIndex,
//   });
//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint paint1 = Paint();
//     paint1..color = Color(0xFFf3effc);
//     paint1..strokeWidth = 5.0;
//     Paint paint2 = Paint();
//     paint2..color = Color(0xFFa491e3);
//     paint2..strokeWidth = 5.0;
//     double perWidth = size.width / objectLenth;
//     for (var i = 0; i < objectLenth; i++) {
//       canvas.drawLine(Offset(perWidth * i, 0),
//           Offset(((perWidth) * (i + 1)) - 4, 0), paint1);
//     }
//     for (var i = 0; i < objectIndex + 1; i++) {
//       canvas.drawLine(Offset(perWidth * i, 0),
//           Offset(((perWidth) * (i + 1)) - 2, 0), paint2);
//     }
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }
// }
