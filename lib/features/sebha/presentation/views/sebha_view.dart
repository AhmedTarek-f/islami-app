import 'package:flutter/material.dart';
import 'package:islami_app/core/constants/app_colors.dart';
import 'package:islami_app/core/constants/app_images.dart';
import 'package:islami_app/features/sebha/presentation/views/widgets/sebha_view_body.dart';

class SebhaView extends StatelessWidget {
  const SebhaView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      decoration: const BoxDecoration(
          color: AppColors.black,
          image: DecorationImage(
              image: AssetImage(
                AppImages.sebhaScreenBackground,
              ),
            fit: BoxFit.cover
          )
      ),
      child: const SebhaViewBody(),
    );
  }
}
