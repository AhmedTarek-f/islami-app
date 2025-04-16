import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:islami_app/core/cache/shared_preferences_helper.dart';
import 'package:islami_app/features/on_boarding/presentation/views_model/on_boarding_cubit.dart';
import 'package:islami_app/islami_app.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await SharedPreferencesHelper.init();
  FlutterNativeSplash.remove();

  runApp(BlocProvider<OnBoardingCubit>(
      create: (context) => OnBoardingCubit(), child: const IslamiApp()));
}
