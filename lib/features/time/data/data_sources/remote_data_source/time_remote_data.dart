import 'package:islami_app/core/utils/exceptions/dio_exceptions.dart';
import 'package:islami_app/core/utils/services/api_services.dart';
import 'package:islami_app/features/time/data/models/time_model/time_model.dart';

abstract class TimeRemoteData {
  static Future<TimeModel?> getAlAdanTimes({String? city}) async {
    try {
      final response = await ApiService.getRequest(
          "https://api.aladhan.com/v1/timingsByCity/now?city=Egypt&country=EG&state=${city ?? "Cairo"}");
      if (response?.statusCode == 200) {
        if (response?.data != null) {
          final alAdanData = response!.data["data"];
          return TimeModel.fromJson(alAdanData);
        }
      }
      return null;
    } catch (e) {
      String errorMessage = DioExceptions.handleError(e);
      throw errorMessage;
    }
  }
}
