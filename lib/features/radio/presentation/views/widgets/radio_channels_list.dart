import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/core/common_widgets/loading_indicator.dart';
import 'package:islami_app/core/constants/app_colors.dart';
import 'package:islami_app/core/constants/app_images.dart';
import 'package:islami_app/core/utils/loaders/animation_loader.dart';
import 'package:islami_app/core/utils/loaders/loaders.dart';
import 'package:islami_app/features/radio/presentation/views/widgets/radio_item.dart';
import 'package:islami_app/features/radio/presentation/views_model/radio_cubit.dart';
import 'package:islami_app/features/radio/presentation/views_model/radio_state.dart';

class RadioChannelsList extends StatelessWidget {
  const RadioChannelsList({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = BlocProvider.of<RadioCubit>(context);
    return BlocConsumer<RadioCubit,RadioState>(
      buildWhen: (previous, current) => current is GetRadioChannelsSuccessState || current is GetRadioChannelsFailureState,
      listener: (context, state) {
        if(state is GetRadioChannelsFailureState){
          Loaders.customSnackBar(
              title: "Oh Snap!",
              message: state.errorMessage,
              context: context,
              loaderBackgroundColor: AppColors.red
          );
        }
      },
      builder: (context, state) =>
          state is GetRadioChannelsLoadingState?
          const LoadingIndicator():
          controller.radiosList.isEmpty?
          const AnimationLoaderWidget(text: "There are no radio channels available right now.", animation: AppImages.emptyAnimation):
          BlocBuilder<RadioCubit,RadioState>(
            buildWhen: (previous, current) => current is PlayingAudioState || current is PausingAudioState || current is LoadAudioState,
            builder: (context, state) => ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (_, index) => RadioItem(radioData: controller.radiosList[index]),
                separatorBuilder: (_, __) => SizedBox(height: 8.h,),
                itemCount: controller.radiosList.length
            ),
          ),
    );
  }
}