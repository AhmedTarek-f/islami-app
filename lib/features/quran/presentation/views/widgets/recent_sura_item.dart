import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/core/constants/app_colors.dart';
import 'package:islami_app/core/constants/app_fonts.dart';
import 'package:islami_app/core/constants/app_images.dart';
import 'package:islami_app/features/quran/data/models/sura_model.dart';

class RecentSuraItem extends StatelessWidget {
  const RecentSuraItem({super.key, required this.suraData});
  final SuraModel suraData;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.h,
      width: 283.w,
      padding: EdgeInsets.symmetric(horizontal: 9.w,vertical: 7.h),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 8.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    suraData.suraNameEn,
                    style: AppFonts.fontSize24Bold.copyWith(color: AppColors.black),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    suraData.suraNameAr,
                    style: AppFonts.fontSize24Bold.copyWith(color: AppColors.black),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    "${suraData.versesNumber} Verses",
                    style: AppFonts.fontSize14Bold,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
          Image.asset(
            AppImages.mostRecentlySuraImage,
            width: 151.w,
          )
        ],
      ),
    );
  }
}