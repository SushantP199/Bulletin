import 'package:bulletin/res/AppColors.dart';
import 'package:bulletin/res/Strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static TextStyle setTextStyle(
      {FontStyle? fontStyle,
      FontWeight? fontWeight,
      double? fontSize,
      Color? color}) {
    return TextStyle(
      fontStyle: fontStyle,
      fontWeight: fontWeight,
      fontSize: fontSize,
      color: color,
      fontFamily: AppStrings.fontFamily,
    );
  }

  static final theme = ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.darkGrey,
    ),
  );
}
