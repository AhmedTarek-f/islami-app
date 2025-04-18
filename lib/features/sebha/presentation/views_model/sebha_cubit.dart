
import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami_app/features/sebha/presentation/views_model/sebha_state.dart';

class SebhaCubit extends Cubit<SebhaState>  {
  SebhaCubit() : super(SebhaInitial());

  int sebhaCounter = 0;
  int _sebhaTurns = 0;
  String currentSebhaContent = "سبحان الله";
  double angle = 0;
  final List<String> _sebhaContentList = [
    "سبحان الله",
    "الحمد لله",
    "لا اله الا الله",
    "الله اكبر"
  ];

  void changeSebhaContent(){
    sebhaCounter++;
    angle += pi /2;
    if(sebhaCounter == 31){
      sebhaCounter = 0;
      _sebhaTurns++;
      if(_sebhaTurns == 4){
        _sebhaTurns = 0;
      }
      currentSebhaContent = _sebhaContentList[_sebhaTurns];
    }
    emit(ChangeSebhaContentState());
  }

}
