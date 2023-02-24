import 'dart:io';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';

class SetProfileController extends GetxController {
  XFile? image;
  final picker = ImagePicker();

  void updateImage(XFile selection) {
    image = selection;
    update();
  }
}