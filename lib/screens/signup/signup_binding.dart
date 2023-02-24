import 'package:foap/screens/signup/signup_controller.dart';
import 'package:get/get.dart';

class SingUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      SignupController.new,
    );
  }
}
