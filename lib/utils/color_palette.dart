import 'dart:ui';

import 'package:flutter/cupertino.dart';

class ColorPalette{

  static const Color lightGrey = Color(0xFFF2F2F2);
  static const Color darkGrey = Color(0xFF3C3C3C);

  static const Color green = Color(0xFF57A217);
  static const Color red = Color(0xFFCB0000);

  static const Color mysticBlue = Color(0xFF5B5365);

  //purple
  static const Color lightPurple = Color(0xFF8650C9);
  static const Color darkPurple = Color(0xFF4E37A0);

  static const Color sun = Color(0xFFFBB018);

  static const Color transparentWhite = Color.fromRGBO(255, 255, 255, 0.75);

  static const Gradient visaGradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [Color(0xFF070707), Color(0xFF134269)],
      tileMode: TileMode.repeated
  );

  static const Gradient mastercardGradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [Color(0xFF070707), Color(0xFF672600)],
      tileMode: TileMode.repeated
  );

}