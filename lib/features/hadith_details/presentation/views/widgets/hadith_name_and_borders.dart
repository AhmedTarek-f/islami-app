import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/core/constants/app_fonts.dart';
import 'package:islami_app/core/constants/app_images.dart';

class HadithNameAndBorders extends StatelessWidget {
  const HadithNameAndBorders({
    super.key,
    required this.hadithNameArabic,
  });

  final String hadithNameArabic;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          AppImages.suraDetailsBorderLeft,
          width: 93.w,
          height: 92.h,
          fit: BoxFit.cover,
        ),
        Expanded(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              hadithNameArabic,
              style: AppFonts.fontSize24Bold,
              textAlign: TextAlign.center,
              textDirection: TextDirection.rtl,
            ),
          ),
        ),
        Image.asset(
          AppImages.suraDetailsBorderRight,
          width: 93.w,
          height: 92.h,
          fit: BoxFit.cover,
        ),
      ],
    );
  }
}