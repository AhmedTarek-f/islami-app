sealed class HadithState {
  const HadithState();
}

final class HadithInitial extends HadithState {}
final class LoadHadithSuccessState extends HadithState {}
final class LoadHadithLoadingState extends HadithState {}
final class LoadHadithFailureState extends HadithState {
  const LoadHadithFailureState({required this.failureMessage});
  final String failureMessage;
}
final class ChangeHadithPageIndexState extends HadithState {}