import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/core/constants/app_colors.dart';
import 'package:islami_app/core/constants/app_fonts.dart';
import 'package:islami_app/core/constants/app_images.dart';
import 'package:islami_app/features/radio/data/models/radio_model.dart';
import 'package:islami_app/features/radio/presentation/views/widgets/play_and_sound_radio_row.dart';

class RadioItem extends StatelessWidget {
  const RadioItem({super.key, required this.radioData});
  final RadioModel radioData;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().screenWidth,
      height: 133.h,
      decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(20.r),
          image: DecorationImage(
              image: AssetImage(
                radioData.isPlaying?
                AppImages.radioActiveBackground:
                AppImages.radioInactiveBackground,
              ),
              fit: BoxFit.contain,
              alignment: Alignment.bottomCenter,
          )
      ),
      child: Column(
        children: [
          RPadding(
            padding: const EdgeInsets.only(top: 14.0),
            child: Text(
              radioData.radioChannelName,
              style: AppFonts.fontSize20Bold.copyWith(color: AppColors.black),
            ),
          ),
          const Spacer(),
          PlayAndSoundRadioRow(
            radioData: radioData,
          ),
        ],
      ),
    );
  }
}