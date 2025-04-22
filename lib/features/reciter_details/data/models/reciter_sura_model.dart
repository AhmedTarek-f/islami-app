import 'package:islami_app/features/quran/data/models/sura_model.dart';

class ReciterSuraModel{
  ReciterSuraModel({required this.suraData,required this.sureServer,this.isPlaying = false});
  final SuraModel suraData;
  final String sureServer;
  bool isPlaying;
}