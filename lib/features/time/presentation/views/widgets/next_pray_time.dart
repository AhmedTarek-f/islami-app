import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami_app/core/constants/app_colors.dart';
import 'package:islami_app/core/constants/app_fonts.dart';
import 'package:islami_app/core/constants/app_icons.dart';
import 'package:islami_app/features/time/presentation/views_model/time_cubit.dart';

class NextPrayTime extends StatelessWidget {
  const NextPrayTime({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = BlocProvider.of<TimeCubit>(context);
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        Positioned(
          right: 27.5.w,
          child: SvgPicture.asset(
            AppIcons.timeSoundOff,
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Text(
                "Next Pray - ${controller.nextPrayTime}",
                style: AppFonts.fontSize16Bold.copyWith(
                  color: AppColors.black.withValues(
                    alpha: 0.75,
                  ),
                ),
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
