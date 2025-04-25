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
    return "${(int.parse(prayTime.substring(0, 2)) - 12).toString()}${prayTime.substring(2)}";
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
    if (getAbsTime(prayerTime: prayTimeList[0].prayerTime) <
            getAbsTime(prayerTime: alAdanTimes!.timings!.isha!) &&
        getAbsTime(prayerTime: prayTimeList[0].prayerTime) <
            getAbsTime(prayerTime: prayTimeList[1].prayerTime)) {
      return 0;
    } else if (getAbsTime(prayerTime: prayTimeList[1].prayerTime) <
            getAbsTime(prayerTime: prayTimeList[0].prayerTime) &&
        getAbsTime(prayerTime: prayTimeList[1].prayerTime) <
            getAbsTime(prayerTime: prayTimeList[2].prayerTime)) {
      return 1;
    } else if (getAbsTime(prayerTime: alAdanTimes!.timings!.dhuhr!) <
            getAbsTime(prayerTime: prayTimeList[1].prayerTime) &&
        getAbsTime(prayerTime: alAdanTimes!.timings!.dhuhr!) <
            getAbsTime(prayerTime: alAdanTimes!.timings!.asr!)) {
      return 2;
    } else if (getAbsTime(prayerTime: alAdanTimes!.timings!.asr!) <
            getAbsTime(prayerTime: alAdanTimes!.timings!.dhuhr!) &&
        getAbsTime(prayerTime: alAdanTimes!.timings!.asr!) <
            getAbsTime(prayerTime: alAdanTimes!.timings!.maghrib!)) {
      return 3;
    } else if (getAbsTime(prayerTime: alAdanTimes!.timings!.maghrib!) <
            getAbsTime(prayerTime: alAdanTimes!.timings!.asr!) &&
        getAbsTime(prayerTime: alAdanTimes!.timings!.maghrib!) <
            getAbsTime(prayerTime: alAdanTimes!.timings!.isha!)) {
      return 4;
    } else if (getAbsTime(prayerTime: alAdanTimes!.timings!.isha!) <
            getAbsTime(prayerTime: alAdanTimes!.timings!.maghrib!) &&
        getAbsTime(prayerTime: alAdanTimes!.timings!.isha!) <
            getAbsTime(prayerTime: alAdanTimes!.timings!.fajr!)) {
      return 5;
    } else {
      return 2;
    }
  }

  int getAbsTime({required String prayerTime}) {
    return (DateTime.now().hour - int.parse(prayerTime.substring(0, 2))).abs();
  }

  @override
  Future<void> close() {
    prayTimePageController.dispose();
    return super.close();
  }
}
