import 'dart:math';

import 'package:flutter/material.dart';

class AppColors {
  AppColors._();
  static const Color lightDarkV1 = Color(0xFF383B49);
  static const Color lightGrey = Color(0xFF585A66);
  static const Color grey = Color(0xFFD0D1D4);
  static const Color organge = Color(0xFFE1914B);
  static const Color background = Color(0xFF181B2C);
  static const Color white = Color(0xFFFFFFFF);
  static const Color pink = Color(0xFFD9519D);
  static const Gradient gradient1 =
      LinearGradient(colors: [Color(0xFFC35BD1), Color(0XFF657DDF)]);
  static Gradient gradient2 = const LinearGradient(
    transform: GradientRotation(pi),
    colors: [
      Color(0xFFED8770),
      Color(0XFFD9519D),
    ],
    begin: Alignment.centerRight,
    end: Alignment.bottomRight,
  );
}
