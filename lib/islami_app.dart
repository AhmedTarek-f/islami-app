import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/core/constants/app_theme.dart';
import 'package:islami_app/features/on_boarding/presentation/views_model/on_boarding_cubit.dart';

class IslamiApp extends StatelessWidget {
  const IslamiApp({super.key});

  @override
  Widget build(BuildContext context) {
    final onBoardingController = BlocProvider.of<OnBoardingCubit>(context);
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Islami',
        theme: AppTheme.lightMode,
        home: onBoardingController.screenRedirect(),
      ),
    );
  }
}