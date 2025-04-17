import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/core/constants/app_fonts.dart';
import 'package:islami_app/core/constants/app_images.dart';
import 'package:islami_app/features/sebha/presentation/views_model/sebha_cubit.dart';
import 'package:islami_app/features/sebha/presentation/views_model/sebha_state.dart';

class SebhaContent extends StatefulWidget {
  const SebhaContent({super.key});

  @override
  State<SebhaContent> createState() => _SebhaContentState();
}

class _SebhaContentState extends State<SebhaContent>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  double _turns = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500), // Rotation speed
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
  }

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
                        top: 8.h,
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
                        child: GestureDetector(
                          onTap: () {
                            _rotateImage();
                            sebhaController.changeSebhaContent();
                          },
                          child: AnimatedBuilder(
                            animation: _animation,
                            builder: (_, child) => RotationTransition(
                              turns: _animation,
                              child: Image.asset(
                                AppImages.sebhaBody,
                                width: 379.w,
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
                  builder: (context, state) => Text(
                    sebhaController.currentSebhaContent,
                    textDirection: TextDirection.rtl,
                    style: AppFonts.fontSize36Bold,
                  ),
                ),
                Positioned(
                  bottom: 140.h,
                  child: BlocBuilder<SebhaCubit, SebhaState>(
                    builder: (context, state) => Text(
                      sebhaController.sebhaCounter.toString(),
                      style: AppFonts.fontSize36Bold,
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

  void _rotateImage() {
    setState(() {
      _turns += 1;
    });
    _controller.reset();
    _animation = Tween<double>(
      begin: _turns - 1,
      end: _turns,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
