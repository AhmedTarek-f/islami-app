import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/core/constants/app_fonts.dart';
import 'package:islami_app/core/constants/app_images.dart';
import 'package:islami_app/features/hadith/data/models/hadith_model.dart';
import 'package:islami_app/features/hadith_details/presentation/views/widgets/hadith_name_and_borders.dart';

class HadithDetailsViewBody extends StatelessWidget {
  const HadithDetailsViewBody({super.key, required this.hadithData});
  final HadithModel hadithData;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: RPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                HadithNameAndBorders(hadithNameArabic: hadithData.hadithNameAr),
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Text(
                      hadithData.hadithContent!,
                      style: AppFonts.fontSize20Bold.copyWith(height: 2),
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Image.asset(
            AppImages.suraDetailsScreenFooterImage,
          width: ScreenUtil().screenWidth,
          height: 112.h,
          fit: BoxFit.cover,
        )
      ],
    );
  }
}