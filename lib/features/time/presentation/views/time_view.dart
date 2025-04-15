import 'package:flutter/material.dart';
import 'package:islami_app/core/constants/app_images.dart';
import 'package:islami_app/features/time/presentation/views/widgets/time_view_body.dart';

class TimeView extends StatelessWidget {
  const TimeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(AppImages.timeScreenBackground),
          fit: BoxFit.cover,
        ),
      ),
      child: const TimeViewBody(),
    );
  }
}
