import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/core/constants/app_images.dart';
import 'package:islami_app/features/azkar/presentation/views/azkar_view.dart';
import 'package:islami_app/features/time/presentation/views/widgets/azkar_item.dart';
import 'package:islami_app/features/time/presentation/views_model/time_cubit.dart';

class AzkarRow extends StatelessWidget {
  const AzkarRow({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = BlocProvider.of<TimeCubit>(context);
    return Expanded(
      child: Row(
        children: [
          Expanded(
            child: AzkarItem(
              image: AppImages.morningAzkar,
              title: "Morning Azkar",
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => AzkarView(
                      azkarList: controller.morningAzkar,
                    ),
                  ),
                );
              },
            ),
          ),
          const RSizedBox(
            width: 20,
          ),
          Expanded(
            child: AzkarItem(
              image: AppImages.eveningAzkar,
              title: "Evening Azkar",
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => AzkarView(
                      azkarList: controller.eveningAzkar,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
