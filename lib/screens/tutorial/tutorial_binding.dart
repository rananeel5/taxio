import 'package:foap/screens/tutorial/tutorial_controller.dart';
import 'package:get/get.dart';

/// A list of bindings which will be used in the route of [SplashScreen].
class TutorialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      TutorialController.new,
    );
  }
}
