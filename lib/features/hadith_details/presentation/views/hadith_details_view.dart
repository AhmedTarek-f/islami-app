import 'package:flutter/material.dart';
import 'package:islami_app/features/hadith/data/models/hadith_model.dart';
import 'package:islami_app/features/hadith_details/presentation/views/widgets/hadith_details_app_bar.dart';
import 'package:islami_app/features/hadith_details/presentation/views/widgets/hadith_details_view_body.dart';

class HadithDetailsView extends StatelessWidget {
  const HadithDetailsView({super.key, required this.hadithData});
  final HadithModel hadithData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HadithDetailsAppBar(hadithNameEn: hadithData.hadithNameEn,),
      body: HadithDetailsViewBody(hadithData: hadithData,),
    );
  }
}