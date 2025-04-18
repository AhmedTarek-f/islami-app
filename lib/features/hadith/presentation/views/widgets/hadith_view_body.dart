import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/core/common_widgets/islami_logo.dart';
import 'package:islami_app/core/common_widgets/loading_indicator.dart';
import 'package:islami_app/features/hadith/presentation/views/widgets/hadith_page_view.dart';
import 'package:islami_app/features/hadith/presentation/views_model/hadith_cubit.dart';
import 'package:islami_app/features/hadith/presentation/views_model/hadith_state.dart';

class HadithViewBody extends StatelessWidget {
  const HadithViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = BlocProvider.of<HadithCubit>(context);
    return Column(
      children: [
        const IslamiLogo(),
        SizedBox(height: 40.h,),
        Expanded(
          child: BlocBuilder<HadithCubit,HadithState>(
            buildWhen: (previous, current) => current is LoadHadithSuccessState,
            builder: (context, state) =>controller.isLoading?
                const LoadingIndicator()
                :const HadithPageView(),
          ),
        ),
        SizedBox(height: 20.h,),
      ],
    );
  }
}