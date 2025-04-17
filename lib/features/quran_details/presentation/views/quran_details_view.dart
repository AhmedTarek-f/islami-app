import 'package:flutter/material.dart';
import 'package:islami_app/features/quran/data/models/sura_model.dart';
import 'package:islami_app/features/quran_details/presentation/views/widgets/quran_details_app_bar.dart';
import 'package:islami_app/features/quran_details/presentation/views/widgets/quran_details_view_body.dart';

class QuranDetailsView extends StatelessWidget {
  const QuranDetailsView({super.key, required this.suraData});
  final SuraModel suraData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: QuranDetailsAppBar(suraNameEn: suraData.suraNameEn,),
      body: QuranDetailsViewBody(suraData: suraData,),
    );
  }
}