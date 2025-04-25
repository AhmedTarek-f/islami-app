import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/core/common_widgets/shimmer_effect.dart';
import 'package:islami_app/core/constants/app_colors.dart';

class AzkarRowShimmer extends StatelessWidget {
  const AzkarRowShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                border: Border.all(
                  width: 2.w,
                  color: AppColors.primary,
                ),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: ShimmerEffect(
                      width: ScreenUtil().screenWidth,
                      height: ScreenUtil().scaleHeight,
                      radius: 20.r,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const RSizedBox(
            width: 20,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                border: Border.all(
                  width: 2.w,
                  color: AppColors.primary,
                ),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: ShimmerEffect(
                      width: ScreenUtil().screenWidth,
                      height: ScreenUtil().scaleHeight,
                      radius: 20.r,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
