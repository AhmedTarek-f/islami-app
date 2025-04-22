sealed class RadioState {
  const RadioState();
}

final class RadioInitial extends RadioState {}
final class ToggleRadioOrRecitersState extends RadioState {}
final class GetRadioChannelsSuccessState extends RadioState {}
final class GetRadioChannelsLoadingState extends RadioState {}
final class GetRadioChannelsFailureState extends RadioState {
  const GetRadioChannelsFailureState({required this.errorMessage});
  final String errorMessage;
}
final class GetReciterChannelsSuccessState extends RadioState {}
final class GetReciterChannelsLoadingState extends RadioState {}
final class GetReciterChannelsFailureState extends RadioState {
  const GetReciterChannelsFailureState({required this.errorMessage});
  final String errorMessage;
}
final class PlayingAudioState extends RadioState {}
final class LoadAudioState extends RadioState {
  const LoadAudioState({required this.channelName});
  final String channelName;
}
final class ErrorAudioState extends RadioState {
  const ErrorAudioState({required this.errorMessage});
  final String errorMessage;
}
final class PausingAudioState extends RadioState {}
