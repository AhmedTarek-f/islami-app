import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/features/radio/presentation/views_model/radio_cubit.dart';
import 'package:islami_app/features/radio/presentation/views_model/radio_state.dart';
import 'package:islami_app/features/reciter_details/presentation/views/widgets/reciter_details_item.dart';
import 'package:islami_app/features/reciter_details/presentation/views_model/reciter_details_cubit.dart';

class ReciterDetailsViewBody extends StatelessWidget {
  const ReciterDetailsViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = BlocProvider.of<ReciterDetailsCubit>(context);
    return BlocBuilder<RadioCubit,RadioState>(
      buildWhen: (previous, current) => current is PlayingAudioState || current is PausingAudioState || current is LoadAudioState,
      builder: (context, state) => ListView.separated(
          padding: REdgeInsets.symmetric(horizontal: 8,vertical: 16),
          physics: const BouncingScrollPhysics(),
          itemBuilder: (_, index) => ReciterDetailsItem(reciterSuraData:controller.surasList[index],),
          separatorBuilder: (context, index) => const RSizedBox(height: 12,),
          itemCount: controller.surasList.length
      ),
    );
  }
}
