import 'package:application/required_files.dart';
import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  LocalStorage localStorage = LocalStorage();

   Color primaryColors() {
    return LocalStorage().readData(keys: Keys.primaryColor) ??
        const Color(0xFFF9622E);
  }

  static Color primaryColor = const Color(0xFFF9622E);
  static Color blackColor = const Color(0xFF242424);
  static Color grayColor = const Color(0xFF797979);
  static Color whiteColor = const Color(0xFFF6F6F6);

  static Color textColor = const Color(0xFF4C4A48);

  static Color backgrond = const Color(0xFFFFFFFF);
  static Color athensGray = const Color(0xFFD2D1D6);
  static Color blueVogue = const Color(0xFF1A2E51);
  static Color grey = const Color(0xFFF6F6F6);

  static Color mainColor = Colors.grey.withOpacity(0.3);
  static Color secondaryColor = Colors.grey.withOpacity(0.1);
}
