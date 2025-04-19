import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami_app/features/quran/presentation/views/widgets/quran_sliver_app_bar.dart';
import 'package:islami_app/features/quran/presentation/views/widgets/suras_list.dart';
import 'package:islami_app/features/quran/presentation/views/widgets/suras_search_list.dart';
import 'package:islami_app/features/quran/presentation/views_model/quran_cubit.dart';
import 'package:islami_app/features/quran/presentation/views_model/quran_state.dart';

class QuranViewBody extends StatelessWidget {
  const QuranViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = BlocProvider.of<QuranCubit>(context);
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) => [
        const QuranSliverAppBar()
      ],
      body: BlocBuilder<QuranCubit,QuranState>(
        builder: (context, state) => controller.surasSearchList.isNotEmpty?
        const SurasSearchList() :
        const SurasList(),
      ),
    );
  }
}