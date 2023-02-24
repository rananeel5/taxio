import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Taxio/screens/verifyPin/verifyPin_controller.dart';
import 'package:Taxio/util/extension.dart';
import 'package:get/get.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import '../../components/top_navigation_bar.dart';
import '../../theme/common_colors.dart';
import '../../util/localization_strings.dart';

class VerifyPinScreen extends StatelessWidget {
  const VerifyPinScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ThemeColor.primaryBackgroundColor,
        body: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: GetBuilder<VerifyPinController>(
                builder: (controller) => Column(children: [
                  backNavigationBar(
                    context: context,
                    title: LocalizationString.createNewPin,
                  ).tp(50.sp),
                  Expanded(
                      child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Obx(() => PinCodeTextField(
                                autofocus: true,
                                controller: controller.pinController,
                                highlightColor: Colors.blue,
                                defaultBorderColor: Colors.transparent,
                                hasTextBorderColor: Colors.transparent,
                                pinBoxColor: Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.5),
                                highlightPinBoxColor:
                                Theme.of(context).primaryColor,
                                maxLength: controller.pinLength,
                                hasError: controller.hasError.value,
                                onTextChanged: (text) {
                                  controller.otpTextFilled(text);
                                },
                                onDone: (text) {
                                  controller.otpCompleted();
                                },
                                pinBoxWidth: 50,
                                pinBoxHeight: 50,
                                // hasUnderline: true,
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
                              Obx(() => Row(
                                children: [
                                  Text(LocalizationString.didntReceivedCode,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge),
                                  Text(LocalizationString.resendOTP,
                                      style: controller
                                          .canResendOTP.value ==
                                          false
                                          ? Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(
                                          fontWeight:
                                          FontWeight.w600,
                                          color: Theme.of(context)
                                              .disabledColor)
                                          : Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(
                                          color: Theme.of(context)
                                              .primaryColor,
                                          fontWeight:
                                          FontWeight.w600))
                                      .ripple(() {
                                    if (controller.canResendOTP.value == true) {
                                      controller.resendOTP(
                                          token: '', context: context);
                                    }
                                  }),
                                  controller.canResendOTP.value == false
                                      ? TweenAnimationBuilder<Duration>(
                                      duration: const Duration(minutes: 2),
                                      tween: Tween(
                                          begin: const Duration(minutes: 2),
                                          end: Duration.zero),
                                      onEnd: () =>
                                          controller.updateCanResend(),
                                      builder: (BuildContext context,
                                          Duration value, Widget? child) {
                                        final minutes = value.inMinutes;
                                        final seconds =
                                            value.inSeconds % 60;
                                        return Text(' ($minutes:$seconds)',
                                            textAlign: TextAlign.center,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge!
                                                .copyWith(
                                                color: Theme.of(context)
                                                    .primaryColor));
                                      })
                                      : Container()
                                ],
                              )).setPadding(top: 20, bottom: 25),
                            ],
                          ).setPadding(left: 24.sp, right: 24.sp)))
                ]))));
  }

// addSubmitBtn() {
//   return FilledButtonType1(
//     onPress: () {
//       loginController.callVerifyOTP(
//           isVerifyingEmail: widget.isVerifyingEmail,
//           otp: controller.text,
//           token: widget.token,
//           context: context);
//     },
//     text: LocalizationString.verify,
//     enabledTextStyle: Theme.of(context)
//         .textTheme
//         .bodyLarge!
//         .copyWith(fontWeight: FontWeight.w900, color: Colors.white),
//     isEnabled: true,
//   );
// }
}
