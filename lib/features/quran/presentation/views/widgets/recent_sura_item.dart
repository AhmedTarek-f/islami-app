import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/core/constants/app_colors.dart';
import 'package:islami_app/core/constants/app_fonts.dart';
import 'package:islami_app/core/constants/app_images.dart';
import 'package:islami_app/features/quran/data/models/sura_model.dart';
import 'package:islami_app/features/quran/presentation/views_model/quran_cubit.dart';
import 'package:islami_app/features/quran_details/presentation/views/quran_details_view.dart';
import 'package:islami_app/features/quran_details/presentation/views_model/quran_details_cubit.dart';

class RecentSuraItem extends StatelessWidget {
  const RecentSuraItem({super.key, required this.suraData});
  final SuraModel suraData;
  @override
  Widget build(BuildContext context) {
    final controller = BlocProvider.of<QuranCubit>(context);
    return Container(
      height: 150.h,
      width: 283.w,
      padding: EdgeInsets.symmetric(horizontal: 9.w,vertical: 7.h),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: GestureDetector(
        onTap: (){
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => BlocProvider<QuranDetailsCubit>(
                create: (context) => QuranDetailsCubit(suraNumber: suraData.suraNumber),
                child: QuranDetailsView(suraData: suraData),
              ),
            ),
          );
          controller.saveSuraToRecent(suraId: suraData.suraNumber);
        },
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 8.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      suraData.suraNameEn,
                      style: AppFonts.fontSize24Bold.copyWith(color: AppColors.black),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      suraData.suraNameAr,
                      style: AppFonts.fontSize24Bold.copyWith(color: AppColors.black),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      "${suraData.versesNumber} Verses",
                      style: AppFonts.fontSize14Bold,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
            Image.asset(
              AppImages.mostRecentlySuraImage,
              width: 151.w,
            )
          ],
        ),
      ),
    );
  }
}