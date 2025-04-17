import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/core/common_widgets/islami_logo.dart';
import 'package:islami_app/core/constants/app_colors.dart';
import 'package:islami_app/core/constants/app_fonts.dart';
import 'package:islami_app/features/quran/presentation/views/widgets/recent_suras_list.dart';
import 'package:islami_app/features/quran/presentation/views/widgets/sura_search_field.dart';
import 'package:islami_app/features/quran/presentation/views/widgets/suras_list.dart';
import 'package:islami_app/features/quran/presentation/views/widgets/suras_search_list.dart';
import 'package:islami_app/features/quran/presentation/views_model/quran_cubit.dart';
import 'package:islami_app/features/quran/presentation/views_model/quran_state.dart';

class QuranViewBody extends StatelessWidget {
  const QuranViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = BlocProvider.of<QuranCubit>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const IslamiLogo(),
        SizedBox(height: 21.h,),
        const SuraSearchField(),
        SizedBox(height: 20.h,),
        BlocBuilder<QuranCubit,QuranState>(
            builder: (context, state) => controller.surasSearchList.isNotEmpty?
                const SurasSearchList()
                :Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Most Recently ",
                    style: AppFonts.fontSize16Bold.copyWith(color: AppColors.offWhite),
                  ),
                  SizedBox(height: 10.h,),
                  const RecentSurasList(),
                  SizedBox(height: 10.h,),
                  Text(
                    "Suras List ",
                    style: AppFonts.fontSize16Bold.copyWith(color: AppColors.offWhite),
                  ),
                  SizedBox(height: 10.h,),
                  const SurasList(),
                ],
              ),
            ),
        )

      ],
    );
  }
}