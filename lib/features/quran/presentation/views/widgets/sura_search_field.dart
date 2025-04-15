import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami_app/core/constants/app_colors.dart';
import 'package:islami_app/core/constants/app_fonts.dart';
import 'package:islami_app/core/constants/app_icons.dart';

class SuraSearchField extends StatelessWidget {
  const SuraSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          enabledBorder: buildOutlineInputBorder(),
          focusedBorder: buildOutlineInputBorder(),
          disabledBorder: buildOutlineInputBorder(borderColor: AppColors.gray),
          errorBorder: buildOutlineInputBorder(borderColor: AppColors.red),
          focusedErrorBorder: buildOutlineInputBorder(borderColor: AppColors.orange),
          contentPadding: EdgeInsets.symmetric(horizontal: 14.w,vertical: 14.h),
          prefixIcon: SvgPicture.asset(AppIcons.searchBookIcon,fit: BoxFit.scaleDown,),
          hintText: "Sura Name",
          hintStyle: AppFonts.fontSize16Bold.copyWith(color: AppColors.white)
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder({Color? borderColor}) => OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.w),
      borderSide: BorderSide(color: borderColor?? AppColors.primary,width: 1)
  );
}