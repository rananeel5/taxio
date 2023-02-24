import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../util/app_util.dart';
import '../../util/localization_strings.dart';

class CreateNewPinController extends GetxController {
  int pinLength = 4;
  RxBool hasError = false.obs;
  TextEditingController pinController = TextEditingController(text: "");

  otpCompleted() {
    hasError.value = false;
    update();
  }

  void createPinApi({required String token, required BuildContext context}) {
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

  showSuccessMessage(String message, BuildContext context) {
    AppUtil.showToast(context: context, message: message, isSuccess: true);
  }

  showErrorMessage(String message, BuildContext context) {
    AppUtil.showToast(context: context, message: message, isSuccess: false);
  }
}
