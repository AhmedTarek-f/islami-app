import 'package:islami_app/core/utils/exceptions/dio_exceptions.dart';
import 'package:islami_app/core/utils/services/api_services.dart';
import 'package:islami_app/features/radio/data/models/radio_model.dart';
import 'package:islami_app/features/radio/data/models/reciters_model/reciter_model.dart';

abstract class RadioRemoteData{
  static Future<List<RadioModel>> getAllRadios() async{
    try{
      final response = await ApiService.getRequest("https://mp3quran.net/api/v3/radios?language=ar");
      if(response?.statusCode == 200){
        if(response?.data != null){
          final radiosData = response!.data["radios"] as List;
          final List<RadioModel> allRadios = radiosData.map((radio) => RadioModel.fromJson(radio)).toList();
          return allRadios;
        }
        else{
          return [];
        }
      }
      else{
        return [];
      }
    }
    catch(e){
      String errorMessage = DioExceptions.handleError(e);
      throw errorMessage;
    }
  }

  static Future<List<ReciterModel>> getAllReciters() async{
    try{
      final response = await ApiService.getRequest("https://www.mp3quran.net/api/v3/reciters?language=ar");
      if(response?.statusCode == 200){
        if(response?.data != null){
          final recitersData = response!.data["reciters"] as List;
          final List<ReciterModel> allReciters = recitersData.map((radio) => ReciterModel.fromJson(radio)).toList();
          return allReciters;
        }
        else{
          return [];
        }
      }
      else{
        return [];
      }
    }
    catch(e){
      String errorMessage = DioExceptions.handleError(e);
      throw errorMessage;
    }
  }
}