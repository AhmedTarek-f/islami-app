import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami_app/core/common_widgets/custom_button.dart';
import 'package:islami_app/core/constants/app_colors.dart';
import 'package:islami_app/features/radio/presentation/views_model/radio_cubit.dart';
import 'package:islami_app/features/radio/presentation/views_model/radio_state.dart';

class RadioRecitersButtonsRow extends StatelessWidget {
  const RadioRecitersButtonsRow({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = BlocProvider.of<RadioCubit>(context);
    return BlocBuilder<RadioCubit,RadioState>(
      buildWhen: (previous, current) => current is ToggleRadioOrRecitersState,
      builder: (context, state) => Row(
        children: [
          Expanded(
            child: CustomButton(
              buttonTitle: "Radio",
              onPressed: () async {
                await controller.toggleRadioOrReciters(buttonTitle: "radio");
              },
              backgroundColor: controller.isRadio? AppColors.primary: AppColors.black.withValues(alpha: 0.7),
              buttonTitleColor: controller.isRadio? AppColors.black : AppColors.white,
            ),
          ),
          Expanded(
            child: CustomButton(
              buttonTitle: "Reciters",
              onPressed: () async{
                await controller.toggleRadioOrReciters(buttonTitle: "reciters");
              },
              backgroundColor: !controller.isRadio? AppColors.primary: AppColors.black.withValues(alpha: 0.7),
              buttonTitleColor: !controller.isRadio? AppColors.black : AppColors.white,
            ),
          ),

        ],
      ),
    );
  }
}