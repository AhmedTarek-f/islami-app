import 'package:flutter/material.dart';
import 'package:islami_app/core/constants/app_images.dart';
import 'package:islami_app/features/reciter_details/presentation/views/widgets/reciter_details_app_bar.dart';
import 'package:islami_app/features/reciter_details/presentation/views/widgets/reciter_details_view_body.dart';

class ReciterDetailsView extends StatelessWidget {
  const ReciterDetailsView({super.key,});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(AppImages.radioScreenBackground),
          fit: BoxFit.cover
        )
      ),
      child: const Scaffold(
        backgroundColor: Colors.transparent,
        appBar: ReciterDetailsAppBar(),
        body: ReciterDetailsViewBody(),
      ),
    );
  }
}
