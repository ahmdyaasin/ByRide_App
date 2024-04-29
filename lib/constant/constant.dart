import 'package:flutter/material.dart';

//Color
const primaryColor = Color(0xFF2e7bd6);
const primaryColorLow = Color.fromARGB(255, 189, 213, 251);
const secondaryColor = Color(0xFFf7fdb6);
const redColor = Color(0xFFE16262);
const yellowColor = Color(0xFFf8da5b);
//textColor
const textDark = Color(0xFF2F3137);
const textWhite = Colors.white;
const textGrey = Color(0xFF979DA8);
const gradient = LinearGradient(
  begin: Alignment.topRight,
  end: Alignment.bottomLeft,
  colors: [primaryColor, primaryColorLow],
);
final shadow = BoxShadow(
  color: Colors.grey.withOpacity(0.2),
  blurRadius: 4,
  offset: const Offset(-1, 4),
);

final shadowPrimary = BoxShadow(
  color: primaryColor.withOpacity(0.2),
  blurRadius: 5,
  offset: const Offset(0, 5),
);
const bgradient = LinearGradient(
    colors: [
      Color.fromARGB(255, 23, 64, 136),
      Color.fromARGB(255, 16, 44, 92),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: [0.0, 1.0],
    tileMode: TileMode.clamp);
