import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/core/constants/app_colors.dart';
import 'package:islami_app/features/hadith/data/models/hadith_model.dart';
import 'package:islami_app/features/hadith/presentation/views/widgets/hadith_content.dart';
import 'package:islami_app/features/hadith/presentation/views/widgets/hadith_title.dart';

class HadithItem extends StatelessWidget {
  const HadithItem({super.key, required this.hadithData});
  final HadithModel hadithData;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343.w,
      height: 618.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: AppColors.primary,
      ),
      child: Column(
        children: [
          HadithTitle(hadithTitleAr: hadithData.hadithNameAr,),
          HadithContent(hadithData: hadithData,)
        ],
      ),
    );
  }
}