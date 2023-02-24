import 'package:foap/screens/verifyPin/verifyPin_controller.dart';
import 'package:get/get.dart';

/// A list of bindings which will be used in the route of [SplashScreen].
class VerifyPinBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      VerifyPinController.new,
    );
  }
}
