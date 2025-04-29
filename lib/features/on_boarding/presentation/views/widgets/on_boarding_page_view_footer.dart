import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/core/constants/app_colors.dart';
import 'package:islami_app/core/constants/app_data/app_data.dart';
import 'package:islami_app/core/constants/app_fonts.dart';
import 'package:islami_app/features/on_boarding/presentation/views_model/on_boarding_cubit.dart';
import 'package:islami_app/features/on_boarding/presentation/views_model/on_boarding_state.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingPageViewFooter extends StatelessWidget {
  const OnBoardingPageViewFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = BlocProvider.of<OnBoardingCubit>(context);
    return RPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: BlocBuilder<OnBoardingCubit, OnBoardingState>(
        builder: (context, state) => Row(
          children: [
            controller.currentPageIndex != 0.0
                ? GestureDetector(
                    onTap: () {
                      controller.moveToPreviousPage();
                    },
                    child: const Text(
                      "Back",
                      style: AppFonts.fontSize16Bold,
                    ),
                  )
                : SizedBox(
                    width: 40.w,
                  ),
            Expanded(
              child: Center(
                child: SmoothPageIndicator(
                  controller: controller.onBoardingPageController,
                  count: AppData.onBoardingList.length,
                  effect: ExpandingDotsEffect(
                      dotHeight: 7.r,
                      dotWidth: 7.r,
                      activeDotColor: AppColors.primary,
                      radius: 27.r,
                      dotColor: AppColors.gray,
                      spacing: 11.w),
                  onDotClicked: (index) {
                    controller.moveToSelectedPage(index: index);
                  },
                ),
              ),
            ),
            GestureDetector(
              onTap: () async {
                controller.currentPageIndex == 4
                    ? await controller.finishButton(context: context)
                    : controller.moveToNextPage();
              },
              child: Text(
                controller.currentPageIndex == 4 ? "Finish" : "Next",
                style: AppFonts.fontSize16Bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
