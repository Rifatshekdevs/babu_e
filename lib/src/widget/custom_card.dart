import 'package:agora_test/src/config/constants.dart';
import 'package:agora_test/src/utils/constrants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Color color;
  final Color color1;
  final Color color2;
  final String title;
  final String subtitle;
  final String fontFamily;
  final Size size;
  final String iconPath;
  const CustomCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.fontFamily,
    required this.size,
    required this.iconPath,
    required this.color,
    required this.color1,
    required this.color2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: respectiveHeight(size, 120),
      color: color,
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(rgPadding),
                      bottomLeft: Radius.circular(rgPadding)),
                  color: color1),
              child: Stack(
                children: [
                  Positioned(
                    top: 30,
                    left: 15,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black87,
                            fontFamily: sFontFamily,
                          ),
                        ),
                        Text(
                          subtitle,
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black87,
                            fontFamily: sFontFamily,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: 130,
            height: 130,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                bottomLeft: Radius.circular(40),
              ),
              child: CachedNetworkImage(
                imageUrl: iconPath,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
