import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/core/constants/app_fonts.dart';
import 'package:islami_app/core/constants/app_images.dart';
import 'package:islami_app/features/sebha/presentation/views_model/sebha_cubit.dart';
import 'package:islami_app/features/sebha/presentation/views_model/sebha_state.dart';

class SebhaContent extends StatelessWidget {
  const SebhaContent({super.key});

  @override
  Widget build(BuildContext context) {
    final sebhaController = BlocProvider.of<SebhaCubit>(context);
    return Expanded(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: 480.h,
                  width: 379.w,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 14.h,
                        right: 0,
                        left: 0,
                        child: Image.asset(
                          AppImages.sebhaUpperPart,
                          width: 145.w,
                          height: 86.h,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Positioned(
                        top: 86.h,
                        right: 0,
                        left:0,
                        child: GestureDetector(
                          onTap: () {
                            sebhaController.changeSebhaContent();
                          },
                          child: BlocBuilder<SebhaCubit,SebhaState>(
                            builder: (context, state) =>
                                Transform.rotate(
                                  angle: sebhaController.angle,
                                  child: Image.asset(
                                    AppImages.sebhaBody,
                                    width: ScreenUtil().screenWidth,
                                    height: 381.h,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                BlocBuilder<SebhaCubit, SebhaState>(
                  builder: (context, state) => GestureDetector(
                    onTap: () {
                      sebhaController.changeSebhaContent();
                    },
                    child: Text(
                      sebhaController.currentSebhaContent,
                      textDirection: TextDirection.rtl,
                      style: AppFonts.fontSize36Bold,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 140.h,
                  child: BlocBuilder<SebhaCubit, SebhaState>(
                    builder: (context, state) => GestureDetector(
                      onTap: () {
                        sebhaController.changeSebhaContent();
                      },
                      child: Text(
                        sebhaController.sebhaCounter.toString(),
                        style: AppFonts.fontSize36Bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}