import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../util/app_util.dart';
import '../../util/form_validator.dart';
import '../../util/localization_strings.dart';

class LoginController extends GetxController {
  RxBool isRemember = false.obs;

  void markRememberMe() {
    isRemember.value = !isRemember.value;
    update();
  }

  void login(String email, String password, BuildContext context) {
    if (FormValidator().isTextEmpty(email)) {
      showErrorMessage(LocalizationString.pleaseEnterValidEmail, context);
    } else if (FormValidator().isTextEmpty(password)) {
      showErrorMessage(LocalizationString.pleaseEnterPassword, context);
    } else {
      AppUtil.checkInternet().then((value) {
        if (value) {
          // EasyLoading.show(status: LocalizationString.loading);
          // ApiController().login(email, password).then((response) async {
          //   if (response.success) {
          //     EasyLoading.dismiss();
          //     await SharedPrefs().setAuthorizationKey(response.authKey!);
          //     await getIt<UserProfileManager>().refreshProfile();
          //     await _settingsController.getSettings();
          //     getIt<SocketManager>().connect();
          //
          //     // ask for location
          //     getIt<LocationManager>().postLocation();
          //
          //     SharedPrefs().setUserLoggedIn(true);
          //     Get.offAll(() => const DashboardScreen());
          //   } else {
          //     EasyLoading.dismiss();
          //     if (response.token != null) {
          //       Get.to(() => VerifyOTPScreen(
          //             isVerifyingEmail: true,
          //             token: response.token!,
          //           ));
          //     } else {
          //       EasyLoading.dismiss();
          //       showErrorMessage(response.message, context);
          //     }
          //   }
          // });
        } else {
          showErrorMessage(LocalizationString.noInternet, context);
        }
      });
    }
  }

  showSuccessMessage(String message, BuildContext context) {
    AppUtil.showToast(context: context, message: message, isSuccess: true);
  }

  showErrorMessage(String message, BuildContext context) {
    AppUtil.showToast(context: context, message: message, isSuccess: false);
  }
}
