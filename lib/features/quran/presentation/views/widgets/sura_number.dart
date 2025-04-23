import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/core/constants/app_colors.dart';
import 'package:islami_app/core/constants/app_fonts.dart';
import 'package:islami_app/core/constants/app_images.dart';

class SuraNumber extends StatelessWidget {
  const SuraNumber({
    super.key, required this.suraNumber, this.isBlackColor = false,
  });
  final String suraNumber;
  final bool isBlackColor;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 52.r,
      height: 52.r,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            AppImages.suraNumberImg,
            fit: BoxFit.cover,
            color: isBlackColor? AppColors.black : AppColors.white,
          ),
          RPadding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: FittedBox(
              child: Text(
                suraNumber,
                style: AppFonts.fontSize20Bold.copyWith(color: isBlackColor ? AppColors.black :AppColors.white),
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      ),
    );
  }
}