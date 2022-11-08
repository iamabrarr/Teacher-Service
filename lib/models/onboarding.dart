import 'package:teacher_service/constants/images.dart';

class OnBoardingModel {
  String text, image;
  OnBoardingModel({required this.image, required this.text});
}

List<OnBoardingModel> onboardings = [
  OnBoardingModel(
      image: onBoardingOne,
      text:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the ."),
  OnBoardingModel(
      image: onBoardingTwo,
      text:
          "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin."),
  OnBoardingModel(
      image: onBoardingThree,
      text:
          "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout."),
];
