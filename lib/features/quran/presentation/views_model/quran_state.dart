sealed class QuranState {
  const QuranState();
}

final class QuranInitial extends QuranState {}
final class LoadSuraSuccessState extends QuranState {}
final class LoadSuraLoadingState extends QuranState {}
final class LoadSuraFailureState extends QuranState {
  const LoadSuraFailureState({required this.failureMessage});
  final String failureMessage;
}
