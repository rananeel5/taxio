import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Taxio/components/custom_texts.dart';
import 'package:Taxio/util/extension.dart';
import 'package:get/get.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

import '../../components/app_buttons.dart';
import '../../components/top_navigation_bar.dart';
import '../../theme/common_colors.dart';
import '../../util/localization_strings.dart';
import 'createNewPin_controller.dart';

class CreateNewPinScreen extends StatelessWidget {
  const CreateNewPinScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ThemeColor.primaryBackgroundColor,
        body: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: GetBuilder<CreateNewPinController>(
              builder: (controller) => SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Column(children: [
                    backNavigationBar(
                      context: context,
                      title: LocalizationString.createNewPin,
                    ).tp(50.sp),
                    Expanded(
                      child: Column(
                        children: [
                          BodyExtraLargeText(
                            LocalizationString.createNewPinInfo,
                            weight: TextWeight.regular,
                            color: TextColor.grayscale900,
                            textAlign: TextAlign.center,
                          ).setPadding(top: 115.sp, bottom: 80.sp),
                          Obx(() => PinCodeTextField(
                                autofocus: true,
                                hideCharacter: true,
                                pinBoxRadius: 12.r,
                                pinBoxWidth: 83.sp,
                                pinBoxHeight: 61.sp,
                                controller: controller.pinController,
                                highlightColor: TextColor.grayscale100,
                                pinBoxColor: TextColor.grayscale100,
                                highlightPinBoxColor: TextColor.grayscale100,
                                pinBoxBorderWidth: 1.sp,
                                defaultBorderColor: TextColor.grayscale200,
                                hasTextBorderColor: TextColor.grayscale200,
                                maxLength: controller.pinLength,
                                hasError: controller.hasError.value,
                                onTextChanged: (text) {
                                  controller.otpCompleted();
                                },
                                onDone: (text) {
                                  controller.otpCompleted();
                                },
                                wrapAlignment: WrapAlignment.spaceAround,
                                pinBoxDecoration: ProvidedPinBoxDecoration
                                    .defaultPinBoxDecoration,
                                pinTextStyle: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(fontWeight: FontWeight.w600),
                                pinTextAnimatedSwitcherTransition:
                                    ProvidedPinBoxTextAnimation
                                        .scalingTransition,
                                pinTextAnimatedSwitcherDuration:
                                    const Duration(milliseconds: 300),
                                highlightAnimationBeginColor: Colors.black,
                                highlightAnimationEndColor: Colors.white12,
                                keyboardType: TextInputType.number,
                              )),
                        ],
                      ).setPadding(left: 24.sp, right: 24.sp),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        FilledButtonType(
                                text: LocalizationString.continueStr,
                                isEnabled: true,
                                enabledBackgroundColor:
                                    ThemeColor.primaryThemeColor,
                                cornerRadius: 25.sp,
                                onPress: () => {})
                            .setPadding(
                                left: 24.sp, right: 24.sp, bottom: 48.sp),
                      ],
                    )
                  ])),
            )));
  }
}
