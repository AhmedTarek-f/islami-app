import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/core/common_widgets/islami_logo.dart';
import 'package:islami_app/core/constants/app_fonts.dart';
import 'package:islami_app/features/sebha/presentation/views/widgets/sebha_content.dart';

class SebhaViewBody extends StatelessWidget {
  const SebhaViewBody({super.key});

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        const IslamiLogo(),
        SizedBox(height: 16.h,),
        const Text(
            "سَبِّحِ اسْمَ رَبِّكَ الأعلى ",
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.center,
          style: AppFonts.fontSize36Bold,
        ),
        SizedBox(height: 16.h,),
        const SebhaContent()
      ],
    );
  }
}
