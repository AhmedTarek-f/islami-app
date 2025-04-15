import 'package:flutter/material.dart';
import 'package:islami_app/core/constants/app_colors.dart';
import 'package:islami_app/core/constants/app_images.dart';
import 'package:islami_app/features/hadith/presentation/views/widgets/hadith_view_body.dart';

class HadithView extends StatelessWidget {
  const HadithView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      decoration: const BoxDecoration(
        color: AppColors.black,
        image: DecorationImage(
            image: AssetImage(
                AppImages.hadithScreenBackground,
            ),
          alignment: Alignment.topCenter
        )
      ),
      child: const HadithViewBody(),
    );
  }
}
