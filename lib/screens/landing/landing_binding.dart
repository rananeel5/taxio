import 'package:get/get.dart';

import 'landing_controller.dart';

/// A list of bindings which will be used in the route of [SplashScreen].
class LandingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      LandingController.new,
    );
  }
}
