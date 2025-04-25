sealed class TimeState {
  const TimeState();
}

final class TimeInitial extends TimeState {}

final class FetchAlAdanTimesSuccessState extends TimeState {}

final class FetchAlAdanTimesLoadingState extends TimeState {}

final class FetchAlAdanTimesFailureState extends TimeState {
  const FetchAlAdanTimesFailureState({required this.errorMessage});
  final String errorMessage;
}

final class ChangeCurrentPrayTimePageIndexState extends TimeState {}

final class LoadAzkarSuccessState extends TimeState {}

final class AzkarLoadingState extends TimeState {}

final class LoadAzkarFailureState extends TimeState {
  const LoadAzkarFailureState({required this.errorMessage});
  final String errorMessage;
}
