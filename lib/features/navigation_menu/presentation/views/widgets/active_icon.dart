import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami_app/core/constants/app_colors.dart';

class ActiveIcon extends StatelessWidget {
  const ActiveIcon({
    super.key, required this.icon,
  });
  final String icon;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 59.w,
        height: 34.h,
        decoration: BoxDecoration(
          color: AppColors.black.withValues(alpha: 0.6),
          borderRadius: BorderRadius.circular(66.w),
        ),
        child: SvgPicture.asset(icon,fit: BoxFit.scaleDown,)
    );
  }
}