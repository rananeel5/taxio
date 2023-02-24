import 'package:get/get.dart';
import 'createNewPin_controller.dart';

class CreateNewPinBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      CreateNewPinController.new,
    );
  }
}
