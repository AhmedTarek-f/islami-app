import 'dart:async';

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
  Duration? nextPrayTime;
  late int currentPrayTimePageIndex;
  bool isAlAdanLoading = true;
  bool isAzkarLoading = true;
  late final List<String> prayers;
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
        prayers = [
          alAdanTimes!.timings!.fajr!,
          alAdanTimes!.timings!.sunrise!,
          alAdanTimes!.timings!.dhuhr!,
          alAdanTimes!.timings!.asr!,
          alAdanTimes!.timings!.maghrib!,
          alAdanTimes!.timings!.isha!,
        ];
        currentPrayTimePageIndex = getCurrentPrayerIndex();
        nextPrayTime =
            getNextPrayTime(currentPrayTimeIndex: currentPrayTimePageIndex);
        startUpdatingGetNextPrayTime();
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
        prayers = [
          alAdanTimes!.timings!.fajr!,
          alAdanTimes!.timings!.sunrise!,
          alAdanTimes!.timings!.dhuhr!,
          alAdanTimes!.timings!.asr!,
          alAdanTimes!.timings!.maghrib!,
          alAdanTimes!.timings!.isha!,
        ];
        currentPrayTimePageIndex = getCurrentPrayerIndex();
        nextPrayTime =
            getNextPrayTime(currentPrayTimeIndex: currentPrayTimePageIndex);
        startUpdatingGetNextPrayTime();
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

  int getCurrentPrayerIndex() {
    final now = DateTime.now();

    final List<DateTime> prayerTimes = prayers.map((time) {
      final hour = int.parse(time.substring(0, 2));
      final minute = int.parse(time.substring(3, 5));
      var prayerDateTime = DateTime(now.year, now.month, now.day, hour, minute);

      return prayerDateTime;
    }).toList();

    final ishaTime = prayerTimes[5];

    if (now.isAfter(ishaTime) || now.isBefore(prayerTimes[0])) {
      return 5;
    }

    for (int i = 0; i < prayerTimes.length - 1; i++) {
      final start = prayerTimes[i];
      final end = prayerTimes[i + 1];

      if (now.isAfter(start) && now.isBefore(end)) {
        return i;
      }
    }

    return 0;
  }

  Duration getNextPrayTime({required int currentPrayTimeIndex}) {
    if (currentPrayTimeIndex == 0) {
      int sunriseHours = int.parse(prayers[1].substring(0, 2));
      int sunriseMinutes = int.parse(prayers[1].substring(3, 5));
      return getTimeLeft(
        now: DateTime.now(),
        targetHour: sunriseHours,
        targetMinute: sunriseMinutes,
      );
    } else if (currentPrayTimeIndex == 1) {
      int dhuhrHours = int.parse(prayers[2].substring(0, 2));
      int dhuhrMinutes = int.parse(prayers[2].substring(3, 5));
      return getTimeLeft(
        now: DateTime.now(),
        targetHour: dhuhrHours,
        targetMinute: dhuhrMinutes,
      );
    } else if (currentPrayTimeIndex == 2) {
      int asrHours = int.parse(prayers[3].substring(0, 2));
      int asrMinutes = int.parse(prayers[3].substring(3, 5));
      return getTimeLeft(
        now: DateTime.now(),
        targetHour: asrHours,
        targetMinute: asrMinutes,
      );
    } else if (currentPrayTimeIndex == 3) {
      int maghribHours = int.parse(prayers[4].substring(0, 2));
      int maghribMinutes = int.parse(prayers[4].substring(3, 5));
      return getTimeLeft(
        now: DateTime.now(),
        targetHour: maghribHours,
        targetMinute: maghribMinutes,
      );
    } else if (currentPrayTimeIndex == 4) {
      int ishaHours = int.parse(prayers[5].substring(0, 2));
      int ishaMinutes = int.parse(prayers[5].substring(3, 5));
      return getTimeLeft(
        now: DateTime.now(),
        targetHour: ishaHours,
        targetMinute: ishaMinutes,
      );
    } else {
      int fajrHours = int.parse(prayTimeList[0].prayerTime.substring(0, 2));
      int fajrMinutes = int.parse(prayTimeList[0].prayerTime.substring(3, 5));
      return getTimeLeft(
        now: DateTime.now(),
        targetHour: fajrHours,
        targetMinute: fajrMinutes,
      );
    }
  }

  int getLeftTimeHour({
    required String prayerTime,
  }) {
    final int targetHour = int.parse(prayerTime.substring(0, 2));
    final int targetMinute = int.parse(prayerTime.substring(3, 5));
    final now = DateTime.now();
    DateTime target = DateTime(
      now.year,
      now.month,
      now.day,
      targetHour,
      targetMinute,
    );

    if (target.isBefore(now)) {
      target = target.add(const Duration(days: 1));
    }

    return target.difference(now).inHours;
  }

  Duration getTimeLeft({
    required DateTime now,
    required int targetHour,
    required int targetMinute,
  }) {
    DateTime target = DateTime(
      now.year,
      now.month,
      now.day,
      targetHour,
      targetMinute,
    );

    if (target.isBefore(now)) {
      target = target.add(const Duration(days: 1));
    }

    return target.difference(now);
  }

  void startUpdatingGetNextPrayTime() {
    Timer.periodic(const Duration(minutes: 1), (timer) {
      nextPrayTime =
          getNextPrayTime(currentPrayTimeIndex: currentPrayTimePageIndex);
      emit(ChangeNextPrayTimeState());
    });
  }

  @override
  Future<void> close() {
    prayTimePageController.dispose();
    return super.close();
  }
}
