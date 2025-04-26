import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami_app/features/azkar/data/models/azkar_model/azkar_model.dart';
import 'package:islami_app/features/time/data/models/pray_time_model/pray_time_model.dart';
import 'package:islami_app/features/time/data/models/time_model/time_model.dart';
import 'package:islami_app/features/time/data/repositories/time_repository.dart';
import 'package:islami_app/features/time/presentation/views_model/time_state.dart';

class TimeCubit extends Cubit<TimeState> {
  TimeCubit() : super(TimeInitial()) {
    onInit();
  }
  TimeModel? alAdanTimes;
  late final List<PrayTimeMode> prayTimeList;
  late final PageController prayTimePageController;
  List<AzkarModel> morningAzkar = [];
  List<AzkarModel> eveningAzkar = [];
  String nextPrayTime = "";
  late int currentPrayTimePageIndex;
  bool isAlAdanLoading = true;
  bool isAzkarLoading = true;
  void onInit() {
    fetchAlAdanTimes();
    getSpecificAzkar();
  }

  Future<void> fetchAlAdanTimes() async {
    try {
      if (TimeRepository.cachedAdanData == null) {
        emit(FetchAlAdanTimesLoadingState());
        alAdanTimes = await TimeRepository.getAlAdanTimes();
        TimeRepository.cachedAdanData = alAdanTimes;
        prayTimeList = assignPrayTimeList();
        currentPrayTimePageIndex = getCurrentPrayIndex();
        nextPrayTime =
            getNextPrayTime(currentPrayTimeIndex: currentPrayTimePageIndex);
        prayTimePageController = PageController(
          viewportFraction: 0.35,
          initialPage: currentPrayTimePageIndex,
        );
        emit(FetchAlAdanTimesSuccessState());
        isAlAdanLoading = false;
      } else {
        isAlAdanLoading = false;
        alAdanTimes = TimeRepository.cachedAdanData;
        prayTimeList = assignPrayTimeList();
        currentPrayTimePageIndex = getCurrentPrayIndex();
        nextPrayTime =
            getNextPrayTime(currentPrayTimeIndex: currentPrayTimePageIndex);
        prayTimePageController = PageController(
          viewportFraction: 0.35,
          initialPage: currentPrayTimePageIndex,
        );
      }
    } catch (e) {
      emit(FetchAlAdanTimesFailureState(errorMessage: e.toString()));
    }
  }

  void changeCurrentPrayTimePageIndex({required int index}) {
    currentPrayTimePageIndex = index;
    emit(ChangeCurrentPrayTimePageIndexState());
  }

  List<PrayTimeMode> assignPrayTimeList() {
    return [
      PrayTimeMode(
        prayerName: "Fajr",
        prayerTime: alAdanTimes!.timings!.fajr!,
        dayTime: "AM",
      ),
      PrayTimeMode(
        prayerName: "Sunrise",
        prayerTime: alAdanTimes!.timings!.sunrise!,
        dayTime: "AM",
      ),
      PrayTimeMode(
        prayerName: "Dhuhr",
        prayerTime: alAdanTimes!.timings!.dhuhr!,
        dayTime: int.parse(alAdanTimes!.timings!.dhuhr!.substring(0, 2)) >= 12
            ? "PM"
            : "AM",
      ),
      PrayTimeMode(
        prayerName: "Asr",
        prayerTime: getPrayTimeAfter12PM(prayTime: alAdanTimes!.timings!.asr!),
        dayTime: "PM",
      ),
      PrayTimeMode(
        prayerName: "Maghrib",
        prayerTime:
            getPrayTimeAfter12PM(prayTime: alAdanTimes!.timings!.maghrib!),
        dayTime: "PM",
      ),
      PrayTimeMode(
        prayerName: "Isha",
        prayerTime: getPrayTimeAfter12PM(prayTime: alAdanTimes!.timings!.isha!),
        dayTime: "PM",
      ),
    ];
  }

  String getPrayTimeAfter12PM({required String prayTime}) {
    return "0${(int.parse(prayTime.substring(0, 2)) - 12).toString()}${prayTime.substring(2)}";
  }

