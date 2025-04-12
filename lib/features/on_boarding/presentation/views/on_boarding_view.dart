import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami_app/features/on_boarding/presentation/views/widgets/on_boarding_view_body.dart';
import 'package:islami_app/features/on_boarding/presentation/views_model/on_boarding_cubit.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<OnBoardingCubit>(
          create: (context) => OnBoardingCubit(),
          child: const SafeArea(child: OnBoardingViewBody())
      ),
    );
  }
}
