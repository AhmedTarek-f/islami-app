import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/core/constants/app_colors.dart';
import 'package:islami_app/core/constants/app_fonts.dart';

abstract class Loaders {
  static customSnackBar ({required title,  required String message, required BuildContext context, int secondsDuration = 2, Color? loaderBackgroundColor, IconData? icon, Color? iconColor,})
  {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor:loaderBackgroundColor ?? AppColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22.r)
        ),
        duration: Duration(seconds: secondsDuration),
        behavior: SnackBarBehavior.floating,
        content: Container(
          padding:  EdgeInsets.all(8.r),
          child: Row(
            children: [
              Icon(icon ?? Icons.warning_amber_outlined , size: 30.r,color: iconColor?? Colors.black,),
              SizedBox(width: 22.w,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppFonts.fontSize20Bold.copyWith(color: Colors.white),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      message,
                      style: AppFonts.fontSize16Bold.copyWith(color: Colors.white),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}