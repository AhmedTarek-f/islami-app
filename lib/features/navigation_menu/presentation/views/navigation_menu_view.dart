import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami_app/features/navigation_menu/presentation/views/widgets/menu_bottom_navigation_bar.dart';
import 'package:islami_app/features/navigation_menu/presentation/views_model/menu_bottom_navigation_cubit.dart';
import 'package:islami_app/features/navigation_menu/presentation/views_model/menu_bottom_navigation_state.dart';

class NavigationMenuView extends StatelessWidget {
  const NavigationMenuView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = BlocProvider.of<MenuBottomNavigationCubit>(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
      bottomNavigationBar: const MenuBottomNavigationBar(),
      body: BlocBuilder<MenuBottomNavigationCubit,MenuBottomNavigationState>(
          builder: (context, state) => controller.menuTaps[controller.tapIndex],
      ),
    );
  }
}
