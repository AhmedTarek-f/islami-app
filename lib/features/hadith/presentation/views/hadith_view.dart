import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/core/constants/app_colors.dart';
import 'package:islami_app/core/constants/app_images.dart';
import 'package:islami_app/features/hadith/presentation/views/widgets/hadith_view_body.dart';
import 'package:islami_app/features/hadith/presentation/views_model/hadith_cubit.dart';

class HadithView extends StatelessWidget {
  const HadithView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().screenWidth,
      decoration: const BoxDecoration(
        color: AppColors.black,
        image: DecorationImage(
            image: AssetImage(
                AppImages.hadithScreenBackground,
            ),
          alignment: Alignment.topCenter
        )
      ),
      child: BlocProvider<HadithCubit>(
        create: (context) => HadithCubit(),
        child: const SafeArea(
            child: HadithViewBody()
        ),
      ),
    );
  }
}
