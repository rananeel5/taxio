import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class SignupController extends GetxController {
  RxBool isRemember = false.obs;

  void markRememberMe() {
    isRemember.value = !isRemember.value;
    update();
  }

// RxString passwordStrengthText = ''.obs;
  // RxDouble passwordStrength = 0.toDouble().obs;
  // //
  // RegExp numReg = RegExp(r".*[0-9].*");
  // RegExp letterReg = RegExp(r".*[A-Za-z].*");
  //
  // void login(String email, String password, BuildContext context) {
  //   if (FormValidator().isTextEmpty(email)) {
  //     showErrorMessage(LocalizationString.pleaseEnterValidEmail, context);
  //   } else if (FormValidator().isTextEmpty(password)) {
  //     showErrorMessage(LocalizationString.pleaseEnterPassword, context);
  //   } else {
  //     AppUtil.checkInternet().then((value) {
  //       if (value) {
  //         // EasyLoading.show(status: LocalizationString.loading);
  //         // ApiController().login(email, password).then((response) async {
  //         //   if (response.success) {
  //         //     EasyLoading.dismiss();
  //         //     await SharedPrefs().setAuthorizationKey(response.authKey!);
  //         //     await getIt<UserProfileManager>().refreshProfile();
  //         //     await _settingsController.getSettings();
  //         //     getIt<SocketManager>().connect();
  //         //
  //         //     // ask for location
  //         //     getIt<LocationManager>().postLocation();
  //         //
  //         //     SharedPrefs().setUserLoggedIn(true);
  //         //     Get.offAll(() => const DashboardScreen());
  //         //   } else {
  //         //     EasyLoading.dismiss();
  //         //     if (response.token != null) {
  //         //       Get.to(() => VerifyOTPScreen(
  //         //             isVerifyingEmail: true,
  //         //             token: response.token!,
  //         //           ));
  //         //     } else {
  //         //       EasyLoading.dismiss();
  //         //       showErrorMessage(response.message, context);
  //         //     }
  //         //   }
  //         // });
  //       } else {
  //         showErrorMessage(LocalizationString.noInternet, context);
  //       }
  //     });
  //   }
  // }
  //
  // checkPassword(String password) {
  //   password = password.trim();
  //
  //   if (password.isEmpty) {
  //     passwordStrength.value = 0;
  //     passwordStrengthText.value = 'Please enter you password';
  //   } else if (password.length < 6) {
  //     passwordStrength.value = 1 / 4;
  //     passwordStrengthText.value = 'Your password is too short';
  //   } else if (password.length < 8) {
  //     passwordStrength.value = 2 / 4;
  //     passwordStrengthText.value = 'Your password is acceptable but not strong';
  //   } else {
  //     if (!letterReg.hasMatch(password) || !numReg.hasMatch(password)) {
  //       // Password length >= 8
  //       // But doesn't contain both letter and digit characters
  //       passwordStrength.value = 3 / 4;
  //       passwordStrengthText.value =
  //       'Your password must contain letter and number';
  //     } else {
  //       // Password length >= 8
  //       // Password contains both letter and digit characters
  //       passwordStrength.value = 1;
  //       passwordStrengthText.value = 'Your password is great';
  //     }
  //   }
  // }
  //
  // void register(
  //     {required String email,
  //       required String name,
  //       required String password,
  //       required String confirmPassword,
  //       required BuildContext context}) {
  //   if (FormValidator().isTextEmpty(name) || userNameCheckStatus != 1) {
  //     showErrorMessage(LocalizationString.pleaseEnterValidUserName, context);
  //   }
  //   if (name.contains(' ')) {
  //     showErrorMessage(LocalizationString.userNameCanNotHaveSpace, context);
  //   } else if (FormValidator().isTextEmpty(email)) {
  //     showErrorMessage(LocalizationString.pleaseEnterValidEmail, context);
  //   } else if (FormValidator().isNotValidEmail(email)) {
  //     showErrorMessage(LocalizationString.pleaseEnterValidEmail, context);
  //   } else if (FormValidator().isTextEmpty(password)) {
  //     showErrorMessage(LocalizationString.pleaseEnterPassword, context);
  //   } else if (FormValidator().isTextEmpty(confirmPassword)) {
  //     showErrorMessage(LocalizationString.pleaseEnterConfirmPassword, context);
  //   } else if (password != confirmPassword) {
  //     showErrorMessage(LocalizationString.passwordsDoesNotMatched, context);
  //   } else {
  //     AppUtil.checkInternet().then((value) {
  //       if (value) {
  //         // EasyLoading.show(status: LocalizationString.loading);
  //         //
  //         // ApiController()
  //         //     .registerUser(name, email, password)
  //         //     .then((response) async {
  //         //   if (response.success) {
  //         //     EasyLoading.dismiss();
  //         //     Get.to(() => VerifyOTPScreen(
  //         //           isVerifyingEmail: true,
  //         //           token: response.token!,
  //         //         ));
  //         //   } else {
  //         //     EasyLoading.dismiss();
  //         //     showErrorMessage(response.message, context);
  //         //   }
  //         // });
  //       } else {
  //         showErrorMessage(LocalizationString.noInternet, context);
  //       }
  //     });
  //   }
  // }
  //
  // void resetPassword(
  //     {required String newPassword,
  //       required String confirmPassword,
  //       required String token,
  //       required BuildContext context}) {
  //   if (FormValidator().isTextEmpty(newPassword)) {
  //     showErrorMessage(LocalizationString.pleaseEnterPassword, context);
  //   } else if (FormValidator().isTextEmpty(confirmPassword)) {
  //     showErrorMessage(LocalizationString.pleaseEnterConfirmPassword, context);
  //   } else if (newPassword != confirmPassword) {
  //     showErrorMessage(LocalizationString.passwordsDoesNotMatched, context);
  //   } else {
  //     AppUtil.checkInternet().then((value) {
  //       if (value) {
  //         // ApiController()
  //         //     .resetPassword(newPassword, token)
  //         //     .then((response) async {
  //         //   if (response.success) {
  //         //     passwordReset = true;
  //         //     update();
  //         //   } else {
  //         //     showErrorMessage(response.message, context);
  //         //   }
  //         // });
  //       } else {
  //         showErrorMessage(LocalizationString.noInternet, context);
  //       }
  //     });
  //   }
  // }
  // void forgotPassword({required String email, required BuildContext context}) {
  //   if (FormValidator().isTextEmpty(email)) {
  //     AppUtil.showToast(
  //         context: context,
  //         message: LocalizationString.pleaseEnterEmail,
  //         isSuccess: false);
  //   } else if (FormValidator().isNotValidEmail(email)) {
  //     AppUtil.showToast(
  //         context: context,
  //         message: LocalizationString.pleaseEnterValidEmail,
  //         isSuccess: false);
  //   } else {
  //     AppUtil.checkInternet().then((value) {
  //       if (value) {
  //         // EasyLoading.show(status: LocalizationString.loading);
  //         // ApiController().forgotPassword(email).then((response) async {
  //         //   EasyLoading.dismiss();
  //         //   AppUtil.showToast(
  //         //       context: context, message: response.message, isSuccess: true);
  //         //   if (response.success) {
  //         //     Get.to(() => VerifyOTPScreen(
  //         //           isVerifyingEmail: false,
  //         //           token: response.token!,
  //         //         ));
  //         //   }
  //         // });
  //       } else {
  //         AppUtil.showToast(
  //             context: context,
  //             message: LocalizationString.noInternet,
  //             isSuccess: false);
  //       }
  //     });
  //   }
  // }
  //
  // showSuccessMessage(String message, BuildContext context) {
  //   AppUtil.showToast(context: context, message: message, isSuccess: true);
  // }
  //
  // showErrorMessage(String message, BuildContext context) {
  //   AppUtil.showToast(context: context, message: message, isSuccess: false);
  // }
}
