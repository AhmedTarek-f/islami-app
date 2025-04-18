import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/core/constants/app_colors.dart';
import 'package:islami_app/core/constants/app_fonts.dart';
import 'package:islami_app/core/constants/app_images.dart';
import 'package:islami_app/features/hadith/data/models/hadith_model.dart';

class HadithContent extends StatelessWidget {
  const HadithContent({
    super.key, required this.hadithData,
  });
  final HadithModel hadithData;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            child: Image.asset(
              AppImages.hadithCardBackgroundImage,
              width: 265.w,
              height: 411.h,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Image.asset(
              AppImages.hadithScreenFooterImage,
              height: 88.6.h,
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: RPadding(
              padding: const EdgeInsets.only(
                right: 24,
                left: 24,
                bottom: 74
              ),
              child: Text(
                hadithData.hadithContent ?? "",
                style: AppFonts.fontSize16Bold.copyWith(color: AppColors.black,height: 1.85.h),
                textAlign: TextAlign.center,
                textDirection: TextDirection.rtl,
                maxLines: 15,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}