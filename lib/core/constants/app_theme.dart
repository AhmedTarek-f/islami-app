import 'package:flutter/material.dart';
import 'package:islami_app/core/constants/app_colors.dart';
import 'package:islami_app/core/constants/app_fonts.dart';

abstract final class AppTheme{
  static ThemeData lightMode = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.black,
    fontFamily: "Janna LT",
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.primary,
      selectedItemColor: AppColors.white,
      unselectedItemColor: AppColors.black,
      type: BottomNavigationBarType.fixed,
      elevation: 0,
      showUnselectedLabels: false,
      selectedLabelStyle: AppFonts.fontSize12Bold,
    )
  );
}