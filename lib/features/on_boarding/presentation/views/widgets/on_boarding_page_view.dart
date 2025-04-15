import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami_app/core/constants/app_data/app_data.dart';
import 'package:islami_app/features/on_boarding/presentation/views/widgets/on_boarding_item.dart';
import 'package:islami_app/features/on_boarding/presentation/views_model/on_boarding_cubit.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = BlocProvider.of<OnBoardingCubit>(context);
    return PageView(
      physics: const BouncingScrollPhysics(),
      controller: controller.onBoardingPageController,
      onPageChanged: (value) => controller.getCurrentIndex(value),
      children: AppData.onBoardingList.map((onBoardingElement) => OnBoardingItem(onBoardingData: onBoardingElement)).toList(),
    );
  }
}