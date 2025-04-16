import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami_app/features/quran/presentation/views_model/quran_state.dart';

class QuranCubit extends Cubit<QuranState> {
  QuranCubit() : super(QuranInitial());
  bool isLoading = false;
  Future<String> loadSuraData({required int suraNumber}) async{
    try{
      isLoading = true;
      emit(LoadSuraLoadingState());
      final String suraData = await rootBundle.loadString("lib/core/constants/app_data/suras_data/$suraNumber.txt");
      isLoading = false;
      emit(LoadSuraSuccessState());
      return suraData;
    }
    catch(e){
      emit(LoadSuraFailureState(failureMessage: "An error hass ocurred while loading sura: ${e.toString()}"));
      return "";
    }
  }
}
