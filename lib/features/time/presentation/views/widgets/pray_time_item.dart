import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/core/constants/app_colors.dart';
import 'package:islami_app/core/constants/app_fonts.dart';
import 'package:islami_app/features/time/data/models/pray_time_model/pray_time_model.dart';

class PrayTimeItem extends StatelessWidget {
  const PrayTimeItem(
      {super.key, required this.prayTimeData, required this.isSelected});
  final PrayTimeMode prayTimeData;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return RPadding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        width: 120.w,
        height: 138.h,
        margin: REdgeInsets.symmetric(
          vertical: isSelected ? 0 : 6,
          horizontal: isSelected ? 0 : 6,
        ),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              AppColors.black,
              AppColors.lightBrown,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                prayTimeData.prayerName,
                style: AppFonts.fontSize16Bold.copyWith(color: AppColors.white),
              ),
            ),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                prayTimeData.prayerTime,
                style: AppFonts.fontSize32Bold,
              ),
            ),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                prayTimeData.dayTime,
                style: AppFonts.fontSize16Bold.copyWith(color: AppColors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
