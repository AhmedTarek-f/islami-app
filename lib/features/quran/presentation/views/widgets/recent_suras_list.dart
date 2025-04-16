import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/core/constants/app_data/app_data.dart';
import 'package:islami_app/features/quran/presentation/views/widgets/recent_sura_item.dart';
import 'package:islami_app/features/quran/presentation/views_model/quran_cubit.dart';

class RecentSurasList extends StatelessWidget {
  const RecentSurasList({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = BlocProvider.of<QuranCubit>(context);
    return SizedBox(
      height: 150.h,
      child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) => RecentSuraItem(suraData: AppData.surasList[index]),
          separatorBuilder: (context, index) => SizedBox(width: 10.w,),
          itemCount: AppData.surasList.length
      ),
    );
  }
}