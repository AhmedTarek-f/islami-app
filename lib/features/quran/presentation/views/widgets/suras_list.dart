import 'package:flutter/material.dart';
import 'package:islami_app/core/constants/app_data/app_data.dart';
import 'package:islami_app/features/quran/presentation/views/widgets/sura_divider.dart';
import 'package:islami_app/features/quran/presentation/views/widgets/sura_item.dart';

class SurasList extends StatelessWidget {
  const SurasList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (_, index) => SuraItem(suraData: AppData.surasList[index]),
          separatorBuilder: (context, index) => const SuraDivider(),
          itemCount: AppData.surasList.length
      ),
    );
  }
}