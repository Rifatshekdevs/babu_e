// import 'package:babu_e/utils/constrants.dart';
// import 'package:flutter/material.dart';
// import 'package:shimmer/shimmer.dart';

// class LoadingListPage extends StatefulWidget {
//   @override
//   _LoadingListPageState createState() => _LoadingListPageState();
// }

// class _LoadingListPageState extends State<LoadingListPage> {
//   bool _enabled = true;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         width: double.infinity,
//         padding:
//             EdgeInsets.symmetric(horizontal: rgPadding, vertical: rgPadding),
//         child: Column(
//           mainAxisSize: MainAxisSize.max,
//           children: <Widget>[
//             Expanded(
//               child: Shimmer.fromColors(
//                 baseColor: colorLightPurple,
//                 highlightColor: colorDarkPurple,
//                 enabled: _enabled,
//                 child: SingleChildScrollView(
//                   child: Column(
//                     children: [
//                       Container(
//                         width: double.infinity,
//                         height: 70,
//                         decoration: const BoxDecoration(
//                           color: Colors.white,
//                           // borderRadius: BorderRadius.circular(15),
//                         ),
//                       ),
//                       SizedBox(
//                         height: rgPadding,
//                       ),
//                       Container(
//                         width: double.infinity,
//                         height: 130,
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(15),
//                         ),
//                       ),
//                       SizedBox(
//                         height: rgPadding,
//                       ),
//                       Container(
//                         height: 130,
//                         child: ListView.builder(
//                           shrinkWrap: true,
//                           itemBuilder: (_, __) => Padding(
//                             padding: EdgeInsets.only(bottom: rgPadding),
//                             child: Container(
//                               width: double.infinity,
//                               height: 130,
//                               decoration: BoxDecoration(
//                                 color: Colors.white,
//                                 borderRadius: BorderRadius.circular(15),
//                               ),
//                             ),
//                           ),
//                           itemCount: 5,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // ignore: duplicate_ignore
// class ImagX extends StatefulWidget {
//   final double h, x;
//   // ignore:
//   const ImagX(this.h, this.x);

//   @override
//   _ImagXState createState() => _ImagXState();
// }

// class _ImagXState extends State<ImagX> {
//   @override
//   Widget build(BuildContext context) {
//     return Shimmer.fromColors(
//       baseColor: colorLightPurple,
//       highlightColor: colorDarkPurple,
//       child: Container(
//         height: widget.h,
//         width: widget.x,
//         color: Colors.white,
//       ),
//     );
//   }
// }
