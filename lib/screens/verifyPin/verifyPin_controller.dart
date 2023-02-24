import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../util/app_util.dart';
import '../../util/localization_strings.dart';

class VerifyPinController extends GetxController {
  RxBool canResendOTP = true.obs;
  int pinLength = 4;
  RxBool hasError = false.obs;
  RxBool otpFilled = false.obs;

  TextEditingController pinController = TextEditingController(text: "");

  otpTextFilled(String otp) {
    otpFilled.value = otp.length == pinLength;
    hasError.value = false;

    update();
  }

  otpCompleted() {
    otpFilled.value = true;
    hasError.value = false;

    update();
  }

  updateCanResend() {
    canResendOTP.value = true;
    update();
  }

  void resendOTP({required String token, required BuildContext context}) {
    AppUtil.checkInternet().then((value) {
      if (value) {
        // EasyLoading.show(status: LocalizationString.loading);
        // ApiController().resendOTP(token).then((response) async {
        //   EasyLoading.dismiss();
        //   showSuccessMessage(response.message, context);
        //   canResendOTP.value = false;
        //
        //   update();
        // });
      } else {
        showErrorMessage(LocalizationString.noInternet, context);
      }
    });
  }

  void callVerifyOTP(
      {required bool isVerifyingEmail,
        required String otp,
        required String token,
        required BuildContext context}) {
    AppUtil.checkInternet().then((value) {
      if (value) {
        // EasyLoading.show(status: LocalizationString.loading);
        // ApiController()
        //     .verifyOTP(isVerifyingEmail, otp, token)
        //     .then((response) async {
        //   EasyLoading.dismiss();
        //
        //   if (response.success) {
        //     Future.delayed(const Duration(milliseconds: 500), () {
        //       if (isVerifyingEmail == true) {
        //         AppUtil.showToast(
        //             context: context,
        //             message: LocalizationString.registeredSuccessFully,
        //             isSuccess: true);
        //         Get.to(() => const LoginScreen());
        //       } else {
        //         Get.to(() => ResetPasswordScreen(token: response.token!));
        //       }
        //     });
        //   } else {
        //     AppUtil.showToast(
        //         context: context, message: response.message, isSuccess: false);
        //   }
        // });
      } else {
        AppUtil.showToast(
            context: context,
            message: LocalizationString.noInternet,
            isSuccess: false);
      }
    });
  }

  showSuccessMessage(String message, BuildContext context) {
    AppUtil.showToast(context: context, message: message, isSuccess: true);
  }

  showErrorMessage(String message, BuildContext context) {
    AppUtil.showToast(context: context, message: message, isSuccess: false);
  }
}
