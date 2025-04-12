class OnBoardingModel{
  const OnBoardingModel({
    required this.image,
    required this.title,
    this.subTitle,
  });
  final String image;
  final String title;
  final String? subTitle;
}