import 'package:flutter/material.dart';
import 'package:islami_app/features/azkar/data/models/azkar_model/azkar_model.dart';
import 'package:islami_app/features/azkar/presentation/views/widgets/azkar_page_view.dart';

class AzkarViewBody extends StatelessWidget {
  const AzkarViewBody({super.key, required this.azkarList});
  final List<AzkarModel> azkarList;
  @override
  Widget build(BuildContext context) {
    return AzkarPageView(azkarList: azkarList);
  }
}
