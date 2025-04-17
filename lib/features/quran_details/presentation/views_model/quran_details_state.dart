sealed class QuranDetailsState {
  const QuranDetailsState();
}

final class QuranDetailsInitial extends QuranDetailsState {}
final class LoadSuraSuccessState extends QuranDetailsState {}
final class LoadSuraLoadingState extends QuranDetailsState {}
final class LoadSuraFailureState extends QuranDetailsState {
  const LoadSuraFailureState({required this.failureMessage});
  final String failureMessage;
}