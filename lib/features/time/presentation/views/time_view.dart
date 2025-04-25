import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/core/constants/app_images.dart';
import 'package:islami_app/features/time/presentation/views/widgets/time_view_body.dart';
import 'package:islami_app/features/time/presentation/views_model/time_cubit.dart';

class TimeView extends StatelessWidget {
  const TimeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().screenWidth,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.timeScreenBackground),
          fit: BoxFit.cover,
        ),
      ),
      child: BlocProvider<TimeCubit>(
        create: (context) => TimeCubit(),
        child: const SafeArea(
          child: TimeViewBody(),
        ),
      ),
    );
  }
}
