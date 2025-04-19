sealed class QuranState {
  const QuranState();
}

final class QuranInitial extends QuranState {}
final class SuraSearchState extends QuranState {}
final class AddSuraToRecent extends QuranState {}