import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/core/constants/app_colors.dart';
import 'package:islami_app/core/constants/app_fonts.dart';
import 'package:islami_app/core/constants/app_images.dart';
import 'package:islami_app/features/radio/data/models/reciters_model/reciter_model.dart';
import 'package:islami_app/features/radio/presentation/views_model/radio_cubit.dart';
import 'package:islami_app/features/reciter_details/presentation/views/reciter_details_view.dart';
import 'package:islami_app/features/reciter_details/presentation/views_model/reciter_details_cubit.dart';

class ReciterItem extends StatelessWidget {
  const ReciterItem({super.key, required this.reciterData});
  final ReciterModel reciterData;
  @override
  Widget build(BuildContext context) {
    final controller = BlocProvider.of<RadioCubit>(context);
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => MultiBlocProvider(
                providers: [
                  BlocProvider<RadioCubit>.value(value: controller),
                  BlocProvider<ReciterDetailsCubit>(create: (context) => ReciterDetailsCubit(reciterDetailsData: reciterData),),
                ],
                child: const ReciterDetailsView(),
              ),
            ),
        );
      },
      child: Container(
        width: ScreenUtil().screenWidth,
        height: 133.h,
        decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(20.r),
            image: DecorationImage(
                image: AssetImage(
                  reciterData.isPlaying?
                  AppImages.radioActiveBackground:
                  AppImages.radioInactiveBackground,
                ),
                fit: BoxFit.contain,
                alignment: Alignment.bottomCenter,
            )
        ),
        child: Center(
          child: Text(
            reciterData.name,
            style: AppFonts.fontSize20Bold.copyWith(color: AppColors.black),
          ),
        ),
      ),
    );
  }
}