import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/core/common_widgets/islami_logo.dart';
import 'package:islami_app/core/constants/app_colors.dart';
import 'package:islami_app/core/constants/app_fonts.dart';
import 'package:islami_app/core/utils/loaders/loaders.dart';
import 'package:islami_app/features/time/presentation/views/widgets/azkar_row.dart';
import 'package:islami_app/features/time/presentation/views/widgets/azkar_row_shimmer.dart';
import 'package:islami_app/features/time/presentation/views/widgets/pray_time_container.dart';
import 'package:islami_app/features/time/presentation/views/widgets/pray_time_empty_container.dart';
import 'package:islami_app/features/time/presentation/views/widgets/pray_time_shimmer.dart';
import 'package:islami_app/features/time/presentation/views_model/time_cubit.dart';
import 'package:islami_app/features/time/presentation/views_model/time_state.dart';

class TimeViewBody extends StatelessWidget {
  const TimeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = BlocProvider.of<TimeCubit>(context);
    return RPadding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IslamiLogo(
            logoWidth: 291.w,
            logoHeight: 171.h,
          ),
          BlocConsumer<TimeCubit, TimeState>(
            buildWhen: (previous, current) =>
                current is FetchAlAdanTimesSuccessState ||
                current is FetchAlAdanTimesFailureState,
            listener: (context, state) {
              if (state is FetchAlAdanTimesFailureState) {
                Loaders.customSnackBar(
                  title: "Oh snap!",
                  message: state.errorMessage,
                  context: context,
                  loaderBackgroundColor: AppColors.red,
                );
              }
            },
            builder: (context, state) => controller.isAlAdanLoading
                ? const PrayTimeShimmer()
                : controller.alAdanTimes != null
                    ? PrayTimeContainer(
                        alAdanTimesData: controller.alAdanTimes!,
                      )
                    : const PrayTimeEmptyContainer(),
          ),
          const RSizedBox(
            height: 20,
          ),
          Text(
            "Azkar",
            style: AppFonts.fontSize16Bold.copyWith(color: AppColors.white),
          ),
          const RSizedBox(
            height: 20,
          ),
          BlocConsumer<TimeCubit, TimeState>(
            buildWhen: (previous, current) =>
                current is LoadAzkarSuccessState ||
                current is LoadAzkarFailureState,
            listener: (context, state) {
              if (state is LoadAzkarFailureState) {
                Loaders.customSnackBar(
                  title: "Oh Snap!",
                  message: state.errorMessage,
                  context: context,
                  loaderBackgroundColor: AppColors.red,
                );
              }
            },
            builder: (context, state) => controller.isAzkarLoading
                ? const AzkarRowShimmer()
                : const AzkarRow(),
          ),
          const RSizedBox(
            height: 21,
          ),
        ],
      ),
    );
  }
}
