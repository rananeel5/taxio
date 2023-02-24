import 'package:foap/screens/loading/loading_controller.dart';
import 'package:get/get.dart';

/// A list of bindings which will be used in the route of [SplashScreen].
class LoadingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      LoadingController.new,
    );
  }
}
