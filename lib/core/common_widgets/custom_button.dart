import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/core/constants/app_colors.dart';
import 'package:islami_app/core/constants/app_fonts.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onPressed,
    required this.buttonTitle,
    this.buttonTitleColor,
    this.backgroundColor,
    this.shape
  });

  final void Function()? onPressed;
  final String buttonTitle;
  final Color? buttonTitleColor;
  final Color? backgroundColor;
  final OutlinedBorder? shape;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor:backgroundColor ?? AppColors.primary,
            shape: shape ?? RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r))
        ),
        onPressed: onPressed,
        child: Text(
          buttonTitle,
          style: AppFonts.fontSize16Bold.copyWith(color:buttonTitleColor?? AppColors.black),
        )
    );
  }
}