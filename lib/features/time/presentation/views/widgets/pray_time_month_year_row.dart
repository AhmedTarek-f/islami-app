import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/core/constants/app_colors.dart';
import 'package:islami_app/core/constants/app_fonts.dart';
import 'package:islami_app/features/time/data/models/time_model/time_model.dart';

class PrayTimeMonthYearRow extends StatelessWidget {
  const PrayTimeMonthYearRow({
    super.key,
    required this.alAdanTimesData,
  });

  final TimeModel alAdanTimesData;

  @override
  Widget build(BuildContext context) {
    return RPadding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RPadding(
                  padding: const EdgeInsets.only(top: 14),
                  child: Text(
                    "${alAdanTimesData.date!.gregorian!.day!} ${alAdanTimesData.date!.gregorian!.month!.en!.substring(0, 3)},",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppFonts.fontSize16Bold
                        .copyWith(color: AppColors.white),
                  ),
                ),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    alAdanTimesData.date!.gregorian!.year!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppFonts.fontSize16Bold
                        .copyWith(color: AppColors.white),
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              RPadding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Text(
                  "Pray Time",
                  style: AppFonts.fontSize20Bold.copyWith(
                    color: AppColors.black.withValues(
                      alpha: 0.71,
                    ),
                  ),
                ),
              ),
              Text(
                alAdanTimesData.date!.gregorian!.weekday!.en!,
                style: AppFonts.fontSize20Bold.copyWith(
                  color: AppColors.black.withValues(
                    alpha: 0.9,
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            width: 80.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                RPadding(
                  padding: const EdgeInsets.only(top: 14),
                  child: Text(
                    "${alAdanTimesData.date!.hijri!.day!} ${alAdanTimesData.date!.hijri!.month!.en!.substring(0, 3)},",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppFonts.fontSize16Bold
                        .copyWith(color: AppColors.white),
                  ),
                ),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    alAdanTimesData.date!.hijri!.year!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppFonts.fontSize16Bold
                        .copyWith(color: AppColors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
