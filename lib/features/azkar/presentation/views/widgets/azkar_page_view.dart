import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/features/azkar/data/models/azkar_model/azkar_model.dart';
import 'package:islami_app/features/azkar/presentation/views/widgets/azkar_item.dart';
import 'package:islami_app/features/azkar/presentation/views_model/azkar_cubit.dart';
import 'package:islami_app/features/azkar/presentation/views_model/azkar_state.dart';

class AzkarPageView extends StatelessWidget {
  const AzkarPageView({
    super.key,
    required this.azkarList,
  });
  final List<AzkarModel> azkarList;

  @override
  Widget build(BuildContext context) {
    final controller = BlocProvider.of<AzkarCubit>(context);
    return BlocBuilder<AzkarCubit, AzkarState>(
      buildWhen: (previous, current) => current is ChangeAzkarPageIndexState,
      builder: (context, state) => PageView.builder(
        physics: const BouncingScrollPhysics(),
        controller: controller.pageController,
        scrollDirection: Axis.horizontal,
        onPageChanged: (value) => controller.getCurrentPageIndex(index: value),
        itemBuilder: (context, index) => RPadding(
          padding: const EdgeInsets.only(top: 90, bottom: 90, right: 16),
          child: AzkarItem(
            azkarData: azkarList[index],
            index: index,
          ),
        ),
        itemCount: azkarList.length,
      ),
    );
  }
}
