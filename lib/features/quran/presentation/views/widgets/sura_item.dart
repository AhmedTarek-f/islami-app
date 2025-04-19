import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/core/constants/app_colors.dart';
import 'package:islami_app/core/constants/app_fonts.dart';
import 'package:islami_app/features/quran/data/models/sura_model.dart';
import 'package:islami_app/features/quran/presentation/views/widgets/sura_number.dart';
import 'package:islami_app/features/quran/presentation/views_model/quran_cubit.dart';
import 'package:islami_app/features/quran_details/presentation/views/quran_details_view.dart';
import 'package:islami_app/features/quran_details/presentation/views_model/quran_details_cubit.dart';

class SuraItem extends StatelessWidget {
  const SuraItem({super.key, required this.suraData});
  final SuraModel suraData;
  @override
  Widget build(BuildContext context) {
    final controller = BlocProvider.of<QuranCubit>(context);
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => BlocProvider<QuranDetailsCubit>(
              create: (context) => QuranDetailsCubit(suraNumber: suraData.suraNumber),
              child: QuranDetailsView(
                  suraData: suraData
              ),
            ),
          ),
        );
        controller.saveSuraToRecent(suraId: suraData.suraNumber);
      },
      child: Row(
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
      ),
    );
  }
}