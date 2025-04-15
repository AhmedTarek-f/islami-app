import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/core/constants/app_colors.dart';
import 'package:islami_app/core/constants/app_fonts.dart';
import 'package:islami_app/features/quran/data/models/sura_model.dart';
import 'package:islami_app/features/quran/presentation/views/widgets/sura_number.dart';

class SuraItem extends StatelessWidget {
  const SuraItem({super.key, required this.suraData});
  final SuraModel suraData;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SuraNumber(suraNumber: suraData.suraNumber,),
        SizedBox(width: 24.w,),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                suraData.suraNameEn,
                style: AppFonts.fontSize20Bold.copyWith(color: AppColors.white),
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                "${suraData.versesNumber} Verses",
                style: AppFonts.fontSize14Bold.copyWith(color: AppColors.white),
                overflow: TextOverflow.ellipsis,
              )
            ],
          ),
        ),
        RPadding(
          padding: const EdgeInsets.only(right: 3.0),
          child: Text(
            suraData.suraNameAr,
            style: AppFonts.fontSize20Bold.copyWith(color: AppColors.white),
          ),
        ),
      ],
    );
  }
}