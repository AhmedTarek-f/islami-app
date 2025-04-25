import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/core/constants/app_colors.dart';
import 'package:islami_app/core/constants/app_fonts.dart';
import 'package:islami_app/core/constants/app_images.dart';

class AzkarTitle extends StatelessWidget {
  const AzkarTitle({
    super.key,
    required this.azkarTitle,
  });
  final String azkarTitle;
  @override
  Widget build(BuildContext context) {
    return RPadding(
      padding: const EdgeInsets.only(top: 9.0, right: 9, left: 9),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Image.asset(
              AppImages.hadithBorderLeft,
              width: 93.w,
              height: 100.h,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: FittedBox(
              child: Text(
                azkarTitle,
                style: AppFonts.fontSize24Bold.copyWith(color: AppColors.black),
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Flexible(
            child: Image.asset(
              AppImages.hadithBorderRight,
              width: 93.w,
              height: 100.h,
              fit: BoxFit.cover,
            ),
          )
        ],
      ),
    );
  }
}
