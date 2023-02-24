import 'package:foap/screens/signup/signup_screen.dart';
import 'package:get/get.dart';

import 'app_pages.dart';

/// A chunk of routes taken in the application.
///
/// Will be ignored for test since all are static values and would not change.
abstract class RouteManagement {
  static void goToLoading() {
    Get.offAllNamed<void>(
      Routes.loading,
    );
  }

  static void goToTutorial() {
    Get.offAllNamed<void>(
      Routes.tutorial,
    );
  }

  static void goToLanding() {
    Get.toNamed<void>(
      Routes.landing,
    );
  }

  static void goToLogin() {
    Get.toNamed<void>(
      Routes.login,
    );
  }

  static void goToSignUp() {
    Get.toNamed<void>(
      Routes.signup,
    );
  }

  static void goToSetProfile() {
    Get.toNamed<void>(
      Routes.setProfile,
    );
  }

  static void goToCreateNewPin() {
    Get.toNamed<void>(
      Routes.createNewPin,
    );
  }
  //
  // static void goToForgotPassword() {
  //   Get.toNamed<void>(
  //     Routes.forgotPassword,
  //   );
  // }
}
