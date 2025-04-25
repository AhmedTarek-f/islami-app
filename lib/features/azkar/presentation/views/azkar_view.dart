import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/core/constants/app_colors.dart';
import 'package:islami_app/core/constants/app_images.dart';
import 'package:islami_app/features/azkar/data/models/azkar_model/azkar_model.dart';
import 'package:islami_app/features/azkar/presentation/views/widgets/azkar_app_bar.dart';
import 'package:islami_app/features/azkar/presentation/views/widgets/azkar_view_body.dart';
import 'package:islami_app/features/azkar/presentation/views_model/azkar_cubit.dart';

class AzkarView extends StatelessWidget {
  const AzkarView({super.key, required this.azkarList});
  final List<AzkarModel> azkarList;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().screenWidth,
      decoration: const BoxDecoration(
        color: AppColors.black,
        image: DecorationImage(
          image: AssetImage(
            AppImages.timeScreenBackground,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        appBar: AzkarAppBar(azkarCategory: azkarList.first.category),
        backgroundColor: Colors.transparent,
        body: BlocProvider<AzkarCubit>(
          create: (context) => AzkarCubit(),
          child: SafeArea(
            child: AzkarViewBody(
              azkarList: azkarList,
            ),
          ),
        ),
      ),
    );
  }
}
