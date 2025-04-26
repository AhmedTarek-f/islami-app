import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/core/constants/app_images.dart';
import 'package:islami_app/features/quran/presentation/views/widgets/quran_view_body.dart';
import 'package:islami_app/features/quran/presentation/views_model/quran_cubit.dart';

class QuranView extends StatelessWidget {
  const QuranView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().screenWidth,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            AppImages.quranScreenBackground,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: BlocProvider<QuranCubit>(
        create: (context) => QuranCubit(),
        child: const SafeArea(
          child: QuranViewBody(),
        ),
      ),
    );
  }
}
