import 'package:get/get.dart';
import '../../navigators/routes_management.dart';

class LoadingController extends GetxController {

  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 3), () {
      RouteManagement.goToTutorial();
    });
    super.onInit();
  }
}
