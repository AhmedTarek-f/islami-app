import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/core/constants/app_data/app_data.dart';
import 'package:islami_app/features/hadith/presentation/views/widgets/hadith_item.dart';
import 'package:islami_app/features/hadith/presentation/views_model/hadith_cubit.dart';
import 'package:islami_app/features/hadith/presentation/views_model/hadith_state.dart';

class HadithPageView extends StatelessWidget {
  const HadithPageView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = BlocProvider.of<HadithCubit>(context);
    return BlocBuilder<HadithCubit,HadithState>(
      buildWhen: (previous, current) => current is ChangeHadithPageIndexState,
      builder: (context, state) => PageView.builder(
        physics: const BouncingScrollPhysics(),
        controller: controller.pageController,
        scrollDirection: Axis.horizontal,
        onPageChanged: (value) => controller.getCurrentPageIndex(index: value),
        itemBuilder: (context, index) => RPadding(
          padding: const EdgeInsets.only(right: 16),
          child: HadithItem(hadithData: AppData.hadithList[index],index: index,),
        ),
        itemCount: AppData.hadithList.length,
      ),
    );
  }
}