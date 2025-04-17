import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/core/common_widgets/islami_logo.dart';
import 'package:islami_app/core/common_widgets/loading_indicator.dart';
import 'package:islami_app/core/constants/app_data/app_data.dart';
import 'package:islami_app/features/hadith/presentation/views/widgets/hadith_item.dart';
import 'package:islami_app/features/hadith/presentation/views_model/hadith_cubit.dart';
import 'package:islami_app/features/hadith/presentation/views_model/hadith_state.dart';
import 'package:islami_app/features/hadith_details/presentation/views/hadith_details_view.dart';

class HadithViewBody extends StatelessWidget {
  const HadithViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = BlocProvider.of<HadithCubit>(context);
    return Column(
      children: [
        const IslamiLogo(),
        SizedBox(height: 55.h,),
        Expanded(
          child: BlocBuilder<HadithCubit,HadithState>(
            buildWhen: (previous, current) => current is LoadHadithSuccessState,
            builder: (context, state) =>controller.isLoading?
                const LoadingIndicator()
                :CarouselView.weighted(
              controller: controller.carouselController,
              elevation: 0,
              scrollDirection: Axis.horizontal,
              flexWeights: const [1,7,1],
              itemSnapping: true,
              onTap: (value) => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => HadithDetailsView(
                    hadithData: AppData.hadithList[value]
                ),
                ),
              ),
              children: AppData.hadithList.map((hadith) => HadithItem(hadithData: hadith)).toList(),
            ),
          ),
        ),
        SizedBox(height: 20.h,),
      ],
    );
  }
}