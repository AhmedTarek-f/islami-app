import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami_app/core/constants/app_icons.dart';
import 'package:islami_app/features/navigation_menu/presentation/views/widgets/active_icon.dart';
import 'package:islami_app/features/navigation_menu/presentation/views_model/menu_bottom_navigation_cubit.dart';
import 'package:islami_app/features/navigation_menu/presentation/views_model/menu_bottom_navigation_state.dart';

class MenuBottomNavigationBar extends StatelessWidget {
  const MenuBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = BlocProvider.of<MenuBottomNavigationCubit>(context);
    return BlocBuilder<MenuBottomNavigationCubit,MenuBottomNavigationState>(
      builder: (context, state) =>  BottomNavigationBar(
        currentIndex: controller.tapIndex,
        onTap: (value) => controller.changeIndex(value),
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppIcons.quranInactiveIcon),
            activeIcon: const ActiveIcon(icon: AppIcons.quranActiveIcon,),
            label: "Quran",
          ),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(AppIcons.hadithInactiveIcon),
              activeIcon: const ActiveIcon(icon: AppIcons.hadithActiveIcon,),
              label: "Hadith"
          ),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(AppIcons.sebhaInactiveIcon),
              activeIcon: const ActiveIcon(icon: AppIcons.sebhaActiveIcon,),
              label: "Sebha"
          ),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(AppIcons.radioInactiveIcon),
              activeIcon: const ActiveIcon(icon: AppIcons.radioActiveIcon,),
              label: "Radio"
          ),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(AppIcons.timeInactiveIcon),
              activeIcon: const ActiveIcon(icon: AppIcons.timeActiveIcon,),
              label: "Time"
          ),
        ],
      ),
    );
  }
}