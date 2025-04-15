import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami_app/features/quran/data/models/sura_model.dart';
import 'package:islami_app/features/quran/presentation/views_model/quran_state.dart';

class QuranCubit extends Cubit<QuranState> {
  QuranCubit() : super(QuranInitial());
  final List<SuraModel> surasList = const [
    SuraModel(
        suraNumber: "1",
        suraNameEn: "El-fatha",
        suraNameAr: "الفاتحه",
        versesNumber: "7"
    ),
    SuraModel(
        suraNumber: "1",
        suraNameEn: "El-fatha",
        suraNameAr: "الفاتحه",
        versesNumber: "7"
    ),
    SuraModel(
        suraNumber: "1",
        suraNameEn: "El-fatha",
        suraNameAr: "الفاتحه",
        versesNumber: "7"
    ),
    SuraModel(
        suraNumber: "1",
        suraNameEn: "El-fatha",
        suraNameAr: "الفاتحه",
        versesNumber: "7"
    ),
    SuraModel(
        suraNumber: "1",
        suraNameEn: "El-fatha",
        suraNameAr: "الفاتحه",
        versesNumber: "7"
    ),
    SuraModel(
        suraNumber: "1",
        suraNameEn: "El-fatha",
        suraNameAr: "الفاتحه",
        versesNumber: "7"
    ),
    SuraModel(
        suraNumber: "1",
        suraNameEn: "El-fatha",
        suraNameAr: "الفاتحه",
        versesNumber: "7"
    ),
  ];
}
