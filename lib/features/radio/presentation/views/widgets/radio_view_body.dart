import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/features/radio/presentation/views/widgets/radio_channels_list.dart';
import 'package:islami_app/features/radio/presentation/views/widgets/radio_sliver_app_bar.dart';
import 'package:islami_app/features/radio/presentation/views/widgets/reciters_channels_list.dart';
import 'package:islami_app/features/radio/presentation/views_model/radio_cubit.dart';
import 'package:islami_app/features/radio/presentation/views_model/radio_state.dart';

class RadioViewBody extends StatelessWidget {
  const RadioViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = BlocProvider.of<RadioCubit>(context);
    return NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          const RadioSliverAppBar()
        ],
        body: RPadding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: BlocBuilder<RadioCubit,RadioState>(
            buildWhen: (previous, current) => current is ToggleRadioOrRecitersState,
            builder: (context, state) => controller.isRadio?
            const RadioChannelsList():
            const RecitersChannelsList(),
          ),
        )
    );
  }
}