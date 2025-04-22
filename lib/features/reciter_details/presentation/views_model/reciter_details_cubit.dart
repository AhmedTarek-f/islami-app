import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami_app/core/constants/app_data/app_data.dart';
import 'package:islami_app/features/radio/data/models/reciters_model/reciter_model.dart';
import 'package:islami_app/features/reciter_details/data/models/reciter_sura_model.dart';
import 'package:islami_app/features/reciter_details/presentation/views_model/reciter_details_state.dart';

class ReciterDetailsCubit extends Cubit<ReciterDetailsState> {
  ReciterDetailsCubit({required ReciterModel reciterDetailsData})
      :reciterData = reciterDetailsData,
       super(ReciterDetailsInitial()){
        onInit();
      }

  final ReciterModel reciterData;
  List<ReciterSuraModel> surasList = [];

  void onInit(){
    getReciterSurasList();
  }

  void getReciterSurasList(){
    List<String> surasListNumbers = reciterData.moshaf.first.surahList!.split(",");
    for(int i=0; i<surasListNumbers.length; i++){
      for(int j=i ; j<AppData.surasList.length; j++){
        if(surasListNumbers[i] == AppData.surasList[j].suraNumber){
          surasList.add(ReciterSuraModel(suraData: AppData.surasList[j],sureServer: reciterData.moshaf.first.server!));
          break;
        }
      }
    }
  }

}
