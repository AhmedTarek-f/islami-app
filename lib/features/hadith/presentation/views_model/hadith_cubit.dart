import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami_app/core/constants/app_data/app_data.dart';
import 'package:islami_app/features/hadith/presentation/views_model/hadith_state.dart';

class HadithCubit extends Cubit<HadithState> {
  HadithCubit() : super(HadithInitial()){
    onInit();
  }

  bool isLoading = false;
  String hadithData = "";
  late final PageController pageController;
  int currentIndex = 0;
  void onInit(){
    pageController = PageController(
      viewportFraction: 0.75,
    );
    loadHadithData();
  }

  void getCurrentPageIndex({required int index}){
    currentIndex = index;
    emit(ChangeHadithPageIndexState());
  }

  Future<void> loadHadithData() async{
    try{
      isLoading = true;
      emit(LoadHadithLoadingState());
      for(int i =0 ; i<50 ; i++){
        String hadithDataSeparated = await rootBundle.loadString("assets/hadith_data/h${(i+1).toString()}.txt");
        List<String> hadithLines = hadithDataSeparated.split("\n");
        for(int j =0 ; j<hadithLines.length ; j++){
          hadithData += hadithLines[j].trim();
        }
        AppData.hadithList[i].hadithContent = hadithData;
        hadithData = "";
      }
      isLoading = false;
      emit(LoadHadithSuccessState());
    }
    catch(e){
      emit(LoadHadithFailureState(failureMessage: "An error has occurred while loading sura: ${e.toString()}"));
    }
  }

  @override
  Future<void> close() {
    pageController.dispose();
    return super.close();
  }
}
