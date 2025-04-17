import 'package:flutter/material.dart';
import 'package:islami_app/core/constants/app_colors.dart';
import 'package:islami_app/core/constants/app_fonts.dart';

class HadithDetailsAppBar extends StatelessWidget implements PreferredSizeWidget{
  const HadithDetailsAppBar({super.key, required this.hadithNameEn});
  final String hadithNameEn;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.black,
      iconTheme: const IconThemeData(
          color: AppColors.primary
      ),
      title: Text(hadithNameEn,style: AppFonts.fontSize20Bold,),
      centerTitle: true,
      elevation: 0,
      surfaceTintColor: Colors.transparent,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
