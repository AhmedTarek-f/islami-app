import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/core/constants/app_colors.dart';
import 'package:islami_app/features/azkar/data/models/azkar_model/azkar_model.dart';
import 'package:islami_app/features/azkar/presentation/views/widgets/azkar_content.dart';
import 'package:islami_app/features/azkar/presentation/views/widgets/azkar_title.dart';
import 'package:islami_app/features/azkar/presentation/views_model/azkar_cubit.dart';

class AzkarItem extends StatelessWidget {
  const AzkarItem({super.key, required this.azkarData, required this.index});
  final AzkarModel azkarData;
  final int index;
  @override
  Widget build(BuildContext context) {
    final controller = BlocProvider.of<AzkarCubit>(context);
    return Container(
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
          AzkarTitle(
            azkarTitle: "${azkarData.category} ${index + 1}",
          ),
          AzkarContent(
            azkarData: azkarData,
          ),
        ],
      ),
    );
  }
}
