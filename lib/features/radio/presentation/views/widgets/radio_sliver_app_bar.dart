import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/core/common_widgets/islami_logo.dart';
import 'package:islami_app/features/radio/presentation/views/widgets/radio_reciters_buttons_row.dart';

class RadioSliverAppBar extends StatelessWidget {
  const RadioSliverAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.transparent,
      expandedHeight: 230.h,
      flexibleSpace: FlexibleSpaceBar(
        background: RPadding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const IslamiLogo(),
              SizedBox(height: 26.h,),
              const RadioRecitersButtonsRow(),
            ],
          ),
        ),
      ),
    );
  }
}