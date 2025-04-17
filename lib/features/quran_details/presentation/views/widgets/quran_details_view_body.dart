import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/core/common_widgets/loading_indicator.dart';
import 'package:islami_app/core/constants/app_fonts.dart';
import 'package:islami_app/core/constants/app_images.dart';
import 'package:islami_app/core/utils/loaders.dart';
import 'package:islami_app/features/quran/data/models/sura_model.dart';
import 'package:islami_app/features/quran_details/presentation/views/widgets/sura_name_and_borders.dart';
import 'package:islami_app/features/quran_details/presentation/views_model/quran_details_cubit.dart';
import 'package:islami_app/features/quran_details/presentation/views_model/quran_details_state.dart';

class QuranDetailsViewBody extends StatelessWidget {
  const QuranDetailsViewBody({super.key, required this.suraData});
  final SuraModel suraData;
  @override
  Widget build(BuildContext context) {
    final controller = BlocProvider.of<QuranDetailsCubit>(context);
    return Column(
      children: [
        Expanded(
          child: RPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SuraNameAndBorders(suraNameArabic: suraData.suraNameAr),
                BlocConsumer<QuranDetailsCubit,QuranDetailsState>(
                  buildWhen: (previous, current) => current is LoadSuraSuccessState,
                  listener: (context, state) {
                    if(state is LoadSuraFailureState){
                      Loaders.customSnackBar(title: "Sura Loading Error.", context: context, message: state.failureMessage, secondsDuration: 2);
                    }
                  },
                  builder: (context, state) => Expanded(
                    child: controller.isLoading?
                     const LoadingIndicator()
                    :SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Text(
                        controller.suraData,
                        style: AppFonts.fontSize20Bold.copyWith(height: 2),
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Image.asset(
            AppImages.suraDetailsScreenFooterImage,
          width: ScreenUtil().screenWidth,
          height: 112.h,
          fit: BoxFit.cover,
        )
      ],
    );
  }
}