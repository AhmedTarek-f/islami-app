import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/core/constants/app_colors.dart';
import 'package:islami_app/features/hadith/data/models/hadith_model.dart';
import 'package:islami_app/features/hadith/presentation/views/widgets/hadith_content.dart';
import 'package:islami_app/features/hadith/presentation/views/widgets/hadith_title.dart';
import 'package:islami_app/features/hadith/presentation/views_model/hadith_cubit.dart';
import 'package:islami_app/features/hadith_details/presentation/views/hadith_details_view.dart';

class HadithItem extends StatelessWidget {
  const HadithItem({super.key, required this.hadithData, required this.index});
  final HadithModel hadithData;
  final int index;
  @override
  Widget build(BuildContext context) {
    final controller = BlocProvider.of<HadithCubit>(context);
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => HadithDetailsView(
                hadithData: hadithData
            ),
          ),
        );
      },
      child: Container(
        margin: REdgeInsets.only(
          top: controller.currentIndex == index ? 0 : 20,
          bottom: controller.currentIndex == index ? 0 : 20,
        ),
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
      ),
    );
  }
}