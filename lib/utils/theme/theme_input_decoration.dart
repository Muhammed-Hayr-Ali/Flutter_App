import 'package:application/required_files.dart';
import 'package:flutter/material.dart';

class InputTheme {
  static InputDecorationTheme lightInputDecorationTheme =
       InputDecorationTheme(
    hintStyle: TextStyle(color: AppColors.grayColor),
    errorStyle: TextStyle(fontSize: 10),
    contentPadding: EdgeInsets.all(0),
    labelStyle: TextStyle(fontSize: 14, color: Colors.black87),
    enabledBorder: InputBorder.none,
    focusedBorder: InputBorder.none,
    border:InputBorder.none,
    errorBorder: InputBorder.none,
  );
  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    hintStyle: const TextStyle(color: Colors.grey),
    errorStyle: const TextStyle(fontSize: 10),
    contentPadding: const EdgeInsets.all(0),
    labelStyle: const TextStyle(fontSize: 14, color: Colors.white),
    enabledBorder: const UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.grey),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: AppColors.primaryColor),
    ),
    border: const UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.grey),
    ),
    errorBorder: const UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.red),
    ),
  );
}
