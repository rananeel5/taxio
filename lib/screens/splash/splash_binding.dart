import 'package:foap/screens/splash/splash_controller.dart';
import 'package:get/get.dart';

/// A list of bindings which will be used in the route of [SplashScreen].
class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      SplashController.new,
    );
  }
}
