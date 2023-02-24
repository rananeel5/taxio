import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foap/main.dart';
import 'package:foap/screens/tutorial/tutorial_controller.dart';
import 'package:foap/util/extension.dart';
import 'package:get/get.dart';
import '../../components/app_buttons.dart';
import '../../components/custom_texts.dart';
import '../../navigators/routes_management.dart';
import '../../theme/common_colors.dart';
import '../../util/localization_strings.dart';

class TutorialScreen extends StatelessWidget {
  const TutorialScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ThemeColor.primaryBackgroundColor,
        body: GetBuilder<TutorialController>(
            builder: (controller) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    Column(children: [
                      CarouselSlider(
                        carouselController: controller
                            .carouselController, // Give the controller
                        options: CarouselOptions(
                          viewportFraction: 1,
                          autoPlayCurve: Curves.fastOutSlowIn,
                          aspectRatio: 1,
                          onPageChanged: (index, reason) {
                            controller.onPageChanged(index);
                          },
                        ),
                        items: [
                          for (String img in controller.imgList)
                            Image.asset(
                              img,
                              fit: BoxFit.cover,
                            )
                        ],
                      ).setPadding(left: 49.sp, top: 100.sp, right: 49.sp),
                      Heading2Text(
                              controller
                                  .headings[controller.selectedSliderIndex],
                              color: isDarkTheme
                                  ? TextColor.white
                                  : TextColor.grayscale900,
                              weight: TextWeight.bold,
                              textAlign: TextAlign.center)
                          .paddingOnly(top: 60.sp, left: 24.sp, right: 24.sp),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          DotsIndicator(
                            decorator: DotsDecorator(
                              spacing: EdgeInsets.all(2.sp),
                              activeColor: ThemeColor.primaryThemeColor,
                              color: isDarkTheme
                                  ? ThemeColor.dark3
                                  : TextColor.grayscale300,
                              size: Size(8.sp, 8.sp),
                              activeSize: Size(32.sp, 8.sp),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.r),
                              ),
                              activeShape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.r),
                              ),
                            ),
                            dotsCount: controller.imgList.length,
                            position:
                                controller.selectedSliderIndex.toDouble(),
                          ),
                        ],
                      ).paddingOnly(top: 40.sp, bottom: 40.sp)
                    ]),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        FilledButtonType(
                                text: controller.selectedSliderIndex ==
                                        controller.imgList.length - 1
                                    ? LocalizationString.getStarted
                                    : LocalizationString.next,
                                isEnabled: true,
                                enabledBackgroundColor:
                                    ThemeColor.primaryThemeColor,
                                cornerRadius: 25.sp,
                                onPress: () {
                                  controller.selectedSliderIndex ==
                                          controller.imgList.length - 1
                                      ? RouteManagement.goToLanding()
                                      : controller.carouselController
                                          .nextPage();
                                })
                            .setPadding(
                                left: 24.sp, right: 24.sp, bottom: 8.sp)
                      ],
                    )
                  ],
                )));
  }
}
