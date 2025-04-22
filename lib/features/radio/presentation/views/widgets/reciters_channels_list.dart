import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/core/common_widgets/loading_indicator.dart';
import 'package:islami_app/core/constants/app_colors.dart';
import 'package:islami_app/core/constants/app_images.dart';
import 'package:islami_app/core/utils/loaders/animation_loader.dart';
import 'package:islami_app/core/utils/loaders/loaders.dart';
import 'package:islami_app/features/radio/presentation/views/widgets/reciter_item.dart';
import 'package:islami_app/features/radio/presentation/views_model/radio_cubit.dart';
import 'package:islami_app/features/radio/presentation/views_model/radio_state.dart';

class RecitersChannelsList extends StatelessWidget {
  const RecitersChannelsList({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = BlocProvider.of<RadioCubit>(context);
    return BlocConsumer<RadioCubit,RadioState>(
      buildWhen: (previous, current) => current is GetReciterChannelsSuccessState || current is GetReciterChannelsFailureState,
      listener: (context, state) {
        if(state is GetReciterChannelsFailureState){
          Loaders.customSnackBar(
              title: "Oh Snap!",
              message: state.errorMessage,
              context: context,
              loaderBackgroundColor: AppColors.red
          );
        }
      },
      builder: (context, state) =>
      state is GetReciterChannelsLoadingState?
      const LoadingIndicator():
      controller.recitersList.isEmpty?
      const AnimationLoaderWidget(text: "There are no reciter channels available right now.", animation: AppImages.emptyAnimation):
      BlocBuilder<RadioCubit,RadioState>(
        buildWhen: (previous, current) => current is PlayingAudioState || current is PausingAudioState || current is LoadAudioState,
        builder: (context, state) => ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (_, index) => ReciterItem(reciterData: controller.recitersList[index]),
            separatorBuilder: (_, __) => SizedBox(height: 8.h,),
            itemCount: controller.recitersList.length
        ),
      ),
    );
  }
}