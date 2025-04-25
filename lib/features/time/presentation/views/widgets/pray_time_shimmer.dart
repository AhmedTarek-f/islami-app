import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/core/common_widgets/shimmer_effect.dart';

class PrayTimeShimmer extends StatelessWidget {
  const PrayTimeShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ShimmerEffect(
      width: ScreenUtil().screenWidth,
      height: 301.h,
      radius: 40.r,
    );
  }
}
