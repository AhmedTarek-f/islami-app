import 'package:flutter/material.dart';
import 'package:islami_app/core/constants/app_colors.dart';

abstract final class AppTheme{
  static ThemeData lightMode = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.black,
    fontFamily: "Janna LT",
  );
}