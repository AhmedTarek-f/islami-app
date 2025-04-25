import 'package:flutter/material.dart';
import 'package:islami_app/core/constants/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerEffect extends StatelessWidget {
  const ShimmerEffect(
      {super.key,
      required this.width,
      required this.height,
      this.radius = 15,
      this.color});
  final double width, height, radius;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.brown.withValues(alpha: 0.6),
      highlightColor: AppColors.primary.withValues(alpha: 0.8),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: color ?? Colors.white60,
        ),
      ),
    );
  }
}
