import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/core/constants/app_colors.dart';
import 'package:islami_app/core/constants/app_fonts.dart';
import 'package:lottie/lottie.dart';

class AnimationLoaderWidget extends StatelessWidget {
  const AnimationLoaderWidget({
    super.key,
    required this.text,
    required this.animation,
    this.showAction =false,
    this.actionText,
    this.onActionPressed
  });

  final String text;
  final String animation;
  final bool showAction;
  final String? actionText;
  final VoidCallback? onActionPressed;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(animation,width: ScreenUtil().screenWidth * 0.8),
          SizedBox(height: 12.h,),
          Text(
            text,
            style: AppFonts.fontSize20Bold,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 24.h,),
          if(showAction)SizedBox(
            width: 250.w,
            child: OutlinedButton(
              onPressed: onActionPressed,
              style: OutlinedButton.styleFrom(backgroundColor: AppColors.black),
              child: Text(
                actionText ?? "",
                style: AppFonts.fontSize16Bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
