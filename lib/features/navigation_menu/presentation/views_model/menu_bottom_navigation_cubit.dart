import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami_app/features/hadith/presentation/views/hadith_view.dart';
import 'package:islami_app/features/navigation_menu/presentation/views_model/menu_bottom_navigation_state.dart';
import 'package:islami_app/features/quran/presentation/views/quran_view.dart';
import 'package:islami_app/features/radio/presentation/views/radio_view.dart';
import 'package:islami_app/features/sebha/presentation/views/sebha_view.dart';
import 'package:islami_app/features/time/presentation/views/time_view.dart';

class MenuBottomNavigationCubit extends Cubit<MenuBottomNavigationState> {
  MenuBottomNavigationCubit() : super(MenuBottomNavigationInitial());
  int tapIndex = 0;
  final List<Widget> menuTaps = const [
    QuranView(),
    HadithView(),
    SebhaView(),
    RadioView(),
    TimeView(),
  ];
  void changeIndex(int index){
    tapIndex = index;
    emit(ChangeMenuBottomNavigationIndexState());
  }
}
