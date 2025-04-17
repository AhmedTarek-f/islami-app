import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami_app/features/quran_details/presentation/views_model/quran_details_state.dart';

class QuranDetailsCubit extends Cubit<QuranDetailsState> {
  QuranDetailsCubit({required String suraNumber}) : _suraNumber = suraNumber, super(QuranDetailsInitial()){
    onInit();
  }
  final String _suraNumber;
  bool isLoading = false;
  String suraData = "";

  void onInit() {
    loadSuraData(suraNumber: _suraNumber);
  }

  Future<void> loadSuraData({required String suraNumber}) async{
    try{
      isLoading = true;
      emit(LoadSuraLoadingState());
      final String suraDataSeparated = await rootBundle.loadString("assets/suras_data/$suraNumber.txt");
      List<String> suraLines = suraDataSeparated.split("\n");
      for(int i =0 ; i<suraLines.length ; i++){
        suraData += suraLines[i].trim();
        suraData += " [${i+1}] ";
      }
      isLoading = false;
      emit(LoadSuraSuccessState());
    }
    catch(e){
      emit(LoadSuraFailureState(failureMessage: "An error has occurred while loading sura: ${e.toString()}"));
    }
  }
}
