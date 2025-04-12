import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/core/constants/app_theme.dart';
import 'package:islami_app/features/on_boarding/presentation/views/on_boarding_view.dart';

class IslamiApp extends StatelessWidget {
  const IslamiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      child: MaterialApp(
        title: 'Islami',
        theme: AppTheme.lightMode,
        home: const OnBoardingView(),
      ),
    );
  }
}