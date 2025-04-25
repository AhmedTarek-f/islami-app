import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/features/time/presentation/views/widgets/pray_time_item.dart';
import 'package:islami_app/features/time/presentation/views_model/time_cubit.dart';
import 'package:islami_app/features/time/presentation/views_model/time_state.dart';

class PrayTimePageView extends StatelessWidget {
  const PrayTimePageView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = BlocProvider.of<TimeCubit>(context);
    return BlocBuilder<TimeCubit, TimeState>(
      buildWhen: (previous, current) =>
          current is ChangeCurrentPrayTimePageIndexState,
      builder: (context, state) => SizedBox(
        height: 138.h,
        child: PageView.builder(
          physics: const BouncingScrollPhysics(),
          controller: controller.prayTimePageController,
          onPageChanged: (value) =>
              controller.changeCurrentPrayTimePageIndex(index: value),
          itemBuilder: (context, index) => PrayTimeItem(
            prayTimeData: controller.prayTimeList[index],
            isSelected: index == controller.currentPrayTimePageIndex,
          ),
          itemCount: controller.prayTimeList.length,
        ),
      ),
    );
  }
}
