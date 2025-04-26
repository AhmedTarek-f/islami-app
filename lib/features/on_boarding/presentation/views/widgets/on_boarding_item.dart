import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/core/constants/app_fonts.dart';
import 'package:islami_app/features/on_boarding/data/models/on_boarding_model.dart';

class OnBoardingItem extends StatelessWidget {
  const OnBoardingItem({super.key, required this.onBoardingData});
  final OnBoardingModel onBoardingData;
  @override
  Widget build(BuildContext context) {
    return RPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Image.asset(
            onBoardingData.image,
            width: 398.w,
            height: 415.h,
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: 39.75.h,
          ),
          Text(
            onBoardingData.title,
            style: AppFonts.fontSize24Bold,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 41.25.h,
          ),
          if (onBoardingData.subTitle != null)
            Text(
              onBoardingData.subTitle!,
              style: AppFonts.fontSize20Bold,
              textAlign: TextAlign.center,
            ),
        ],
      ),
    );
  }
}
