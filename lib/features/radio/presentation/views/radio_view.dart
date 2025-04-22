import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/core/constants/app_colors.dart';
import 'package:islami_app/core/constants/app_images.dart';
import 'package:islami_app/features/radio/presentation/views/widgets/radio_view_body.dart';
import 'package:islami_app/features/radio/presentation/views_model/radio_cubit.dart';

class RadioView extends StatelessWidget {
  const RadioView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().screenWidth,
      decoration: const BoxDecoration(
          color: AppColors.black,
          image: DecorationImage(
              image: AssetImage(
                AppImages.radioScreenBackground,
              ),
              fit: BoxFit.cover
          )
      ),
      child: BlocProvider<RadioCubit>(
        create: (context) => RadioCubit(),
        child: const SafeArea(
          child: RadioViewBody(),
        ),
      ),
    );
  }
}
