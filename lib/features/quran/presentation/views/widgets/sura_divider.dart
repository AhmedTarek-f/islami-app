import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/core/constants/app_colors.dart';

class SuraDivider extends StatelessWidget {
  const SuraDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  RPadding(
      padding: const EdgeInsets.symmetric(horizontal: 64),
      child: Divider(
        height: 22.h,
        color: AppColors.white,
        thickness: 1,
      ),
    );
  }
}