import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami_app/core/cache/shared_preferences_helper.dart';
import 'package:islami_app/core/constants/app_constants.dart';
import 'package:islami_app/core/constants/app_data/app_data.dart';
import 'package:islami_app/features/navigation_menu/presentation/views/navigation_menu_view.dart';
import 'package:islami_app/features/navigation_menu/presentation/views_model/menu_bottom_navigation_cubit.dart';
import 'package:islami_app/features/on_boarding/data/models/on_boarding_model.dart';
import 'package:islami_app/features/on_boarding/presentation/views_model/on_boarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit() : super(OnBoardingInitial()) {
    onInit();
  }
  late PageController onBoardingPageController;
  late OnBoardingModel currentOnBoarding;
  int currentPageIndex = 0;

  void onInit() {
    currentOnBoarding = AppData.onBoardingList[currentPageIndex];
    onBoardingPageController = PageController();
  }

  void getCurrentIndex(int index) {
    currentPageIndex = index;
    emit(ChangingOnBoardingScreenState());
  }

  Future<void> finishButton({required BuildContext context}) async {
    await SharedPreferencesHelper.saveBool(
      key: AppConstants.isHomeScreenKey,
      value: true,
    );
    if (context.mounted) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => BlocProvider<MenuBottomNavigationCubit>(
            create: (context) => MenuBottomNavigationCubit(),
            child: const NavigationMenuView(),
          ),
        ),
      );
    }
  }

  void moveToSelectedPage({required int index}) {
    onBoardingPageController.jumpToPage(index);
    emit(ChangingOnBoardingScreenState());
  }

  void moveToNextPage() {
    onBoardingPageController.nextPage(
        duration: const Duration(milliseconds: 500), curve: Curves.linear);
    emit(ChangingOnBoardingScreenState());
  }

  void moveToPreviousPage() {
    onBoardingPageController.previousPage(
        duration: const Duration(milliseconds: 500), curve: Curves.linear);
    emit(ChangingOnBoardingScreenState());
  }

  @override
  Future<void> close() {
    onBoardingPageController.dispose();
    return super.close();
  }
}
