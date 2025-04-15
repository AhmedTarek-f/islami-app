import 'package:islami_app/core/constants/app_images.dart';
import 'package:islami_app/features/on_boarding/data/models/on_boarding_model.dart';

abstract final class AppData {
 static final List<OnBoardingModel> onBoardingList = const [
    OnBoardingModel(
      image: AppImages.onBoarding1,
      title: "Welcome To Islmi App",
    ),
    OnBoardingModel(
        image: AppImages.onBoarding2,
        title: "Welcome To Islami",
        subTitle: "We Are Very Excited To Have You In Our Community"
    ),
    OnBoardingModel(
        image: AppImages.onBoarding3,
        title: "Reading the Quran",
        subTitle: "Read, and your Lord is the Most Generous"
    ),
    OnBoardingModel(
        image: AppImages.onBoarding4,
        title: "Bearish",
        subTitle: "Praise the name of your Lord, the Most High"
    ),
    OnBoardingModel(
        image: AppImages.onBoarding5,
        title: "Holy Quran Radio",
        subTitle: "You can listen to the Holy Quran Radio through the application for free and easily"
    ),
  ];
}