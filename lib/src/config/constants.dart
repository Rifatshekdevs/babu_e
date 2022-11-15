
import 'package:flutter/material.dart';

double respectiveHeight(Size size, double height) {
  return (size.height / 759.272727) * height;
}

double respectiveWidth(Size size, double width) {
  return (size.width / 392.727272) * width;
}

const Knicknack = "Knicknack";
var kThemedata = ThemeData(
    buttonTheme: ButtonThemeData(shape: StadiumBorder()),
    textTheme:  TextTheme(
      bodyText1: TextStyle(
        fontSize: 20,
      ),
      bodyText2: TextStyle(
        fontSize: 20,
      ),
      button: TextStyle(
        fontSize: 20,
      ),
    ));


MaterialStateProperty<Color> getColor(Color color, Color colorPresed) {
    final getColor = (Set<MaterialState> states) {
      if (states.contains(MaterialState.pressed)) {
        return colorPresed;
      } else {
        return color;
      }
    };
    return MaterialStateProperty.resolveWith(getColor);
  }

  MaterialStateProperty<BorderSide> getBorder(Color color, Color colorPresed) {
    final getBorder = (Set<MaterialState> states) {
      if (states.contains(MaterialState.pressed)) {
        return BorderSide(color: colorPresed, width: 1.5);
      } else {
        return BorderSide(color: color, width: 0);
      }
    };
    return MaterialStateProperty.resolveWith(getBorder);
  }



  