  Future<void> getSpecificAzkar() async {
    try {
      if (TimeRepository.cachedEveningAzkar == null) {
        emit(AzkarLoadingState());
        final morningAzkarData = await TimeRepository.loadMorningAzkarData();
        final eveningAzkarData = await TimeRepository.loadEveningAzkarData();
        morningAzkar.addAll(morningAzkarData);
        TimeRepository.cachedMorningAzkar = morningAzkar;
        eveningAzkar.addAll(eveningAzkarData);
        TimeRepository.cachedEveningAzkar = eveningAzkar;
        emit(LoadAzkarSuccessState());
        isAzkarLoading = false;
      } else {
        isAzkarLoading = false;
        eveningAzkar = TimeRepository.cachedEveningAzkar!;
        morningAzkar = TimeRepository.cachedMorningAzkar!;
      }
    } catch (e) {
      emit(
        LoadAzkarFailureState(
          errorMessage: e.toString(),
        ),
      );
    }
  }

  int getCurrentPrayIndex() {
    final int fajrTimeLeft =
        getAbsTimeHour(prayerTime: alAdanTimes!.timings!.fajr!);
    final int sunriseTimeLeft =
        getAbsTimeHour(prayerTime: alAdanTimes!.timings!.sunrise!);
    final int dhuhrTimeLeft =
        getAbsTimeHour(prayerTime: alAdanTimes!.timings!.dhuhr!);
    final int asrTimeLeft =
        getAbsTimeHour(prayerTime: alAdanTimes!.timings!.asr!);
    final int maghribTimeLeft =
        getAbsTimeHour(prayerTime: alAdanTimes!.timings!.maghrib!);
    final int ishaTimeLeft =
        getAbsTimeHour(prayerTime: alAdanTimes!.timings!.isha!);
    if (fajrTimeLeft < sunriseTimeLeft &&
        fajrTimeLeft < dhuhrTimeLeft &&
        fajrTimeLeft < asrTimeLeft &&
        fajrTimeLeft < maghribTimeLeft &&
        fajrTimeLeft < ishaTimeLeft &&
        fajrTimeLeft >= getTimeHour(prayerTime: alAdanTimes!.timings!.fajr!)) {
      return 0;
    } else if (sunriseTimeLeft < fajrTimeLeft &&
        sunriseTimeLeft < dhuhrTimeLeft &&
        sunriseTimeLeft < asrTimeLeft &&
        sunriseTimeLeft < maghribTimeLeft &&
        sunriseTimeLeft < ishaTimeLeft &&
        sunriseTimeLeft >=
            getTimeHour(prayerTime: alAdanTimes!.timings!.sunrise!)) {
      return 1;
    } else if (dhuhrTimeLeft < fajrTimeLeft &&
        dhuhrTimeLeft < sunriseTimeLeft &&
        dhuhrTimeLeft < asrTimeLeft &&
        dhuhrTimeLeft < maghribTimeLeft &&
        dhuhrTimeLeft < ishaTimeLeft &&
        dhuhrTimeLeft >=
            getTimeHour(prayerTime: alAdanTimes!.timings!.dhuhr!)) {
      return 2;
    } else if (asrTimeLeft < fajrTimeLeft &&
        asrTimeLeft < sunriseTimeLeft &&
        asrTimeLeft < dhuhrTimeLeft &&
        asrTimeLeft < maghribTimeLeft &&
        asrTimeLeft < ishaTimeLeft &&
        asrTimeLeft >= getTimeHour(prayerTime: alAdanTimes!.timings!.asr!)) {
      return 3;
    } else if (maghribTimeLeft < fajrTimeLeft &&
        maghribTimeLeft < sunriseTimeLeft &&
        maghribTimeLeft < dhuhrTimeLeft &&
        maghribTimeLeft < asrTimeLeft &&
        maghribTimeLeft < ishaTimeLeft &&
        asrTimeLeft < ishaTimeLeft &&
        maghribTimeLeft >=
            getTimeHour(prayerTime: alAdanTimes!.timings!.maghrib!)) {
      return 4;
    } else {
      return 5;
    }
  }

