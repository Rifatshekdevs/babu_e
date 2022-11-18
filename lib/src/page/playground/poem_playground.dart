
// import 'package:agora_test/src/config/ktext.dart';
// import 'package:agora_test/src/api/category_controller.dart';
// import 'package:agora_test/src/model/subcategory.dart';
// import 'package:agora_test/src/page/grid_view/poem_card_view.dart';
// import 'package:agora_test/src/page/grid_view/poem_details.dart';
// import 'package:agora_test/src/utils/constrants.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class PoemPlayground extends StatefulWidget {
//   final String id;
//   final SubcategoryModel subcategoryModel;
//   PoemPlayground({required this.id, required this.subcategoryModel});

//   @override
//   _PoemPlaygroundState createState() => _PoemPlaygroundState();
// }

// class _PoemPlaygroundState extends State<PoemPlayground> {
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return LayoutBuilder(builder: (context, constraints) {
//       return Scaffold(
//         backgroundColor: Color.fromARGB(255, 252, 244, 243),
//         appBar: AppBar(
//             title: KText(
//               text: widget.subcategoryModel.name.toString(),
//               fontFamily: kFontFamily,
//               fontSize: 24,
//               color: Colors.white,
//             ),
//             centerTitle: true,
//             iconTheme: IconThemeData(color: colorLightPurple),
//             leading: IconButton(
//               onPressed: () {
//                 Get.back();
//               },
//               icon: Icon(
//                 Icons.arrow_back,
//               ),
//             ),
//             elevation: 0,
//             backgroundColor: colorDarkPurple),
//         body: SafeArea(
//           child: LayoutBuilder(builder: (context, contraints) {
//             return GetX<StudyController>(
//                 init: StudyController(),
//                 initState: (state) {
//                   if (state.controller != null) {
//                     state.controller?.getStudy(widget.id);
//                   }
//                 },
//                 builder: (controller) {
//                   if (controller.loading2.value) {
//                     return Center(
//                       child: CircularProgressIndicator(),
//                     );
//                   }
//                   if (controller.study.isEmpty) {
//                     return Center(child: KText(text: 'No found data'));
//                   }
//                   return Column(
//                     children: [
//                       SizedBox(
//                         height: contraints.maxHeight,
//                         width: contraints.maxWidth,
//                         child: Padding(
//                           padding: EdgeInsets.all(6.0),
//                           child: SingleChildScrollView(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               // runAlignment: WrapAlignment.spaceAround,
//                               children: [
//                                 ...controller.study.map((object) {
//                                   return InkWell(
//                                     onTap: () {
//                                       int index = controller.study.indexWhere(
//                                         (o) => o == object,
//                                       );
//                                       controller.study.forEach((element) {
//                                         element.isSelected = false;
//                                       });
//                                       if (controller.study.last == object) {
//                                         controller.study[0].isSelected = true;
//                                       } else {
//                                         controller.study[index + 1].isSelected =
//                                             true;
//                                       }
//                                       setState(() {});
//                                       Navigator.of(context).push(
//                                           MaterialPageRoute(builder: (context) {
//                                         return PoemDetails(
//                                           audio: object.audio.toString(),
//                                           title: object.name.toString(),
//                                           objectIndex: index,
//                                           objects: controller.study,
//                                           poem: object.poem,
//                                         );
//                                       }));
//                                     },
//                                     child: PoemcircleAnimation(
//                                       play: object.isSelected,
//                                       size: size,
//                                       child: Center(
//                                         child: KText(
//                                           text: object.name.toString(),
//                                           fontSize: 20,
//                                           fontFamily: kFontFamily,
//                                         ),
//                                       ),
//                                     ),
//                                   );
//                                 }).toList(),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   );
//                 });
//           }),
//         ),
//       );
//     });
//   }
// }
