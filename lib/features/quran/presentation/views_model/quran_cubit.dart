import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami_app/core/cache/shared_preferences_helper.dart';
import 'package:islami_app/core/constants/app_constants.dart';
import 'package:islami_app/core/constants/app_data/app_data.dart';
import 'package:islami_app/features/quran/data/models/sura_model.dart';
import 'package:islami_app/features/quran/presentation/views_model/quran_state.dart';

class QuranCubit extends Cubit<QuranState> {
  QuranCubit() : super(QuranInitial()){
    onInit();
  }
  List<SuraModel> surasSearchList = [];
  List<SuraModel> recentSurasList = [];
  List<String> recentSurasIds = [];

  void onInit(){
    recentSurasIds = getRecentSurasIds();
    getRecentSurasList();
  }

  void suraSearch({required String suraName}){
    surasSearchList.clear();
    if(suraName.isNotEmpty && suraName.trim() != ""){
      final List<SuraModel> matchedList = AppData.surasList.where((sura) => sura.suraNameAr.contains(suraName) || sura.suraNameEn.toLowerCase().contains(suraName) ,).toList();
      surasSearchList.addAll(matchedList);
    }
    emit(SuraSearchState());
  }

  List<String> getRecentSurasIds(){
    return SharedPreferencesHelper.getStringList(key: AppConstants.suraId);
  }

  Future<void> saveSuraToRecent({required String suraId}) async{
    if(!recentSurasIds.contains(suraId)){
      if(recentSurasIds.length >6){
        recentSurasIds.insert(0, suraId);
        recentSurasIds.removeLast();
        recentSurasList.insert(0, AppData.surasList.firstWhere((sura) => sura.suraNumber == suraId));
        recentSurasList.removeLast();
        await SharedPreferencesHelper.saveStringList(key: AppConstants.suraId, value: recentSurasIds);
        emit(AddSuraToRecent());
      }
      else{
        recentSurasIds.insert(0, suraId);
        recentSurasList.insert(0, AppData.surasList.firstWhere((sura) => sura.suraNumber == suraId));
        await SharedPreferencesHelper.saveStringList(key: AppConstants.suraId, value: recentSurasIds);
        emit(AddSuraToRecent());
      }
    }
    else{
      int savedBeforeSuraIndex = recentSurasIds.indexWhere((sura)=> sura == suraId);
      recentSurasIds.insert(0, suraId);
      recentSurasList.insert(0, AppData.surasList.firstWhere((sura) => sura.suraNumber == suraId));
      recentSurasIds.removeAt(savedBeforeSuraIndex+1);
      recentSurasList.removeAt(savedBeforeSuraIndex+1);
      await SharedPreferencesHelper.saveStringList(key: AppConstants.suraId, value: recentSurasIds);
      emit(AddSuraToRecent());
    }
  }

  void getRecentSurasList(){
    for(int i =0 ; i<recentSurasIds.length ; i++){
      for(int j =0 ; j<AppData.surasList.length; j++){
        if(recentSurasIds[i] == AppData.surasList[j].suraNumber){
          recentSurasList.add(AppData.surasList[j]);
          break;
        }
      }
    }
  }
}