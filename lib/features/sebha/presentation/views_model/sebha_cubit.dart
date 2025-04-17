
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami_app/features/sebha/presentation/views_model/sebha_state.dart';

class SebhaCubit extends Cubit<SebhaState>  {
  SebhaCubit() : super(SebhaInitial());

  int sebhaCounter = 0;
  int _sebhaTurns = 0;
  String currentSebhaContent = "سبحان الله";
  final List<String> _sebhaContentList = [
    "سبحان الله",
    "الحمد لله",
    "الله اكبر"
  ];

  void changeSebhaContent(){
    sebhaCounter++;
    if(sebhaCounter == 31){
      sebhaCounter = 0;
      _sebhaTurns++;
      if(_sebhaTurns == 3){
        _sebhaTurns = 0;
      }
      currentSebhaContent = _sebhaContentList[_sebhaTurns];
    }
    emit(ChangeSebhaContentState());
  }

}
