import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/core/cache/shared_preferences_helper.dart';
import 'package:islami_app/core/constants/app_constants.dart';
import 'package:islami_app/core/constants/app_theme.dart';
import 'package:islami_app/features/navigation_menu/presentation/views/navigation_menu_view.dart';
import 'package:islami_app/features/navigation_menu/presentation/views_model/menu_bottom_navigation_cubit.dart';
import 'package:islami_app/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:islami_app/features/on_boarding/presentation/views_model/on_boarding_cubit.dart';

class IslamiApp extends StatelessWidget {
  const IslamiApp({super.key});

  @override
  Widget build(BuildContext context) {
    final bool? isHomeScreen = SharedPreferencesHelper.getBool(
      key: AppConstants.isHomeScreenKey,
    );
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Islami',
        theme: AppTheme.lightMode,
        home: isHomeScreen != null
            ? BlocProvider<MenuBottomNavigationCubit>(
                create: (context) => MenuBottomNavigationCubit(),
                child: const NavigationMenuView(),
              )
            : BlocProvider<OnBoardingCubit>(
            create: (context) => OnBoardingCubit(),
            child: const OnBoardingView(),
        ),
      ),
    );
  }
}
