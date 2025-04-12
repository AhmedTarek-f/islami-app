import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami_app/core/constants/app_images.dart';
import 'package:islami_app/features/on_boarding/data/models/on_boarding_model.dart';
import 'package:islami_app/features/on_boarding/presentation/views_model/on_boarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit() : super(OnBoardingInitial()){
    onInit();
  }
  late final PageController onBoardingPageController;
  late OnBoardingModel currentOnBoarding;
  int currentPageIndex = 0;
  final List<OnBoardingModel> onBoardingList = const [
    OnBoardingModel(
      image: AppImages.onBoarding1,
      title: "Welcome To Islmi App",
    ),
    OnBoardingModel(
        image: AppImages.onBoarding2,
        title: "Welcome To Islami",
        subTitle: "We Are Very Excited To Have You In Our Community"
    ),
    OnBoardingModel(
        image: AppImages.onBoarding3,
        title: "Reading the Quran",
        subTitle: "Read, and your Lord is the Most Generous"
    ),
    OnBoardingModel(
        image: AppImages.onBoarding4,
        title: "Bearish",
        subTitle: "Praise the name of your Lord, the Most High"
    ),
    OnBoardingModel(
        image: AppImages.onBoarding5,
        title: "Holy Quran Radio",
        subTitle: "You can listen to the Holy Quran Radio through the application for free and easily"
    ),
  ];


  void onInit(){
    onBoardingPageController = PageController();
    currentOnBoarding = onBoardingList[currentPageIndex];
  }

  void getCurrentIndex(int index){
    currentPageIndex = index;
    emit(ChangingOnBoardingScreenState());
  }

  void moveToSelectedPage({required int index}){
    onBoardingPageController.jumpToPage(index);
    currentPageIndex = index;
    emit(ChangingOnBoardingScreenState());
  }
  void moveToNextPage(){
    onBoardingPageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.linear
    );
    emit(ChangingOnBoardingScreenState());
  }
  void moveToPreviousPage(){
    onBoardingPageController.previousPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.linear
    );
    emit(ChangingOnBoardingScreenState());
  }

  @override
  Future<void> close() {
    onBoardingPageController.dispose();
    return super.close();
  }
}
