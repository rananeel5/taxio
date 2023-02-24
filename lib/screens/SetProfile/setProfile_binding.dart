import 'package:Taxio/screens/SetProfile/setProfile_controller.dart';
import 'package:get/get.dart';

class SetProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      SetProfileController.new,
    );
  }
}
