import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami_app/core/constants/app_data/app_data.dart';
import 'package:islami_app/features/quran/data/models/sura_model.dart';
import 'package:islami_app/features/quran/presentation/views_model/quran_state.dart';

class QuranCubit extends Cubit<QuranState> {
  QuranCubit() : super(QuranInitial());
  List<SuraModel> surasSearchList = [];
  void suraSearch({required String suraName}){
    surasSearchList.clear();
    if(suraName.isNotEmpty && suraName.trim() != ""){
      final List<SuraModel> matchedList = AppData.surasList.where((sura) => sura.suraNameAr.contains(suraName) || sura.suraNameEn.toLowerCase().contains(suraName) ,).toList();
      surasSearchList.addAll(matchedList);
    }
    emit(SuraSearchState());
  }
}
