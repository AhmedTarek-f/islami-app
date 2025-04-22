import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islami_app/core/common_widgets/loading_indicator.dart';
import 'package:islami_app/core/constants/app_colors.dart';
import 'package:islami_app/core/constants/app_fonts.dart';
import 'package:islami_app/core/constants/app_icons.dart';
import 'package:islami_app/core/constants/app_images.dart';
import 'package:islami_app/features/quran/presentation/views/widgets/sura_number.dart';
import 'package:islami_app/features/radio/presentation/views_model/radio_cubit.dart';
import 'package:islami_app/features/radio/presentation/views_model/radio_state.dart';
import 'package:islami_app/features/reciter_details/data/models/reciter_sura_model.dart';

class ReciterDetailsItem extends StatelessWidget {
  const ReciterDetailsItem({super.key, required this.reciterSuraData});
  final ReciterSuraModel reciterSuraData;
  @override
  Widget build(BuildContext context) {
    final radioController = BlocProvider.of<RadioCubit>(context);
    return Container(
      width: ScreenUtil().screenWidth,
      height: 133.h,
      decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(20.r),
          image: DecorationImage(
            image: AssetImage(
              reciterSuraData.isPlaying?
              AppImages.radioActiveBackground:
              AppImages.radioInactiveBackground,
            ),
            fit: BoxFit.contain,
            alignment: Alignment.bottomCenter,
          )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RPadding(
            padding: const EdgeInsets.only(top: 14.0),
            child: Text(
              reciterSuraData.suraData.suraNameEn,
              style: AppFonts.fontSize20Bold.copyWith(color: AppColors.black),
            ),
          ),
          RPadding(
            padding: const EdgeInsets.only(
              bottom: 16,
              right: 8,
              left: 12,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SuraNumber(suraNumber: reciterSuraData.suraData.suraNumber,isBlackColor: true,),
                GestureDetector(
                  onTap: () async{
                    reciterSuraData.isPlaying?
                    await radioController.pauseReciter(reciterSuraData: reciterSuraData):
                    await radioController.playReciter(reciterSuraData: reciterSuraData);
                  },
                  child: BlocBuilder<RadioCubit,RadioState>(
                    buildWhen: (previous, current) => current is LoadAudioState || current is PlayingAudioState || current is PausingAudioState,
                    builder: (context, state) => state is LoadAudioState && state.channelName == reciterSuraData.suraData.suraNumber?
                    const RPadding(
                      padding: EdgeInsets.only(left: 24.0),
                      child: LoadingIndicator(),
                    ):
                    RPadding(
                      padding: const EdgeInsets.only(left: 24.0),
                      child: SvgPicture.asset(
                        reciterSuraData.isPlaying?
                        AppIcons.pauseIcon:
                        AppIcons.playIcon,
                      ),
                    ),
                  ),
                ),
                RSizedBox(
                  width: 75,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      reciterSuraData.suraData.suraNameAr,
                      style: AppFonts.fontSize20Bold.copyWith(color: AppColors.black),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}