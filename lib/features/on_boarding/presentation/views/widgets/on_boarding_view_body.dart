import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/core/constants/app_images.dart';
import 'package:islami_app/features/on_boarding/presentation/views/widgets/on_boarding_page_view.dart';
import 'package:islami_app/features/on_boarding/presentation/views/widgets/on_boarding_page_view_footer.dart';

class OnBoardingViewBody extends StatelessWidget {
  const OnBoardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return RPadding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        children: [
          RPadding(
            padding: const EdgeInsets.symmetric(horizontal: 69.5),
              child: Image.asset(
                  AppImages.islamiMosqueLogo
              ),
          ),
          const Expanded(child: OnBoardingPageView()),
          const OnBoardingPageViewFooter(),
        ],
      ),
    );
  }
}