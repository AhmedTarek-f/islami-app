import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/core/constants/app_colors.dart';
import 'package:islami_app/core/constants/app_images.dart';
import 'package:islami_app/features/sebha/presentation/views/widgets/sebha_view_body.dart';
import 'package:islami_app/features/sebha/presentation/views_model/sebha_cubit.dart';

class SebhaView extends StatelessWidget {
  const SebhaView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().screenWidth,
      decoration: const BoxDecoration(
          color: AppColors.black,
          image: DecorationImage(
              image: AssetImage(
                AppImages.sebhaScreenBackground,
              ),
            fit: BoxFit.cover
          )
      ),
      child: BlocProvider<SebhaCubit>(
          create: (context) => SebhaCubit(),
          child: const SafeArea(
              child: SebhaViewBody(),
          ),
      ),
    );
  }
}
