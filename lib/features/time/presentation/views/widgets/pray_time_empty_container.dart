import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/core/constants/app_colors.dart';
import 'package:islami_app/core/constants/app_fonts.dart';
import 'package:islami_app/core/constants/app_images.dart';

class PrayTimeEmptyContainer extends StatelessWidget {
  const PrayTimeEmptyContainer({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().screenWidth,
      padding: REdgeInsets.symmetric(horizontal: 12),
      height: 301.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.brown,
        borderRadius: BorderRadius.circular(40.r),
        image: const DecorationImage(
          image: AssetImage(AppImages.timeBackgroundCard),
          fit: BoxFit.cover,
        ),
      ),
      child: Text(
        "Al adan times is not available right now.",
        style: AppFonts.fontSize24Bold.copyWith(
          color: AppColors.black.withValues(
            alpha: 0.8,
          ),
        ),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center,
      ),
    );
  }
}