  String getNextPrayTime({required int currentPrayTimeIndex}) {
    int currentHours = DateTime.now().hour >= 12
        ? DateTime.now().hour - 12
        : DateTime.now().hour;
    int currentMinutes = DateTime.now().minute;

    if (currentPrayTimeIndex == 0) {
      int sunriseHours = int.parse(prayTimeList[1].prayerTime.substring(0, 2));
      int sunriseMinutes =
          int.parse(prayTimeList[1].prayerTime.substring(3, 5));
      int sunriseHoursLeft = (currentHours - sunriseHours).abs();
      int sunriseMinutesLeft = (currentMinutes - sunriseMinutes).abs();
      return sunriseHoursLeft == 0
          ? "$sunriseMinutesLeft minutes"
          : "$sunriseHoursLeft hours";
    } else if (currentPrayTimeIndex == 1) {
      int dhuhrHours = int.parse(prayTimeList[2].prayerTime.substring(0, 2));
      int dhuhrMinutes = int.parse(prayTimeList[2].prayerTime.substring(3, 5));
      int dhuhrHoursLeft = (currentHours - dhuhrHours).abs();
      int dhuhrMinutesLeft = (currentMinutes - dhuhrMinutes).abs();
      return dhuhrHoursLeft == 0
          ? "$dhuhrMinutesLeft minutes"
          : "$dhuhrHoursLeft hours";
    } else if (currentPrayTimeIndex == 2) {
      int asrHours = int.parse(prayTimeList[3].prayerTime.substring(0, 2));
      int asrMinutes = int.parse(prayTimeList[3].prayerTime.substring(3, 5));
      int asrHoursLeft = (currentHours - asrHours).abs();
      int asrMinutesLeft = (currentMinutes - asrMinutes).abs();
      return asrHoursLeft == 0
          ? "$asrMinutesLeft minutes"
          : "$asrHoursLeft hours";
    } else if (currentPrayTimeIndex == 3) {
      int maghribHours = int.parse(prayTimeList[4].prayerTime.substring(0, 2));
      int maghribMinutes =
          int.parse(prayTimeList[4].prayerTime.substring(3, 5));
      int maghribHoursLeft = (currentHours - maghribHours).abs();
      int maghribMinutesLeft = (currentMinutes - maghribMinutes).abs();
      return maghribHoursLeft == 0
          ? "$maghribMinutesLeft minutes"
          : "$maghribHoursLeft hours";
    } else if (currentPrayTimeIndex == 4) {
      int ishaHours = int.parse(prayTimeList[5].prayerTime.substring(0, 2));
      int ishaMinutes = int.parse(prayTimeList[5].prayerTime.substring(3, 5));
      int ishaHoursLeft = (currentHours - ishaHours).abs();
      int ishaMinutesLeft = (currentMinutes - ishaMinutes).abs();
      return ishaHoursLeft == 0
          ? "$ishaMinutesLeft minutes"
          : "$ishaHoursLeft hours";
    } else {
      int fajrHours = int.parse(prayTimeList[0].prayerTime.substring(0, 2));
      int fajrMinutes = int.parse(prayTimeList[0].prayerTime.substring(3, 5));
      int fajrHoursLeft = (currentHours - fajrHours).abs();
      int fajrMinutesLeft = (currentMinutes - fajrMinutes).abs();
      return fajrHoursLeft == 0
          ? "$fajrMinutesLeft minutes"
          : "$fajrHoursLeft hours";
    }
  }

  int getAbsTimeHour({required String prayerTime}) {
    return (DateTime.now().hour - int.parse(prayerTime.substring(0, 2))).abs();
  }

  int getTimeHour({required String prayerTime}) {
    return DateTime.now().hour - int.parse(prayerTime.substring(0, 2));
  }

  @override
  Future<void> close() {
    prayTimePageController.dispose();
    return super.close();
  }
}
