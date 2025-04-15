import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami_app/features/quran/presentation/views/widgets/sura_divider.dart';
import 'package:islami_app/features/quran/presentation/views/widgets/sura_item.dart';
import 'package:islami_app/features/quran/presentation/views_model/quran_cubit.dart';

class SurasList extends StatelessWidget {
  const SurasList({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = BlocProvider.of<QuranCubit>(context);
    return Expanded(
      child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (_, index) => SuraItem(suraData: controller.surasList[index]),
          separatorBuilder: (context, index) => const SuraDivider(),
          itemCount: controller.surasList.length
      ),
    );
  }
}