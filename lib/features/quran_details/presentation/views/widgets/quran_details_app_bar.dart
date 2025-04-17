import 'package:flutter/material.dart';
import 'package:islami_app/core/constants/app_colors.dart';
import 'package:islami_app/core/constants/app_fonts.dart';

class QuranDetailsAppBar extends StatelessWidget implements PreferredSizeWidget{
  const QuranDetailsAppBar({super.key, required this.suraNameEn});
  final String suraNameEn;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.black,
      iconTheme: const IconThemeData(
          color: AppColors.primary
      ),
      title: Text(suraNameEn,style: AppFonts.fontSize20Bold,),
      centerTitle: true,
      elevation: 0,
      surfaceTintColor: Colors.transparent,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
