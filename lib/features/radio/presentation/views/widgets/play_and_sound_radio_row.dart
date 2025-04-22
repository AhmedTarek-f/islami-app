import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami_app/core/common_widgets/loading_indicator.dart';
import 'package:islami_app/core/constants/app_icons.dart';
import 'package:islami_app/features/radio/data/models/radio_model.dart';
import 'package:islami_app/features/radio/presentation/views_model/radio_cubit.dart';
import 'package:islami_app/features/radio/presentation/views_model/radio_state.dart';

class PlayAndSoundRadioRow extends StatelessWidget {
  const PlayAndSoundRadioRow({
    super.key, required this.radioData,
  });
  final RadioModel radioData;
  @override
  Widget build(BuildContext context) {
    final controller = BlocProvider.of<RadioCubit>(context);
    return RPadding(
      padding: const EdgeInsets.only(
        left: 62,
        bottom: 13.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
              onTap: () async{
                radioData.isPlaying?
                await controller.pauseRadio(radioData: radioData):
                await controller.playRadio(radioData: radioData);
              },
              child: BlocBuilder<RadioCubit,RadioState>(
                buildWhen: (previous, current) => current is LoadAudioState || current is PlayingAudioState || current is PausingAudioState,
                builder: (context, state) => state is LoadAudioState && state.channelName == radioData.radioChannelName?
                const LoadingIndicator():
                SvgPicture.asset(
                  radioData.isPlaying?
                  AppIcons.pauseIcon:
                  AppIcons.playIcon,
                ),
              )
          ),
          SizedBox(width: 20.w,),
          GestureDetector(
              onTap: (){},
              child: SvgPicture.asset(
                radioData.isSoundOn?
                AppIcons.soundOnIcon:
                AppIcons.soundOffIcon,
              )
          ),
        ],
      ),
    );
  }
}