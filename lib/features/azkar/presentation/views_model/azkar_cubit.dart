import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami_app/features/azkar/presentation/views_model/azkar_state.dart';

class AzkarCubit extends Cubit<AzkarState> {
  AzkarCubit() : super(AzkarInitial()) {
    onInit();
  }

  late final PageController pageController;
  int currentIndex = 0;
  void onInit() {
    pageController = PageController(
      viewportFraction: 0.75,
    );
  }

  void getCurrentPageIndex({required int index}) {
    currentIndex = index;
    emit(ChangeAzkarPageIndexState());
  }

  @override
  Future<void> close() {
    pageController.dispose();
    return super.close();
  }
}
