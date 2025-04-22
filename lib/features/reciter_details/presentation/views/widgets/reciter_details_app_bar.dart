import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami_app/core/constants/app_colors.dart';
import 'package:islami_app/core/constants/app_fonts.dart';
import 'package:islami_app/features/reciter_details/presentation/views_model/reciter_details_cubit.dart';

class ReciterDetailsAppBar extends StatelessWidget implements PreferredSizeWidget{
  const ReciterDetailsAppBar({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = BlocProvider.of<ReciterDetailsCubit>(context);
    return AppBar(
      backgroundColor: AppColors.black,
      iconTheme: const IconThemeData(
          color: AppColors.primary
      ),
      title: Text(
        "القارئ ${controller.reciterData.name}",
        style: AppFonts.fontSize20Bold,
      ),
      centerTitle: true,
      elevation: 0,
      surfaceTintColor: Colors.transparent,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
