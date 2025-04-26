import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/core/constants/app_colors.dart';
import 'package:islami_app/core/constants/app_fonts.dart';
import 'package:islami_app/core/constants/app_images.dart';
import 'package:islami_app/features/azkar/data/models/azkar_model/azkar_model.dart';

class AzkarContent extends StatelessWidget {
  const AzkarContent({
    super.key,
    required this.azkarData,
  });
  final AzkarModel azkarData;
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
                bottom: 74,
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Visibility(
                      visible: azkarData.description.isNotEmpty,
                      child: RPadding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: Text(
                          "الوصف: ${azkarData.description}",
                          style: AppFonts.fontSize16Bold
                              .copyWith(color: AppColors.black, height: 1.85.h),
                          textAlign: TextAlign.justify,
                          textDirection: TextDirection.rtl,
                        ),
                      ),
                    ),
                    Visibility(
                      visible: azkarData.reference.isNotEmpty,
                      child: RPadding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: Text(
                          "المصدر: ${azkarData.reference}",
                          style: AppFonts.fontSize16Bold
                              .copyWith(color: AppColors.black, height: 1.85.h),
                          textAlign: TextAlign.justify,
                          textDirection: TextDirection.rtl,
                        ),
                      ),
                    ),
                    Text(
                      azkarData.content,
                      style: AppFonts.fontSize16Bold
                          .copyWith(color: AppColors.black, height: 1.85.h),
                      textAlign: TextAlign.center,
                      textDirection: TextDirection.rtl,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
