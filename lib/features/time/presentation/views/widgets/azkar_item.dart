import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/core/constants/app_colors.dart';
import 'package:islami_app/core/constants/app_fonts.dart';

class AzkarItem extends StatelessWidget {
  const AzkarItem(
      {super.key, required this.image, required this.title, this.onTap});
  final String image;
  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: REdgeInsets.only(top: 23, bottom: 12),
        decoration: BoxDecoration(
          color: AppColors.black,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            width: 2.w,
            color: AppColors.primary,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: Image.asset(
                image,
              ),
            ),
            Text(
              title,
              style: AppFonts.fontSize20Bold.copyWith(
                color: AppColors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
