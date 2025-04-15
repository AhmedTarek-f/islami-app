import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:islami_app/core/constants/app_data/app_data.dart';
import 'package:islami_app/features/navigation_menu/presentation/views/navigation_menu_view.dart';
import 'package:islami_app/features/navigation_menu/presentation/views_model/menu_bottom_navigation_cubit.dart';
import 'package:islami_app/features/on_boarding/data/models/on_boarding_model.dart';
import 'package:islami_app/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:islami_app/features/on_boarding/presentation/views_model/on_boarding_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit() : super(OnBoardingInitial()){
    onInit();
  }
  late PageController onBoardingPageController;
  late OnBoardingModel currentOnBoarding;
  late final SharedPreferences prefs;
  bool? isFirstTime;
  int currentPageIndex = 0;


  Future<void> onInit() async{
    await checkUserLoggedInBefore();
    onBoardingPageController = PageController();
    currentOnBoarding = AppData.onBoardingList[currentPageIndex];
  }

  void getCurrentIndex(int index){
    currentPageIndex = index;
    emit(ChangingOnBoardingScreenState());
  }

  Future<void> checkUserLoggedInBefore() async {
    prefs  = await SharedPreferences.getInstance();
    isFirstTime = prefs.getBool("isFirstTime");
    FlutterNativeSplash.remove();
  }

  void finishButton({required BuildContext context}){
    prefs.setBool("isFirstTime", false);
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => BlocProvider<MenuBottomNavigationCubit>(
            create: (context) => MenuBottomNavigationCubit(),
            child: const NavigationMenuView()
        ),
      ),
    );
  }

  Widget screenRedirect() {
    if(isFirstTime != null){
      return BlocProvider<MenuBottomNavigationCubit>(
          create:(context) => MenuBottomNavigationCubit(),
          child: const NavigationMenuView()
      );
    }
    else{
      return const OnBoardingView();
    }
  }

  void moveToSelectedPage({required int index}){
    onBoardingPageController.jumpToPage(index);
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
