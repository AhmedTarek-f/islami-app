import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/core/constants/app_colors.dart';
import 'package:islami_app/core/constants/app_images.dart';
import 'package:islami_app/features/time/data/models/time_model/time_model.dart';
import 'package:islami_app/features/time/presentation/views/widgets/next_pray_time.dart';
import 'package:islami_app/features/time/presentation/views/widgets/pray_time_month_year_row.dart';
import 'package:islami_app/features/time/presentation/views/widgets/pray_time_page_view.dart';

class PrayTimeContainer extends StatelessWidget {
  const PrayTimeContainer({super.key, required this.alAdanTimesData});
  final TimeModel alAdanTimesData;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().screenWidth,
      height: 301.h,
      decoration: BoxDecoration(
        color: AppColors.brown,
        borderRadius: BorderRadius.circular(40.r),
        image: const DecorationImage(
          image: AssetImage(AppImages.timeBackgroundCard),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          PrayTimeMonthYearRow(alAdanTimesData: alAdanTimesData),
          SizedBox(
            height: 24.h,
          ),
          const PrayTimePageView(),
          SizedBox(
            height: 18.h,
          ),
          const NextPrayTime()
        ],
      ),
    );
  }
}
