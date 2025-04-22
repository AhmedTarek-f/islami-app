import 'package:islami_app/features/radio/data/data_sources/remote_data_source/radio_remote_data.dart';
import 'package:islami_app/features/radio/data/models/radio_model.dart';
import 'package:islami_app/features/radio/data/models/reciters_model/reciter_model.dart';

abstract class RadioRepository{
  static List<RadioModel> cachedRadios = [];
  static List<ReciterModel> cachedReciters = [];
  static Future<List<RadioModel>> getAllRadios() async{
    try{
      final allRadios = await RadioRemoteData.getAllRadios();
      cachedRadios.addAll(allRadios);
      return allRadios;
    }
    catch(e){
      throw e.toString();
    }
  }
  static Future<List<ReciterModel>> getAllReciters() async{
    try{
      final allReciters = await RadioRemoteData.getAllReciters();
      cachedReciters.addAll(allReciters);
      return allReciters;
    }
    catch(e){
      throw e.toString();
    }
  }
}