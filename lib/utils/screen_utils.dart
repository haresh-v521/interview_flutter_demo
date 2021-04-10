import 'package:flutter/material.dart';

class Scr {
  static double _screenWidth;
  static double _screenHeight;

  static setScreenSize(BuildContext context) {
    _screenHeight = MediaQuery.of(context).size.height;
    _screenWidth = MediaQuery.of(context).size.width;
  }

  static double get screenWidth => _screenWidth;

  static double get screenHeight => _screenHeight;

  static double get infinite => double.infinity;
}

double height = Scr.screenHeight;
double width = Scr.screenWidth;