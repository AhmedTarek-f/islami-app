import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/features/quran/presentation/views/widgets/recent_sura_item.dart';
import 'package:islami_app/features/quran/presentation/views_model/quran_cubit.dart';
import 'package:islami_app/features/quran/presentation/views_model/quran_state.dart';

class RecentSurasList extends StatelessWidget {
  const RecentSurasList({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = BlocProvider.of<QuranCubit>(context);
    return SizedBox(
      height: 150.h,
      child: BlocBuilder<QuranCubit,QuranState>(
        buildWhen: (previous, current) => current is AddSuraToRecent,
        builder:(context, state) => ListView.separated(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) => RecentSuraItem(suraData: controller.recentSurasList[index]),
            separatorBuilder: (context, index) => SizedBox(width: 10.w,),
            itemCount: controller.recentSurasList.length
        ),
      ),
    );
  }
}