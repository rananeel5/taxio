import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foap/components/rounded_input_field.dart';
import 'package:foap/screens/SetProfile/setProfile_controller.dart';
import 'package:foap/util/extension.dart';
import 'package:foap/util/localization_strings.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../components/app_buttons.dart';
import '../../components/custom_texts.dart';
import '../../components/shimmer_widgets.dart';
import '../../components/top_navigation_bar.dart';
import '../../navigators/routes_management.dart';
import '../../theme/common_colors.dart';
import '../../theme/icon_enum.dart';

class SetProfileScreen extends StatelessWidget {
  const SetProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ThemeColor.primaryBackgroundColor,
        body: GetBuilder<SetProfileController>(
            builder: (controller) => Column(
                  children: [
                    backNavigationBar(
                      context: context,
                      title: LocalizationString.fillProfile,
                    ).tp(50.sp),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(children: [
                          Stack(children: [
                            Container(
                              height: 140.sp,
                              width: 140.sp,
                              color: Colors.white,
                              child: controller.image == null
                                  ? Image.asset(
                                      'assets/profile.png',
                                      width: 30.sp,
                                      height: 30.sp,
                                    )
                                  : Image.file(File(controller.image!.path),
                                      fit: BoxFit.cover),
                            ),
                            Positioned.fill(
                              child: Align(
                                  alignment: Alignment.bottomRight,
                                  child: Image.asset(
                                    'assets/editProfile.png',
                                    width: 24.sp,
                                    height: 24.sp,
                                  ).rP16.round(70).ripple(() {
                                    openImagePickingPopup(context, controller);
                                  })),
                            ),
                          ]).tp(24.sp),
                          addInputField(LocalizationString.fullName).tp(24.sp),
                          addInputField(LocalizationString.nickname).tp(24.sp),
                          addDateField(LocalizationString.dob).tp(24.sp),
                          addInputField(LocalizationString.email,
                                  icon: ThemeIcon.emailOutlined)
                              .tp(24.sp),
                          addMobileField(LocalizationString.phone).tp(24.sp),
                          addInputField(LocalizationString.gender,
                                  icon: ThemeIcon.downArrow,
                                  isDisabled: true,
                                  onTap: () {})
                              .tp(24.sp),
                          FilledButtonType(
                                  text: LocalizationString.continueStr,
                                  isEnabled: true,
                                  enabledBackgroundColor:
                                      ThemeColor.primaryThemeColor,
                                  cornerRadius: 25.sp,
                                  onPress: () => RouteManagement.goToCreateNewPin())
                              .setPadding(top: 24.sp, bottom: 24.sp),
                        ]).setPadding(left: 24.sp, right: 24.sp),
                      ),
                    ),
                  ],
                )));
  }

  void openImagePickingPopup(
      BuildContext context, SetProfileController controller) {
    Get.bottomSheet(
      Wrap(
        children: [
          Text(LocalizationString.addPhoto,
                  style: Theme.of(context).textTheme.bodyLarge)
              .setPadding(left: 20, right: 20, top: 20, bottom: 25),
          ListTile(
              leading: Icon(Icons.camera_alt_outlined,
                  color: Theme.of(context).iconTheme.color),
              title: Text(LocalizationString.takePhoto),
              onTap: () {
                Get.back();
                controller.picker
                    .pickImage(source: ImageSource.camera)
                    .then((pickedFile) {
                  if (pickedFile != null) {
                    controller.updateImage(pickedFile);
                  }
                });
              }),
          divider(context: context),
          ListTile(
              leading: Icon(Icons.wallpaper_outlined,
                  color: Theme.of(context).iconTheme.color),
              title: Text(LocalizationString.chooseFromGallery),
              onTap: () async {
                Get.back();
                controller.picker
                    .pickImage(source: ImageSource.gallery)
                    .then((pickedFile) {
                  if (pickedFile != null) {
                    controller.updateImage(pickedFile);
                  }
                });
              }),
          divider(context: context),
          ListTile(
              leading:
                  Icon(Icons.close, color: Theme.of(context).iconTheme.color),
              title: Text(LocalizationString.cancel),
              onTap: () => Get.back()),
        ],
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  Widget addInputField(String hint,
      {ThemeIcon? icon, bool? isDisabled, VoidCallback? onTap}) {
    return InputField(
      hintText: hint,
      cornerRadius: 12.r,
      backgroundColor: TextColor.grayscale100,
      textStyle: TextStyle(
          fontSize: FontSizes.b3.sp,
          color: TextColor.grayscale900,
          fontWeight: TextWeight.semiBold),
      hintStyle: TextStyle(
          fontSize: FontSizes.b3.sp,
          color: TextColor.grayscale500,
          fontWeight: TextWeight.regular),
      icon: icon,
      iconColor: TextColor.grayscale500,
      iconOnRightSide: icon != null,
      isDisabled: isDisabled,
      onTap: onTap,
    );
  }

  Widget addDateField(String hint) {
    return InputDateField(
        hintText: hint,
        cornerRadius: 12.r,
        backgroundColor: TextColor.grayscale100,
        textStyle: TextStyle(
            fontSize: FontSizes.b3.sp,
            color: TextColor.grayscale900,
            fontWeight: TextWeight.semiBold),
        hintStyle: TextStyle(
            fontSize: FontSizes.b3.sp,
            color: TextColor.grayscale500,
            fontWeight: TextWeight.regular),
        icon: ThemeIcon.calendar,
        iconColor: TextColor.grayscale500,
        iconOnRightSide: true);
  }

  Widget addMobileField(String hint) {
    return InputMobileNumberField(
        hintText: hint,
        cornerRadius: 12.r,
        backgroundColor: TextColor.grayscale100,
        phoneCodeText: '+91',
        textStyle: TextStyle(
            fontSize: FontSizes.b3.sp,
            color: TextColor.grayscale900,
            fontWeight: TextWeight.semiBold),
        hintStyle: TextStyle(
            fontSize: FontSizes.b3.sp,
            color: TextColor.grayscale500,
            fontWeight: TextWeight.regular),
        onChanged: (num) {},
        phoneCodeValueChanged: (num) {});
  }
}
