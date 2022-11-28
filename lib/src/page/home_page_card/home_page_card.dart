import 'package:agora_test/src/config/constants.dart';
import 'package:flutter/material.dart';

class HomePageCard extends StatelessWidget {
  final Widget page;
  final String name;
  final String frontSvgPath;
  const HomePageCard(
      {Key? key,
      required this.page,
      required this.name,
      required this.frontSvgPath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => page));
      },
      child: Container(
        margin: const EdgeInsets.all(10.0),
        //padding: const EdgeInsets.all(10),
        height: 0.26 * size.height,
        width: 0.23 * size.height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            10,
          ),
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            Container(
              height: 130,
              decoration: BoxDecoration(borderRadius: BorderRadius.only()),
              child: Image.asset(
                frontSvgPath,
                fit: BoxFit.fitWidth,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 13,
              ),
              child: Text(
                name,
                style: const TextStyle(
                  fontFamily: Knicknack,
                  fontSize: 18,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
