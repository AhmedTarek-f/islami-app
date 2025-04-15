import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/core/common_widgets/islami_logo.dart';
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
          IslamiLogo(logoHeight: 171.h,logoWidth: 291.w,),
          const Expanded(child: OnBoardingPageView()),
          const OnBoardingPageViewFooter(),
        ],
      ),
    );
  }
}