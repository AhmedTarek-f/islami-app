import 'package:flutter/material.dart';
import 'package:islami_app/core/constants/app_colors.dart';
import 'package:islami_app/core/constants/app_images.dart';
import 'package:islami_app/features/radio/presentation/views/widgets/radio_view_body.dart';

class RadioView extends StatelessWidget {
  const RadioView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      decoration: const BoxDecoration(
          color: AppColors.black,
          image: DecorationImage(
              image: AssetImage(
                AppImages.radioScreenBackground,
              ),
              fit: BoxFit.cover
          )
      ),
      child: const RadioViewBody(),
    );
  }
}
