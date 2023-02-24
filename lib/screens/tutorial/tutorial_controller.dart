import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';

import '../../util/localization_strings.dart';

class TutorialController extends GetxController {
  CarouselController carouselController = CarouselController();
  int selectedSliderIndex = 0;

  List<String> imgList = [
    "assets/walkthrough1.png",
    "assets/walkthrough2.png",
    "assets/walkthrough3.png",
  ];

  List<String> headings = [
    LocalizationString.walkthrough1,
    LocalizationString.walkthrough2,
    LocalizationString.walkthrough3
  ];

  void onPageChanged(int index) {
    selectedSliderIndex = index;
    update();
  }
}
