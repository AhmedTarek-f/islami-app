// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:islami_app/features/hadith_details/presentation/views_model/hadith_details_state.dart';
//
// class HadithDetailsCubit extends Cubit<HadithDetailsState> {
//   HadithDetailsCubit({required int hadithNumber}) : _hadithNumber = hadithNumber, super(HadithDetailsInitial()){
//     onInit();
//   }
//   final int _hadithNumber;
//   bool isLoading = false;
//   String hadithData = "";
//
//   void onInit() {
//     loadHadithData(hadithNumber: _hadithNumber);
//   }
//
//   Future<void> loadHadithData({required int hadithNumber}) async{
//     try{
//       isLoading = true;
//       emit(LoadHadithLoadingState());
//       final String hadithDataSeparated = await rootBundle.loadString("assets/hadith_data/h${(hadithNumber+1).toString()}.txt");
//       List<String> hadithLines = hadithDataSeparated.split("\n");
//       for(int i =0 ; i<hadithLines.length ; i++){
//         hadithData += hadithLines[i].trim();
//       }
//       isLoading = false;
//       emit(LoadHadithSuccessState());
//     }
//     catch(e){
//       emit(LoadHadithFailureState(failureMessage: "An error has occurred while loading sura: ${e.toString()}"));
//     }
//   }
// }
