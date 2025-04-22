import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami_app/features/radio/data/models/radio_model.dart';
import 'package:islami_app/features/radio/data/models/reciters_model/reciter_model.dart';
import 'package:islami_app/features/radio/data/repositories/radio_repository.dart';
import 'package:islami_app/features/radio/presentation/views_model/radio_state.dart';
import 'package:islami_app/features/reciter_details/data/models/reciter_sura_model.dart';

class RadioCubit extends Cubit<RadioState> {
  RadioCubit() : super(RadioInitial()){
    onInit();
  }

  late final AudioPlayer _player;
  PlayerState? _playerState;
  bool isRadio = true;
  List<RadioModel> radiosList = [];
  List<ReciterModel> recitersList = [];
  bool get isPlaying => _playerState == PlayerState.playing;
  RadioModel? previousRadioData;
  ReciterSuraModel? previousReciterSuraData;

  void onInit(){
    _player = AudioPlayer();
    getRadios();
  }

  Future<void> getRadios() async {
    try{
      if(RadioRepository.cachedRadios.isEmpty){
        emit(GetRadioChannelsLoadingState());
        radiosList = await RadioRepository.getAllRadios();
        emit(GetRadioChannelsSuccessState());
      }
      else{
        radiosList = RadioRepository.cachedRadios;
      }
    }
    catch(e){
      emit(GetRadioChannelsFailureState(errorMessage: e.toString()));
    }
  }

  Future<void> getReciters() async {
    try{
      if(RadioRepository.cachedReciters.isEmpty){
        emit(GetReciterChannelsLoadingState());
        recitersList = await RadioRepository.getAllReciters();
        emit(GetReciterChannelsSuccessState());
      }
      else{
        recitersList = RadioRepository.cachedReciters;
      }
    }
    catch(e){
      emit(GetReciterChannelsFailureState(errorMessage: e.toString()));
    }
  }

  Future<void> toggleRadioOrReciters({required String buttonTitle}) async{
    if(buttonTitle == "radio" && !isRadio){
      await _player.stop();
      previousReciterSuraData?.isPlaying = !isPlaying;
      isRadio = !isRadio;
      emit(ToggleRadioOrRecitersState());
    }
    else if(buttonTitle == "reciters" && isRadio){
      await _player.stop();
      previousRadioData?.isPlaying = !isPlaying;
      isRadio = !isRadio;
      emit(ToggleRadioOrRecitersState());
      getReciters();
    }
  }

  Future<void> playRadio({required RadioModel radioData}) async {
    try{
      previousRadioData?.isPlaying = !isPlaying;
      emit(LoadAudioState(channelName: radioData.radioChannelName));
      await _player.setSourceUrl(radioData.radioChannelUrl);
      await _player.resume();
      previousRadioData = radioData;
      _playerState = PlayerState.playing;
      radioData.isPlaying = isPlaying;
      emit(PlayingAudioState());
    }
    catch(e){
      emit(ErrorAudioState(errorMessage: e.toString()));
    }
  }

  Future<void> pauseRadio({required RadioModel radioData}) async {
    previousRadioData?.isPlaying = !isPlaying;
    await _player.pause();
    _playerState = PlayerState.paused;
    radioData.isPlaying = isPlaying;
    previousRadioData = null;
    emit(PausingAudioState());
  }

  Future<void> playReciter({required ReciterSuraModel reciterSuraData}) async {
    try{
      previousReciterSuraData?.isPlaying = !isPlaying;
      emit(LoadAudioState(channelName: reciterSuraData.suraData.suraNumber));
      await _player.setSourceUrl("${reciterSuraData.sureServer}00${reciterSuraData.suraData.suraNumber}.mp3");
      await _player.resume();
      previousReciterSuraData = reciterSuraData;
      _playerState = PlayerState.playing;
      reciterSuraData.isPlaying = isPlaying;
      emit(PlayingAudioState());
    }
    catch(e){
      emit(ErrorAudioState(errorMessage: e.toString()));
    }
  }

  Future<void> pauseReciter({required ReciterSuraModel reciterSuraData}) async {
    previousReciterSuraData?.isPlaying = !isPlaying;
    await _player.pause();
    _playerState = PlayerState.paused;
    reciterSuraData.isPlaying = isPlaying;
    previousReciterSuraData = null;
    emit(PausingAudioState());
  }

  @override
  Future<void> close() {
    _player.dispose();
    return super.close();
  }

}
