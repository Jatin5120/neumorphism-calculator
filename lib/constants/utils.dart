import 'package:flutter/material.dart';
import 'colors.dart';

class Utilities {
  static const double blurRadius = 7;
  static const Offset darkOffset = Offset(5, 5);
  static const Offset lightOffset = Offset(-5, -5);

  static const List<BoxShadow> outerShadow = [
    BoxShadow(
      offset: darkOffset,
      color: CustomColors.darkShadow,
      blurRadius: blurRadius,
    ),
    BoxShadow(
      offset: lightOffset,
      color: CustomColors.lightShadow,
      blurRadius: blurRadius,
    ),
  ];
  static const List<BoxShadow> innerShadow = [
    BoxShadow(
      offset: lightOffset,
      color: CustomColors.darkShadow,
      blurRadius: blurRadius,
    ),
    BoxShadow(
      offset: darkOffset,
      color: CustomColors.lightShadow,
      blurRadius: blurRadius,
    ),
  ];
}
